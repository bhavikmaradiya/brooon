import '../../../localdb/properties/db_saved_filter.dart';
import '../../view_all_property/model/view_all_screen_arg.dart';

class FilterScreenArg {
  String fromRoute;
  int? propertyType;
  String? searchText;
  DbSavedFilter? filterToApply;
  ViewAllFromType? viewAllType;
  ViewAllTabsVisibilityType? tabVisibilityType;
  bool showInactiveAndClosedProperty;

  FilterScreenArg({
    required this.fromRoute,
    required this.filterToApply,
    this.propertyType,
    this.searchText,
    this.viewAllType,
    this.tabVisibilityType,
    this.showInactiveAndClosedProperty = false,
  });
}
