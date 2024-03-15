import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import './model/other_misc_model.dart';
import '../../const/routes.dart';
import '../../const/string_const.dart';
import '../../utils/static_functions.dart';
import '../view_all_property/model/view_all_screen_arg.dart';

class OtherMiscItemsProvider extends ChangeNotifier {
  late AppLocalizations localizationsContext;
  List<MiscItem> drawerOtherList = [];
  static const favoriteId = 1;
  static const unMatchId = 2;
  static const closeDealId = 3;
  static const inActiveId = 4;

  init(AppLocalizations localizationsContext) {
    this.localizationsContext = localizationsContext;
    drawerOtherList = [
      MiscItem(
        id: favoriteId,
        icon: Strings.iconDrawerFavorite,
        title: localizationsContext.drawerItemFavorite,
      ),
      MiscItem(
        id: unMatchId,
        icon: Strings.iconDrawerUnMatch,
        title: localizationsContext.drawerItemUnmatched,
      ),
      MiscItem(
        id: closeDealId,
        icon: Strings.iconDrawerClosedDeals,
        title: localizationsContext.drawerItemClosedDeals,
      ),
      MiscItem(
        id: inActiveId,
        icon: Strings.iconDrawerInActives,
        title: localizationsContext.drawerItemInActives,
      ),
    ];
    notifyListeners();
  }

  onDrawerItemSelected(BuildContext context, String selectedItem) {
    if (selectedItem == localizationsContext.drawerItemUnmatched) {
      openPropertyListScreen(
        context,
        localizationsContext.drawerItemUnmatched,
        0,
        ViewAllFromType.unMatches,
        viewAllFromToHandleTabs: ViewAllTabsVisibilityType.fromUnMatch,
      );
    } else if (selectedItem == localizationsContext.drawerItemClosedDeals) {
      openPropertyListScreen(
        context,
        localizationsContext.drawerItemClosedDeals,
        0,
        ViewAllFromType.closedDeals,
        viewAllFromToHandleTabs: ViewAllTabsVisibilityType.fromClosedDeals,
      );
    } else if (selectedItem == localizationsContext.drawerItemInActives) {
      openPropertyListScreen(
        context,
        localizationsContext.drawerItemInActives,
        0,
        ViewAllFromType.inActives,
        viewAllFromToHandleTabs: ViewAllTabsVisibilityType.fromDrawerInActives,
      );
    } else if (selectedItem == localizationsContext.drawerItemFavorite) {
      openPropertyListScreen(
        context,
        localizationsContext.drawerItemFavorite,
        0,
        ViewAllFromType.favorite,
        viewAllFromToHandleTabs: ViewAllTabsVisibilityType.fromFavorite,
      );
    }
  }

  openPropertyListScreen(
    BuildContext context,
    String heading,
    int count,
    ViewAllFromType type, {
    int? propertyTypeId = null,
    required ViewAllTabsVisibilityType viewAllFromToHandleTabs,
  }) {
    StaticFunctions.unFocusKeyboardIfAny(context);
    Navigator.pushNamed(
      context,
      Routes.viewAllProperties,
      arguments: ViewAllScreenArg(
        heading: heading,
        count: count,
        showDataFor: type,
        propertyTypeId: propertyTypeId,
        viewAllFromToHandleTabs: viewAllFromToHandleTabs,
      ),
    );
  }
}
