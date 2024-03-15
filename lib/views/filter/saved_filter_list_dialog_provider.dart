import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../const/dimen_const.dart';
import '../../const/string_const.dart';
import '../../localdb/isar_service.dart';
import '../../localdb/properties/db_saved_filter.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';
import '../../widgets/dialog_widget.dart';

class SavedFilterDialogProvider extends ChangeNotifier {
  late AppLocalizations localizationsContext;
  final isarService = IsarService();
  List<DbSavedFilter> filterList = [];
  int? byPropertyType;

  init(
    BuildContext context, {
    int? byPropertyType,
  }) async {
    this.byPropertyType = byPropertyType;
    this.localizationsContext = AppLocalizations.of(context)!;
    filterList =
        await isarService.getAllSavedFilters(byPropertyType: byPropertyType);
    notifyListeners();
  }

  deleteFilter(BuildContext context, DbSavedFilter filter) async {
    await showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return DialogWidget(
            title: '',
            titleWidget: Container(
              child: Text.rich(
                TextSpan(
                  text: localizationsContext.dialogDeleteFilterMsg1,
                  style: TextStyle(
                    color: StaticFunctions.getColor(
                      dialogContext,
                      ColorEnum.blackColor,
                    ),
                    fontSize: Dimensions.dialogTextSize.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    TextSpan(
                      text: filter.filterName,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: localizationsContext.dialogDeleteFilterMsg2,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            icon: Strings.iconDelete,
            positiveButton: localizationsContext.btnDeleteFilter,
            negativeButton: localizationsContext.btnCancelFilter,
            onNegativeButtonClick: () {
              Navigator.pop(dialogContext);
            },
            onPositiveButtonClick: () async {
              Navigator.pop(dialogContext);
              await isarService.deleteFilter(filter.id);
              filterList = await isarService.getAllSavedFilters(
                byPropertyType: byPropertyType,
              );
              if (filterList.isEmpty) {
                Navigator.pop(context);
              }
              notifyListeners();
            },
          );
        });
  }
}
