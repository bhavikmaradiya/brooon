import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

import './revenue_cat/revenue_cat_purchase_api.dart';
import '../../common_property_data_provider.dart';
import '../../const/routes.dart';
import '../../localdb/isar_service.dart';
import '../../localdb/subscription/db_purchased_status.dart';
import '../../localdb/subscription/db_subscription_plan.dart';
import '../../network/dio_client.dart';
import '../../network/network_connectivity.dart';
import '../../utils/app_config.dart';
import '../../utils/choose_location_from_enum.dart';
import '../../utils/choose_plan_from_enum.dart';
import '../../utils/full_screen_progress.dart';
import '../../utils/static_functions.dart';
import '../../widgets/snack_bar_view.dart';

// Ref. For In app purchase: https://github.com/trey-a-hope/demos/blob/flutter_packages_in_app_purchase_1.0.8/lib/demo.dart
class SubscriptionProvider extends ChangeNotifier {
  final _isarService = IsarService();
  List<DbSubscriptionPlan> plansList = [];
  ChoosePlanFrom _choosePlanFromScreen = ChoosePlanFrom.splash;
  final InAppPurchase _inAppPurchase = InAppPurchase.instance;
  bool _inAppPurchaseAvailable = true;
  final List<String> _productIds = [];
  final List<DbPurchasedStatus> _purchases = [];
  final List<ProductDetails> _products = [];
  StreamSubscription<List<PurchaseDetails>>? _subscription;
  late BuildContext _context;
  late AppLocalizations _localizations;
  bool isNetworkAvailable = true;
  bool isUpgradeRequired = false;
  CommonPropertyDataProvider? _commonPropertyDataProvider;
  bool isFetchingPlans = false;

  init(
    ChoosePlanFrom from,
    BuildContext context,
    AppLocalizations localizations,
    CommonPropertyDataProvider? propertyDataProvider,
  ) async {
    _context = context;
    _localizations = localizations;
    _commonPropertyDataProvider = propertyDataProvider;
    _choosePlanFromScreen = from;
    _checkForUpgradeRequired();
    plansList = await _isarService.getSubscriptionPlans();
    // handle local variables to manage screen design
    if (plansList.isNotEmpty) {
      for (int i = 0; i < plansList.length; i++) {
        plansList[i]..isSelected = _checkForSelectedIndex(plansList[i].type!);
        _productIds.add(plansList[i].planId!);
      }
    }
    notifyListeners();
    checkForSubscriptions();
    _uploadAlreadyPurchasedSubscriptionInfoIfPending();
  }

  _checkForUpgradeRequired() {
    if (_choosePlanFromScreen == ChoosePlanFrom.splash) {
      // check for current plan if free plan available then upgrade required else choose any plan
      final subscribedPlanType = StaticFunctions.userInfo?.subscribedPlanType;
      if (subscribedPlanType == null) {
        isUpgradeRequired = false;
      } else if (subscribedPlanType
          .toLowerCase()
          .contains(AppConfig.freeTrialPlanType)) {
        isUpgradeRequired = true;
      } else {
        isUpgradeRequired = false;
      }
    } else {
      isUpgradeRequired = true;
    }
    notifyListeners();
  }

  checkForSubscriptions() async {
    if (plansList.isEmpty) {
      final isOnline = await NetworkConnectivity.hasNetwork();
      isNetworkAvailable = isOnline;
    }
    await _getSubscriptionPlans();
    notifyListeners();
  }

  bool _checkForSelectedIndex(String planType) {
    return StaticFunctions.userInfo?.subscribedPlanId == null
        ? planType.toLowerCase().contains(AppConfig.freeTrialPlanType)
        : planType.toLowerCase().contains(AppConfig.goldPlanType);
  }

  _getSubscriptionPlans() async {
    isFetchingPlans = true;
    notifyListeners();
    if (plansList.isEmpty) {
      FullScreenProgress.showFullScreenProgress(_context, true);
    }
    final response = await DioClient().getSubscriptionPlans();
    final plans = response?.data?.plans;
    if (plans != null && plans.isNotEmpty) {
      await _isarService.deletePlans();
      plansList.clear();
      _productIds.clear();
      plans.forEach(
        (element) {
          if (element.planId != null) {
            _productIds.add(element.planId!);
          }
          plansList.add(
            DbSubscriptionPlan()
              ..id = element.id!
              ..type = element.type
              ..planId = element.planId
              ..title = element.title
              ..description = element.description
              ..duration = element.duration
              ..price = element.price
              ..isSelected = _checkForSelectedIndex(element.type!),
          );
        },
      );
      await _isarService.saveSubscriptions(plansList);
      notifyListeners();
    }
    isFetchingPlans = false;
    notifyListeners();
    if (plansList.isNotEmpty) {
      _setListenerForPurchaseDetails();
    }
    FullScreenProgress.showFullScreenProgress(_context, false);
  }

  purchasePlan() {
    if (plansList.isEmpty) {
      return;
    }
    final selectedPlan = plansList.firstWhere((element) => element.isSelected);
    if (selectedPlan.type!
        .toLowerCase()
        .contains(AppConfig.freeTrialPlanType)) {
      _startFreeTrial();
    } else {
      _subscribeGoldPlanWithoutPayment();
      return;
      _subscribePlanWithRevenueCat();
      return;
      if (_inAppPurchaseAvailable && _products.isNotEmpty) {
        final product = _products.firstWhereOrNull(
          (element) => element.id == selectedPlan.planId,
        );
        if (product != null) {
          _subscribePlan(product: product);
        } else {
          _noActivePlanError();
        }
      } else {
        _noActivePlanError();
      }
    }
  }

  _subscribeGoldPlanWithoutPayment() {
    _uploadPurchaseItemToServer(
      DbPurchasedStatus()
        ..transactionDate = '1679485773321'
        ..productID = 'gold_plan'
        ..purchaseID = 'GPA.3311-6062-8810-32580'
        ..userId = StaticFunctions.userId
        ..planType = 'gold'
        ..planId = 2
        ..price = '3000'
        ..source = 'InAppPurchase'
        ..verificationToken =
            'alaachaffnkhlbokghhdhnkp.AO-J1Oxtni2IMiCON2iAPnwLuO5zHT-q6g-V_pX0b9qxcDwXdaODyoy-5Cp3un6P2FE_Y_txB2E_frRcAOdS9htvA4MaDV4ESA'
        ..purchaseStatus = 'purchased'
        ..uploadedToServer = false
        ..createdAt = DateTime.now()
        ..updatedAt = DateTime.now(),
    );
  }

  _startFreeTrial() async {
    final plan = plansList.firstWhereOrNull(
      (element) =>
          element.type != null &&
          element.type!.toLowerCase().contains(AppConfig.freeTrialPlanType),
    );
    if (plan != null) {
      _uploadPlanDetailsToServer(
        requestBody: {'plan_type': plan.type},
        planId: plan.id,
        planType: plan.type,
      );
    } else {
      _somethingWentWrongError();
    }
  }

  _uploadPlanDetailsToServer({
    required Map<String, dynamic> requestBody,
    required int? planId,
    required String? planType,
    String? purchaseId,
  }) async {
    FullScreenProgress.showFullScreenProgress(_context, true);
    final response = await DioClient().addSubscription(
      requestBody: requestBody,
      localization: _localizations,
    );
    if (response != null) {
      if (response.success == true && response.data != null) {
        if (planId != null && planType != null) {
          await _savePlan(planId, planType, response.data?.expiredAt ?? 0);
          if (purchaseId != null && purchaseId.isNotEmpty) {
            // update local purchase status
            await _isarService.updatePurchasedStatus(purchaseId);
          }
          _commonPropertyDataProvider?.updateSubscriptionStatus(localizationsContext: _localizations);
          FullScreenProgress.showFullScreenProgress(_context, false);
          _onPurchaseCompleted();
        }
      } else {
        FullScreenProgress.showFullScreenProgress(_context, false);
        SnackBarView.showSnackBar(_context, response.message ?? '');
      }
    } else {
      FullScreenProgress.showFullScreenProgress(_context, false);
      _somethingWentWrongError();
    }
  }

  _savePlan(int selectedPlanId, String planType, int expiredAt) async {
    final userInfo = await _isarService.getUserInfo();
    if (userInfo != null) {
      userInfo.subscribedPlanId = selectedPlanId;
      userInfo.subscribedPlanType = planType;
      userInfo.appSubscriptionEndTime = DateTime.fromMillisecondsSinceEpoch(
        expiredAt,
      );
      await _isarService.saveOrUpdateUserInfo(userInfo);
    } else {
      _somethingWentWrongError();
    }
  }

  _setListenerForPurchaseDetails() {
    final Stream<List<PurchaseDetails>> purchaseUpdated =
        _inAppPurchase.purchaseStream;
    _subscription = purchaseUpdated.listen(
      (purchaseDetailsList) {
        _savePurchaseStatusToLocalDb(purchaseDetailsList);
        _listenToPurchaseUpdated(purchaseDetailsList);
      },
      onDone: () {
        _subscription?.cancel();
      },
      onError: (error) {
        _subscription?.cancel();
      },
    );
    _initializeInApp();
  }

  _savePurchaseStatusToLocalDb(
      List<PurchaseDetails> purchaseDetailsList) async {
    _purchases.clear();
    if (purchaseDetailsList.isNotEmpty) {
      final currentDateTime = DateTime.now();
      purchaseDetailsList.forEach(
        (element) {
          final data = plansList.firstWhereOrNull(
            (dataElement) => dataElement.planId == element.productID,
          );
          _purchases.add(
            DbPurchasedStatus()
              ..transactionDate = element.transactionDate
              ..productID = element.productID
              ..purchaseID = element.purchaseID
              ..userId = StaticFunctions.userId
              ..planType = data?.type
              ..planId = data?.id
              ..price = data?.price
              ..source = element.verificationData.source
              ..verificationToken =
                  element.verificationData.serverVerificationData
              ..purchaseStatus = element.status.name
              ..errorMessage = element.error?.message
              ..uploadedToServer = false
              ..createdAt = currentDateTime
              ..updatedAt = currentDateTime,
          );
        },
      );
      await _isarService.savePurchasedStatus(_purchases);
    }
  }

  _initializeInApp() async {
    _products.clear();
    _inAppPurchaseAvailable = await _inAppPurchase.isAvailable();
    List<ProductDetails> listOfProducts = await _getProducts(
      productIdentifiers: Set<String>.from(
        _productIds,
      ),
    );
    _products.addAll(listOfProducts);
  }

  _getProducts({required Set<String> productIdentifiers}) async {
    ProductDetailsResponse response = await _inAppPurchase.queryProductDetails(
      productIdentifiers,
    );
    return response.productDetails;
  }

  _listenToPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) {
    purchaseDetailsList.forEach(
      (PurchaseDetails purchaseDetails) async {
        switch (purchaseDetails.status) {
          case PurchaseStatus.pending:
            break;
          case PurchaseStatus.purchased:
            {
              _purchases.forEach(
                (element) {
                  _uploadPurchaseItemToServer(element);
                },
              );
            }
            break;
          case PurchaseStatus.restored:
            break;
          case PurchaseStatus.error:
            debugPrint('${purchaseDetails.error ?? 'Purchase failed!'}');
            break;
          default:
            break;
        }

        if (purchaseDetails.pendingCompletePurchase) {
          await _inAppPurchase.completePurchase(purchaseDetails);
        }
      },
    );
  }

  _uploadPurchaseItemToServer(DbPurchasedStatus purchaseDetails) {
    Map<String, dynamic> body = {};
    if (purchaseDetails.purchaseID != null) {
      body['purchase_id'] = purchaseDetails.purchaseID;
    }
    if (purchaseDetails.transactionDate != null) {
      body['purchase_time'] = purchaseDetails.transactionDate;
    }
    body['purchase_token'] = purchaseDetails.verificationToken;
    body['payment_mode'] = purchaseDetails.source;
    body['plan_type'] = purchaseDetails.planType;
    body['price'] = purchaseDetails.price;
    _uploadPlanDetailsToServer(
      requestBody: body,
      planId: purchaseDetails.planId,
      planType: purchaseDetails.planType,
      purchaseId: purchaseDetails.purchaseID,
    );
  }

  _subscribePlan({required ProductDetails product}) async {
    final PurchaseParam purchaseParam = PurchaseParam(
      productDetails: product,
    );
    await _inAppPurchase.buyNonConsumable(
      purchaseParam: purchaseParam,
    );
  }

  _subscribePlanWithRevenueCat() async {
    final success = await RevenueCatPurchaseApi.purchaseProduct(
        'brooon_3000_6months:brooon-3000-6months');
    if (!success) {
      _noActivePlanError();
    }
  }

  _noActivePlanError() {
    SnackBarView.showSnackBar(
      _context,
      _localizations.noSubscriptionPlans,
    );
  }

  _somethingWentWrongError() {
    SnackBarView.showSnackBar(
      _context,
      _localizations.somethingWentWrong,
    );
  }

  updateSelectedPlan(String planId) {
    if (plansList.isNotEmpty) {
      final index = plansList.indexWhere((element) => element.planId == planId);
      for (int i = 0; i < plansList.length; i++) {
        plansList[i].isSelected = false;
      }
      if (index != (-1)) {
        plansList[index].isSelected = true;
      }
      notifyListeners();
    }
  }

  _uploadAlreadyPurchasedSubscriptionInfoIfPending() async {
    final list = await _isarService.getPendingToUploadPurchasedStatus();
    if (list.isNotEmpty) {
      list.forEach(
        (element) {
          _uploadPurchaseItemToServer(element);
        },
      );
    }
  }

  viewPurchaseHistory() {
    Navigator.pushNamed(
      _context,
      Routes.purchaseHistory,
    );
  }

  _onPurchaseCompleted() {
    if (_choosePlanFromScreen == ChoosePlanFrom.splash) {
      Navigator.pushReplacementNamed(
        _context,
        Routes.chooseLocation,
        arguments: ChooseLocationFrom.splash,
      );
    } else if (_choosePlanFromScreen == ChoosePlanFrom.propertyFromNetwork) {
      Navigator.pop(_context);
    } else {
      Navigator.pushReplacementNamed(
        _context,
        Routes.home,
      );
    }
  }

  disposeSubscription() {
    _subscription?.cancel();
  }
}
