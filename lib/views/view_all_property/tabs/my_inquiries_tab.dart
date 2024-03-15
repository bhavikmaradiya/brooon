import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../common_property_data_provider.dart';
import '../../../const/dimen_const.dart';
import '../../../localdb/properties/db_saved_filter.dart';
import '../../../widgets/dialog_widget.dart';
import '../../../widgets/empty_view/empty_view.dart';
import '../model/view_all_screen_arg.dart';
import '../view_all_inquiry_item.dart';
import '../view_all_properties_provider.dart';

class MyInquiriesTab extends StatelessWidget {
  final ViewAllScreenArg arguments;
  final AppLocalizations? localizationsContext;
  final CommonPropertyDataProvider? commonPropertyDataProvider;
  final ViewAllPropertiesProvider? viewAllPropertiesProvider;

  const MyInquiriesTab({
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
      child: Selector<ViewAllPropertiesProvider, List<DbSavedFilter>>(
        selector: (_, state) => state.myInquiriesList,
        shouldRebuild: (prev, next) => true,
        builder: (context, inquiryList, child) {
          if (inquiryList.isEmpty) {
            return Center(
              child: EmptyView(),
            );
          } else {
            return ListView.builder(
              itemCount: inquiryList.length,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final isItUnmatchInquiry =
                    arguments.showDataFor == ViewAllFromType.unMatches &&
                        inquiryList[index].unmatchProperties.isNotEmpty;
                return Dismissible(
                  key: Key(inquiryList[index].inquiryId!),
                  direction: !(arguments.showDataFor ==
                              ViewAllFromType.sellers ||
                          arguments.showDataFor == ViewAllFromType.matches ||
                          isItUnmatchInquiry)
                      ? DismissDirection.startToEnd
                      : DismissDirection.horizontal,
                  onDismissed: (direction) {
                    if (direction == DismissDirection.endToStart) {
                      if (!isItUnmatchInquiry) {
                        viewAllPropertiesProvider
                            ?.makeInquiryUnmatched(inquiryList[index]);
                      } else {
                        viewAllPropertiesProvider
                            ?.makeInquiryMatch(inquiryList[index]);
                      }
                    }
                  },
                  confirmDismiss: (direction) async {
                    if (direction == DismissDirection.startToEnd) {
                      viewAllPropertiesProvider
                          ?.makeInquiryFavorite(inquiryList[index]);
                      return arguments.showDataFor == ViewAllFromType.favorite;
                    } else if (direction == DismissDirection.endToStart) {
                      return await showDialog<bool>(
                        context: context,
                        builder: (BuildContext dialogContext) {
                          return DialogWidget(
                            title: isItUnmatchInquiry
                                ? localizationsContext!.dialogMsgMatchInquiry
                                : localizationsContext!.dialogMsgUnmatchInquiry,
                            positiveButton: isItUnmatchInquiry
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
                  child: buildViewAllInquiryItem(
                    context,
                    inquiryList: inquiryList,
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

  ViewAllInquiryItem buildViewAllInquiryItem(
    BuildContext context, {
    required int index,
    required List<DbSavedFilter> inquiryList,
  }) {
    return ViewAllInquiryItem(
      inquiry: inquiryList[index],
      localizationsContext: localizationsContext!,
      commonPropertyDataProvider: commonPropertyDataProvider!,
      viewAllFromType: arguments.showDataFor,
      isLastIndex: index == inquiryList.length - 1,
      onMatchingClicked: () {
        viewAllPropertiesProvider?.onMatchingInquiryClicked(inquiryList[index]);
      },
      onSelectedInquiry: (selectedInquiry) {
        viewAllPropertiesProvider?.openInquiryDetailScreen(
          context,
          selectedInquiry,
        );
      },
    );
  }
}
