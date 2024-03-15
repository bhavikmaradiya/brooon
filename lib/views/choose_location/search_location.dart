import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import './model/location_content.dart';
import './model/retrieve_location_arg.dart';
import './search_location_provider.dart';
import './widget/location_detail_content.dart';
import '../../const/dimen_const.dart';
import '../../const/string_const.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';
import '../../utils/theme_config.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/circular_indicator.dart';
import '../../widgets/search_widget.dart';
import '../../widgets/toolbar.dart';

class SearchLocation extends StatelessWidget {
  const SearchLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SearchLocationProvider(),
      builder: (_, __) => SearchLocationBody(),
    );
  }
}

class SearchLocationBody extends StatefulWidget {
  const SearchLocationBody({Key? key}) : super(key: key);

  @override
  State<SearchLocationBody> createState() => _SearchLocationState();
}

class _SearchLocationState extends State<SearchLocationBody> {
  late AppLocalizations localizationsContext;
  late TextEditingController searchController;
  SearchLocationProvider? _searchLocationProvider;
  Timer? _debounce;

  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    localizationsContext = AppLocalizations.of(context)!;
    if (_searchLocationProvider == null) {
      _searchLocationProvider =
          Provider.of<SearchLocationProvider>(context, listen: false);
      _searchLocationProvider?.init(localizationsContext);
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  _callForPlaceApi(String searchBy) async {
    _searchLocationProvider?.updateLoading = true;
    final result = await _searchLocationProvider?.searchPlaces(searchBy);
    _searchLocationProvider?.updateLoading = false;
    if (result?.predictions != null && result!.predictions!.isNotEmpty) {
      _searchLocationProvider?.updatePlacesList(result.predictions!);
    }
  }

  _onLocationSelected({
    String? placeId,
    String? address,
    bool? useCurrentLocation,
  }) {
    StaticFunctions.unFocusKeyboardIfAny(context);
    Navigator.pop(
      context,
      RetrieveLocationArg(
        placeId: placeId,
        areaName: address,
        useCurrentLocation: useCurrentLocation,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ThemeConfig.appBar(context),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ToolBar(
              title: localizationsContext.enterYourArea,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.screenHorizontalMargin.w,
              ),
              child: SearchWidget(
                searchHint: localizationsContext.searchArea,
                prefixIconAssets: Strings.iconSearch,
                prefixIconColor: ColorEnum.blackColor,
                suffixIconAssets: Strings.iconClose,
                suffixIconColor: ColorEnum.blackColor,
                isSuffixIconRequired: true,
                suffixIconSize: Dimensions.searchLocationCloseIconSize,
                controller: searchController,
                autofocus: true,
                suffixIconClick: () {
                  searchController.text = '';
                  _searchLocationProvider?.updatePlacesList([]);
                },
                onSearch: (_) {},
                onTyping: (String searchBy) {
                  if (searchBy.isEmpty) {
                    if (_debounce?.isActive ?? false) {
                      _debounce?.cancel();
                    }
                    _searchLocationProvider?.updateLoading = false;
                    _searchLocationProvider?.updatePlacesList([]);
                  } else {
                    if (_debounce?.isActive ?? false) {
                      _debounce?.cancel();
                    }
                    _debounce = Timer(
                      const Duration(
                        milliseconds: 1000,
                      ),
                      () {
                        _callForPlaceApi(searchBy);
                      },
                    );
                  }
                },
              ),
            ),
            SizedBox(
              height: Dimensions.searchLocationSearchWidgetSearchTextSpacing.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.screenHorizontalMargin.w,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      localizationsContext.searchResults,
                      style: TextStyle(
                        color: StaticFunctions.getColor(
                          context,
                          ColorEnum.gray90Color,
                        ),
                        fontSize: Dimensions.searchResultsTextSize.sp,
                      ),
                    ),
                  ),
                  Selector<SearchLocationProvider, bool>(
                    selector: (_, state) => state.isLoading,
                    shouldRebuild: (prev, next) => prev != next,
                    builder: (context, value, child) {
                      return value
                          ? SizedBox(
                              width: Dimensions.searchResultProgressSize.w,
                              height: Dimensions.searchResultProgressSize.w,
                              child: CircularIndicator(
                                progressStrokeWidth:
                                    Dimensions.searchResultProgressWidth.w,
                              ),
                            )
                          : const SizedBox();
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Selector<SearchLocationProvider, List<LocationContent>>(
                selector: (_, state) => state.places,
                shouldRebuild: (_, __) => true,
                builder: (context, list, child) {
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: list.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(
                          left: Dimensions.screenHorizontalMargin.w,
                          right: Dimensions.screenHorizontalMargin.w,
                          top: Dimensions.searchResultsListItemMargin.h,
                          bottom: (index == list.length - 1)
                              ? Dimensions.searchResultsListItemMargin.h
                              : 0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            Dimensions.searchResultsListItemBorderRadius.r,
                          ),
                          color: StaticFunctions.getColor(
                            context,
                            ColorEnum.blueColorOpacity2Percentage,
                          ),
                          border: Border.all(
                            color: StaticFunctions.getColor(
                              context,
                              ColorEnum.borderColorE0,
                            ),
                            width:
                                Dimensions.searchResultsListItemBorderWidth.w,
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            _onLocationSelected(
                              placeId: list[index].googlePlaceId,
                              address: list[index].description,
                            );
                          },
                          splashColor: StaticFunctions.getColor(
                            context,
                            ColorEnum.touchSplashColor,
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: Dimensions
                                  .searchResultsListItemHorizontalPadding.w,
                              vertical: Dimensions
                                  .searchResultsListItemVerticalPadding.h,
                            ),
                            child: LocationDetailContent(
                              locationContent: LocationContent(
                                landMark: list[index].landMark,
                                address: list[index].address,
                              ),
                              textSpanRequired: false,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                bottom: Dimensions.screenVerticalMarginBottom.h,
                left: Dimensions.screenHorizontalMargin.w,
                right: Dimensions.screenHorizontalMargin.w,
              ),
              child: ButtonWidget(
                text: localizationsContext.useMyCurrentLocation,
                textColor: StaticFunctions.getColor(
                  context,
                  ColorEnum.whiteColor,
                ),
                bgColor: StaticFunctions.getColor(
                  context,
                  ColorEnum.themeColor,
                ),
                borderColor: StaticFunctions.getColor(
                  context,
                  ColorEnum.themeColor,
                ),
                fontWeight: FontWeight.w700,
                onClick: () {
                  _onLocationSelected(
                    useCurrentLocation: true,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
