import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import './report_options.dart';
import '../../localdb/properties/db_property.dart';
import '../../localdb/properties/db_saved_filter.dart';
import '../../network/dio_client.dart';
import '../../utils/full_screen_progress.dart';
import '../../widgets/snack_bar_view.dart';

class ReportPublicPropertyProvider extends ChangeNotifier {
  late AppLocalizations localizationsContext;
  DbProperty? property;
  DbSavedFilter? inquiry;
  List<ReportOptions> reportOptions = [];

  init({
    required AppLocalizations localizations,
    DbProperty? selectedProperty,
    DbSavedFilter? selectedInquiry,
  }) {
    localizationsContext = localizations;
    property = selectedProperty;
    inquiry = selectedInquiry;
    _generateSharingOptions();
  }

  _generateSharingOptions() async {
    reportOptions.clear();
    reportOptions.addAll(
      [
        ReportOptions(
          id: 1,
          reason: localizationsContext.report1,
        ),
        ReportOptions(
          id: 2,
          reason: localizationsContext.report2,
        ),
        ReportOptions(
          id: 3,
          reason: localizationsContext.report3,
        ),
        ReportOptions(
          id: 4,
          reason: localizationsContext.report4,
        ),
        ReportOptions(
          id: 5,
          reason: localizationsContext.report5,
        ),
        ReportOptions(
          id: 6,
          reason: localizationsContext.report6,
        ),
      ],
    );
    notifyListeners();
  }

  updatePropertySelection(int id) {
    final index = reportOptions.indexWhere((element) => element.id == id);
    if (index != -1) {
      reportOptions[index].isSelected = !reportOptions[index].isSelected;
      notifyListeners();
    }
  }

  callApiToReportProperty(BuildContext context) async {
    final data = reportOptions
        .where(
          (element) => element.isSelected,
        )
        .toList();
    if (data.isNotEmpty) {
      String reason = '';
      for (int i = 0; i < data.length; i++) {
        if (i != 0) {
          reason += ', ';
        }
        reason += data[i].reason;
      }
      FullScreenProgress.showFullScreenProgress(context, true);
      final response = await DioClient().reportProperty(
        propertyId: property?.propertyId,
        inquiryId: inquiry?.inquiryId,
        reason: reason,
      );
      FullScreenProgress.showFullScreenProgress(context, false);
      if (response != null) {
        if (response.success == true) {
          SnackBarView.showSnackBar(
            context,
            localizationsContext.reportSuccess,
          );
        } else {
          SnackBarView.showSnackBar(
            context,
            localizationsContext.noInternetSnackBarMessage,
          );
        }
      } else {
        SnackBarView.showSnackBar(
          context,
          localizationsContext.somethingWentWrong,
        );
      }
    }
  }
}
