import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import './cast_management_provider.dart';
import './widget/add_caste_dialog_widget.dart';
import './widget/cast_item_widget.dart';
import '../../const/dimen_const.dart';
import '../../const/string_const.dart';
import '../../localdb/properties/db_property_preferred_cast.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';
import '../../utils/theme_config.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/dialog_widget.dart';
import '../../widgets/empty_view/empty_view.dart';
import '../../widgets/toolbar.dart';
import '../common_widget/custom_floating_widget.dart';

class CastManagement extends StatelessWidget {
  const CastManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CastManagementProvider(),
      child: _Body(),
    );
  }
}

class _Body extends StatefulWidget {
  _Body({Key? key}) : super(key: key);

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  late AppLocalizations localizationsContext;

  CastManagementProvider? provider;

  @override
  void didChangeDependencies() {
    localizationsContext = AppLocalizations.of(context)!;
    if (provider == null) {
      provider = Provider.of<CastManagementProvider>(context, listen: false);
      provider!.init(context);
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ThemeConfig.appBar(context),
      floatingActionButton:
          Selector<CastManagementProvider, List<DbPropertyPreferredCast>>(
        shouldRebuild: (prev, next) => true,
        selector: (_, state) => state.castList,
        builder: (context, castList, child) {
          return castList.isNotEmpty
              ? CustomFloatingWidget(
                  onClick: () {
                    showBottomSheet(context);
                  },
                )
              : const SizedBox();
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            Selector<CastManagementProvider, List<DbPropertyPreferredCast>>(
              shouldRebuild: (prev, next) => true,
              selector: (_, state) => state.castList,
              builder: (context, list, child) {
                return ToolBar(
                  enableBackground: true,
                  title: localizationsContext.castManagement,
                  searchHint: localizationsContext.searchByCaste,
                  enableSearch: list.isNotEmpty,
                  onSearchChange: (value) {
                    if (list.isNotEmpty) {
                      provider!.onSearch(value);
                    }
                  },
                );
              },
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                  left: Dimensions.screenHorizontalMargin.w,
                  right: Dimensions.screenHorizontalMargin.w,
                ),
                child: Selector<
                    CastManagementProvider,
                    Tuple2<List<DbPropertyPreferredCast>,
                        List<DbPropertyPreferredCast>>>(
                  shouldRebuild: (prev, next) => true,
                  selector: (_, state) =>
                      Tuple2(state.listToDisplay, state.castList),
                  builder: (context, listData, child) {
                    return listData.item1.isEmpty && listData.item2.isEmpty
                        ? Column(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      Strings.iconNoCastData,
                                      height:
                                          Dimensions.castScreenNoDataIconSize.h,
                                      width:
                                          Dimensions.castScreenNoDataIconSize.h,
                                    ),
                                    SizedBox(
                                      height: Dimensions
                                          .castScreenNoDataContentSpacing.h,
                                    ),
                                    Text(
                                      localizationsContext.noCastWarning1,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: StaticFunctions.getColor(
                                          context,
                                          ColorEnum.blackColor,
                                        ),
                                        fontWeight: FontWeight.w400,
                                        fontSize: Dimensions
                                            .castScreenNoDataTextSize.sp,
                                      ),
                                    ),
                                    Text(
                                      localizationsContext.noCastWarning2,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: StaticFunctions.getColor(
                                          context,
                                          ColorEnum.blackColor,
                                        ),
                                        fontWeight: FontWeight.w400,
                                        fontSize: Dimensions
                                            .castScreenNoDataTextSize.sp,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              ButtonWidget(
                                text: localizationsContext.titleAddCast,
                                onClick: () {
                                  showBottomSheet(context);
                                },
                                textColor: StaticFunctions.getColor(
                                  context,
                                  ColorEnum.whiteColor,
                                ),
                                bgColor: StaticFunctions.getColor(
                                  context,
                                  ColorEnum.themeColor,
                                ),
                                fontWeight: FontWeight.w700,
                              ),
                              SizedBox(
                                height: Dimensions.screenVerticalMarginBottom.h,
                              )
                            ],
                          )
                        : listData.item1.isEmpty
                            ? EmptyView()
                            : Container(
                                child: ListView.builder(
                                  itemCount: listData.item1.length,
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: EdgeInsets.only(
                                          bottom: index ==
                                                  listData.item1.length - 1
                                              ? Dimensions
                                                  .screenVerticalMarginBottom.h
                                              : 0),
                                      child: CastItemWidget(
                                        castDetails: listData.item1[index],
                                        isLastIndex: (index ==
                                            listData.item1.length - 1),
                                        onEdit: () {
                                          showBottomSheet(context,
                                              castToEdit:
                                                  listData.item1[index]);
                                        },
                                        onDelete: () async {
                                          await showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return DialogWidget(
                                                title: '',
                                                titleWidget: Container(
                                                  child: Text.rich(
                                                    TextSpan(
                                                      text: localizationsContext
                                                          .dialogDeleteCastMsg1,
                                                      style: TextStyle(
                                                        color: StaticFunctions
                                                            .getColor(
                                                          context,
                                                          ColorEnum.blackColor,
                                                        ),
                                                        fontSize: Dimensions
                                                            .dialogTextSize.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                      children: [
                                                        TextSpan(
                                                          text: listData
                                                              .item1[index]
                                                              .name,
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text: localizationsContext
                                                              .dialogDeleteCastMsg2,
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                icon: Strings.iconDelete,
                                                positiveButton:
                                                    localizationsContext
                                                        .btnDeleteCast,
                                                negativeButton:
                                                    localizationsContext
                                                        .btnCancelCast,
                                                onNegativeButtonClick: () {
                                                  Navigator.pop(context);
                                                },
                                                onPositiveButtonClick: () {
                                                  Navigator.pop(context);
                                                  provider!.deleteCast(
                                                      listData.item1[index].id);
                                                },
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                              );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showBottomSheet(context, {DbPropertyPreferredCast? castToEdit}) {
    TextEditingController addCastController =
        TextEditingController(text: castToEdit?.name ?? '');
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (dialogContext) {
        return AddCastWidget(
          localizationsContext: localizationsContext,
          castToEdit: castToEdit,
          addCastController: addCastController,
          provider: provider,
        );
      },
      isDismissible: true,
      backgroundColor: StaticFunctions.getColor(
        context,
        ColorEnum.whiteColor,
      ),
      barrierColor: StaticFunctions.getColor(
        context,
        ColorEnum.bottomSheetBarrierColor,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            (Dimensions.bottomSheetRadius * 2).r,
          ),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
    );
  }
}
