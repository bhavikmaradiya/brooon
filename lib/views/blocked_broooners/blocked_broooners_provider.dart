import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import './utils/block_utils.dart';
import '../../localdb/isar_service.dart';
import '../../localdb/properties/db_blocked_broooner.dart';
import '../../utils/enums.dart';
import '../../widgets/dialog_widget.dart';
import '../../widgets/snack_bar_view.dart';

class BlockedBrooonersProvider extends ChangeNotifier {
  final _isarService = IsarService();
  List<DbBlockedBroooner> _blockedBrooonerList = [];
  List<DbBlockedBroooner> filteredblockedBrooonerList = [];
  String _searchBy = '';
  bool hasMoreData = false;
  bool isLoading = false;
  bool disablePullToRefreshLoadMore = false;
  ApiEnum apiEnum = ApiEnum.inProgress;

  init() async {
    disablePullToRefreshLoadMore = false;
    getBlockedBrooonerList();
  }

  searchBy(String value) {
    _searchBy = value.trim();
    if (_searchBy.trim().isNotEmpty) {
      disablePullToRefreshLoadMore = true;
    } else {
      disablePullToRefreshLoadMore = false;
    }
    filteredblockedBrooonerList.clear();
    if (value.toString().trim().isNotEmpty) {
      final matchedBuyerSeller = _blockedBrooonerList.where(
        (element) {
          return element.brooonCode
                  .toLowerCase()
                  .startsWith(value.toLowerCase()) ||
              (element.brooonName != null &&
                  element.brooonName!.trim().isNotEmpty &&
                  element.brooonName!
                      .toLowerCase()
                      .contains(value.toLowerCase())) ||
              (element.brooonPhone != null &&
                  element.brooonPhone!.trim().isNotEmpty &&
                  element.brooonPhone!.startsWith(value));
        },
      );
      filteredblockedBrooonerList.addAll(matchedBuyerSeller);
    } else {
      filteredblockedBrooonerList.addAll(_blockedBrooonerList);
    }
    notifyListeners();
  }

  onDispose() {}

  unblockBroooner(
    BuildContext context, {
    required AppLocalizations localizationsContext,
    required DbBlockedBroooner broooner,
  }) async {
    if (isLoading) return;
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return DialogWidget(
          title: localizationsContext
              .unblockBrokerDialogTitle(broooner.brooonName!),
          positiveButton: localizationsContext.unblockDialogBtnYes,
          negativeButton: localizationsContext.unblockDialogBtnNo,
          onNegativeButtonClick: () {
            Navigator.pop(dialogContext);
          },
          onPositiveButtonClick: () async {
            // To close dialog
            Navigator.pop(dialogContext);
            final isUnblocked = await BlockUtils.unblockBrokerApi(
              context,
              brooonId: broooner.brooonId,
              brooonCode: broooner.brooonCode,
            );
            if (isUnblocked) {
              if (filteredblockedBrooonerList.contains(broooner)) {
                final indexToRemove =
                    filteredblockedBrooonerList.indexOf(broooner);
                if (indexToRemove != -1) {
                  filteredblockedBrooonerList.removeAt(indexToRemove);
                }
              }
              if (_blockedBrooonerList.contains(broooner)) {
                final indexToRemove = _blockedBrooonerList.indexOf(broooner);
                if (indexToRemove != -1) {
                  _blockedBrooonerList.removeAt(indexToRemove);
                }
              }
              notifyListeners();
              SnackBarView.showSnackBar(
                context,
                localizationsContext
                    .unblockSuccessMessage(broooner.brooonName!),
              );
            }
          },
        );
      },
    );
  }

  getBlockedBrooonerList() async {
    apiEnum = ApiEnum.inProgress;
    isLoading = false;
    notifyListeners();
    final newBrooonProperties = await BlockUtils.getBlockedBrooonersApi();
    if (newBrooonProperties != null && newBrooonProperties.isNotEmpty) {
      _blockedBrooonerList.clear();
      filteredblockedBrooonerList.clear();
      _blockedBrooonerList.addAll(newBrooonProperties);
      filteredblockedBrooonerList.addAll(newBrooonProperties);
    }
    apiEnum =
        newBrooonProperties != null ? ApiEnum.onSuccess : ApiEnum.onFailure;
    notifyListeners();
  }

  loadMoreBlockedBroooners() async {
    if (isLoading) return;
    isLoading = true;
    hasMoreData = true;
    // load more item here.
    // Ref. https://www.youtube.com/watch?v=eENDlIgadr4
    final isApiCallSuccess = await _loadMoreBlockedBrooonersApi();
    isLoading = false;
    if (isApiCallSuccess) {
      hasMoreData = await _hasMoreBlockedBroooners();
    } else {
      hasMoreData = false;
    }
    notifyListeners();
  }

  Future<bool> _hasMoreBlockedBroooners() async {
    final countInfo = await _isarService.getBlockedBrooonersCountSchema();
    if (countInfo?.currentPage != null && countInfo?.totalPages != null) {
      return countInfo!.totalPages! != countInfo.currentPage!;
    }
    return false;
  }

  Future<bool> _loadMoreBlockedBrooonersApi() async {
    final countInfo = await _isarService.getBlockedBrooonersCountSchema();
    if (countInfo?.currentPage != null && countInfo?.totalPages != null) {
      // check if next page is available
      if (countInfo!.totalPages! > countInfo.currentPage!) {
        hasMoreData = true;
        notifyListeners();
        final blockedBroooner = await BlockUtils.getBlockedBrooonersApi(
            page: countInfo.currentPage! + 1);
        if (blockedBroooner != null && blockedBroooner.isNotEmpty) {
          _blockedBrooonerList.addAll(blockedBroooner);
          filteredblockedBrooonerList.addAll(blockedBroooner);
          notifyListeners();
          return true;
        }
      }
    }
    return false;
  }
}
