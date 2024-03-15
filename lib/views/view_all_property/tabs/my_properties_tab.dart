import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../common_property_data_provider.dart';
import '../../../const/dimen_const.dart';
import '../../../localdb/properties/db_property.dart';
import '../../../widgets/dialog_widget.dart';
import '../../../widgets/empty_view/empty_view.dart';
import '../model/view_all_screen_arg.dart';
import '../view_all_properties_provider.dart';
import '../view_all_property_item.dart';

class MyPropertiesTab extends StatelessWidget {
  final ViewAllScreenArg arguments;
  final AppLocalizations? localizationsContext;
  final CommonPropertyDataProvider? commonPropertyDataProvider;
  final ViewAllPropertiesProvider? viewAllPropertiesProvider;

  const MyPropertiesTab({
    Key? key,
    required this.arguments,
    required this.localizationsContext,
    required this.commonPropertyDataProvider,
    required this.viewAllPropertiesProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.screenHorizontalMargin.w,
      ),
      child: Selector<ViewAllPropertiesProvider, List<DbProperty>>(
        selector: (_, state) => state.myPropertyList,
        shouldRebuild: (prev, next) => true,
        builder: (context, propertyList, child) {
          if (propertyList.isEmpty) {
            return Center(
              child: EmptyView(),
            );
          } else {
            return ListView.builder(
              itemCount: propertyList.length,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final isItUnmatchProperty =
                    arguments.showDataFor == ViewAllFromType.unMatches &&
                        propertyList[index].unmatchInquiries.isNotEmpty;
                return Dismissible(
                  key: Key(propertyList[index].propertyId!),
                  direction: !(arguments.showDataFor ==
                              ViewAllFromType.buyers ||
                          arguments.showDataFor == ViewAllFromType.matches ||
                          isItUnmatchProperty)
                      ? DismissDirection.startToEnd
                      : DismissDirection.horizontal,
                  onDismissed: (direction) {
                    if (direction == DismissDirection.endToStart) {
                      if (!isItUnmatchProperty) {
                        viewAllPropertiesProvider
                            ?.makePropertyUnmatched(propertyList[index]);
                      } else {
                        viewAllPropertiesProvider
                            ?.makePropertyMatch(propertyList[index]);
                      }
                    }
                  },
                  confirmDismiss: (direction) async {
                    if (direction == DismissDirection.startToEnd) {
                      viewAllPropertiesProvider
                          ?.makePropertyFavorite(propertyList[index]);
                      return arguments.showDataFor ==
                          ViewAllFromType.favorite;
                    } else if (direction == DismissDirection.endToStart) {
                      return await showDialog<bool>(
                        context: context,
                        builder: (BuildContext dialogContext) {
                          return DialogWidget(
                            title: isItUnmatchProperty
                                ? localizationsContext!.dialogMsgMatchProperty
                                : localizationsContext!
                                    .dialogMsgUnmatchProperty,
                            positiveButton: isItUnmatchProperty
                                ? localizationsContext!.dialogBtnMatch
                                : localizationsContext!.dialogBtnUnmatch,
                            negativeButton:
                                localizationsContext!.dialogBtnCancel,
                            onNegativeButtonClick: () {
                              Navigator.pop(dialogContext, false);
                            },
                            onPositiveButtonClick: () async {
                              Navigator.pop(dialogContext, true);
                            },
                          );
                        },
                      );
                    }
                  },
                  child: buildViewAllPropertyItem(
                    context,
                    propertyList: propertyList,
                    index: index,
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  ViewAllPropertyItem buildViewAllPropertyItem(
    BuildContext context, {
    required int index,
    required List<DbProperty> propertyList,
  }) {
    return ViewAllPropertyItem(
      property: propertyList[index],
      localizationsContext: localizationsContext!,
      commonPropertyDataProvider: commonPropertyDataProvider!,
      viewAllFromType: arguments.showDataFor,
      isLastIndex: index == propertyList.length - 1,
      onMatchingClicked: () {
        viewAllPropertiesProvider?.onMatchingPropertyClicked(propertyList[index]);
      },
      onSelectedProperty: (selectedProperty) {
        viewAllPropertiesProvider?.openPropertyDetailScreen(
          context,
          selectedProperty,
        );
      },
    );
  }
}
