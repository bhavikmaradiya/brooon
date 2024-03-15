import 'package:flutter/material.dart';

import '../../const/string_const.dart';
import '../../localdb/isar_service.dart';
import '../../localdb/subscription/db_plan_history.dart';
import '../../network/dio_client.dart';
import '../../utils/static_functions.dart';

class PurchaseHistoryProvider extends ChangeNotifier {
  IsarService _isarService = IsarService();
  final List<DbPlanHistory> _purchasedHistoryList = [];
  final List<DbPlanHistory> activeList = [];
  final List<DbPlanHistory> expiredList = [];

  init() async {
    _fetchPurchaseHistoryFromDb();
    fetchPurchaseHistoryFromServer();
  }

  _fetchPurchaseHistoryFromDb() async {
    _purchasedHistoryList.clear();
    _purchasedHistoryList.addAll(await _isarService.getHistoryPlans());
    if (_purchasedHistoryList.isNotEmpty) {
      _purchasedHistoryList.forEach(
        (element) {
          if (element.endDate > DateTime.now().millisecondsSinceEpoch) {
            activeList.add(element..isActive = true);
            _sortAscActiveList();
          } else {
            expiredList.add(element..isActive = false);
            _sortDescExpiredList();
          }
        },
      );
    }
    notifyListeners();
  }

  _sortAscActiveList() {
    // ascending order : start date
    activeList.sort(
      (a, b) => a.startDate.compareTo(b.startDate),
    );
  }

  _sortDescExpiredList() {
    // descending order : start date
    expiredList.sort(
      (a, b) => b.startDate.compareTo(a.startDate),
    );
  }

  fetchPurchaseHistoryFromServer() async {
    final response = await DioClient().getPurchaseHistory();
    if (response?.data != null) {
      final currentSubscription = response?.data?.currentSubscription;
      final previousSubscription = response?.data?.previousSubscription;
      if (currentSubscription != null && currentSubscription.isNotEmpty) {
        activeList.clear();
        currentSubscription.forEach(
          (element) {
            activeList.add(
              DbPlanHistory()
                ..userId = StaticFunctions.userId
                ..planName = element.planType?.toTitleCase() ?? ''
                ..price = element.price ?? ''
                ..paymentMode = element.paymentMode ?? ''
                ..startDate = element.startAt ?? 0
                ..endDate = element.expiredAt ?? 0
                ..purchasedOn = element.purchaseTime ?? 0
                ..duration = element.duration ?? ''
                ..transactionId = element.purchaseId ?? ''
                ..isActive = true,
            );
          },
        );
        _sortAscActiveList();
      }
      if (previousSubscription != null && previousSubscription.isNotEmpty) {
        expiredList.clear();
        previousSubscription.forEach(
          (element) {
            expiredList.add(
              DbPlanHistory()
                ..userId = StaticFunctions.userId
                ..planName = element.planType?.toTitleCase() ?? ''
                ..price = element.price ?? ''
                ..paymentMode = element.paymentMode ?? ''
                ..startDate = element.startAt ?? 0
                ..endDate = element.expiredAt ?? 0
                ..purchasedOn = element.purchaseTime ?? 0
                ..duration = element.duration ?? ''
                ..transactionId = element.purchaseId ?? ''
                ..isActive = false,
            );
          },
        );
        _sortDescExpiredList();
      }
      if (activeList.isNotEmpty || expiredList.isNotEmpty) {
        _isarService.deleteHistoryPlans();
      }
      if (activeList.isNotEmpty) {
        _isarService.saveHistoryPlans(activeList);
      }
      if (expiredList.isNotEmpty) {
        _isarService.saveHistoryPlans(expiredList);
      }
      notifyListeners();
    }
  }
}
