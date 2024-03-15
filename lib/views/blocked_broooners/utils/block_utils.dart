import 'package:flutter/material.dart';

import '../../../localdb/isar_service.dart';
import '../../../localdb/properties/db_blocked_broooner.dart';
import '../../../localdb/properties/db_brooon_pagination_count_schema.dart';
import '../../../network/dio_client.dart';
import '../../../utils/app_config.dart';
import '../../../utils/full_screen_progress.dart';
import '../../../utils/static_functions.dart';

class BlockUtils {
  static final _isarService = IsarService();

  static Future<bool> blockBrokerApi(
    BuildContext context, {
    required int brooonId,
    required String brooonCode,
    String? brooonName,
    String? brooonPhone,
    String? brooonPhoto,
  }) async {
    FullScreenProgress.showFullScreenProgress(context, true);
    final response = await DioClient().blockBroker(
      brooonId: brooonId,
      brooonCode: brooonCode,
    );
    FullScreenProgress.showFullScreenProgress(context, false);
    if (response?.success == true) {
      final brooonerFromDb =
          await _isarService.getBlockedBroooner(brooonId, brooonCode);
      final brooonerToSave = DbBlockedBroooner()
        ..userId = StaticFunctions.userId
        ..brooonId = brooonId
        ..brooonCode = brooonCode
        ..brooonName = brooonName
        ..brooonPhone = brooonPhone
        ..brooonPhoto = brooonPhoto
        ..createdAt = DateTime.now()
        ..updatedAt = DateTime.now();

      if (brooonerFromDb != null) {
        brooonerToSave.id = brooonerFromDb.id;
      }
      await _isarService.saveBlockedBroooner([brooonerToSave]);
    }
    return response?.success == true;
  }

  static Future<bool> unblockBrokerApi(
    BuildContext context, {
    required int brooonId,
    required String brooonCode,
  }) async {
    FullScreenProgress.showFullScreenProgress(context, true);
    final response = await DioClient().unblockBroker(
      brooonId: brooonId,
      brooonCode: brooonCode,
    );
    FullScreenProgress.showFullScreenProgress(context, false);
    if (response?.success == true) {
      await _isarService.deleteBlockedBroooner(
        brooonId: brooonId,
        brooonCode: brooonCode,
      );
    }
    return response?.success == true;
  }

  static Future<List<DbBlockedBroooner>?> getBlockedBrooonersApi({
    int page = AppConfig.paginationInitialPage,
    int limit = AppConfig.blockedBrooonersPaginationPerPageLimit,
  }) async {
    final response = await DioClient().getBlockedBroooners(
      page,
      limit,
    );
    if (response?.success == true && response?.data != null) {
      await _isarService.saveBlockedBrooonersCount(
        DbBrooonPaginationCountSchema()
          ..totalItemsCount = response?.data?.totalBlokedUser ?? 0
          ..totalPages = response?.data?.totalPages ?? 0
          ..nextPage = response?.data?.nextPage ?? 0
          ..currentPage = response?.data?.currentPage ?? 0,
      );
      if (page == AppConfig.paginationInitialPage) {
        await _isarService.deleteBlockedBroooner();
      }
      if (response!.data!.users != null && response.data!.users!.isNotEmpty) {
        final blockedBrooonerList = response.data!.users!
            .map(
              (e) => DbBlockedBroooner()
                ..userId = StaticFunctions.userId
                ..brooonId = e.brooonInfo!.brooonId!
                ..brooonCode = e.brooonInfo!.brooonCode!
                ..brooonName =
                    '${e.brooonInfo!.firstName ?? ''} ${e.brooonInfo!.lastName ?? ''}'
                ..brooonPhone = e.brooonInfo!.mobileNumber?.toString()
                ..brooonPhoto = e.brooonInfo!.brooonPhoto
                ..createdAt = DateTime.fromMillisecondsSinceEpoch(
                  e.createdAt ?? DateTime.now().millisecondsSinceEpoch,
                )
                ..updatedAt = DateTime.fromMillisecondsSinceEpoch(
                  e.updatedAt ?? DateTime.now().millisecondsSinceEpoch,
                ),
            )
            .toList();
        await _isarService.saveBlockedBroooner(blockedBrooonerList);
        return blockedBrooonerList;
      }
    }
    return null;
  }
}
