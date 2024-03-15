import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:provider/provider.dart';

import './model/property_visual_type.dart';
import './model/view_all_screen_arg.dart';
import './view_all_properties_provider.dart';
import './view_all_property_item.dart';
import '../../common_property_data_provider.dart';
import '../../const/dimen_const.dart';
import '../../const/string_const.dart';
import '../../localdb/properties/db_property.dart';
import '../../utils/app_config.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/loading_map_widget.dart';

class ViewAllPropertiesByMap extends StatefulWidget {
  final ViewAllScreenArg arguments;
  final AppLocalizations? localizationsContext;
  final CommonPropertyDataProvider? commonPropertyDataProvider;

  const ViewAllPropertiesByMap({
    Key? key,
    required this.arguments,
    required this.localizationsContext,
    required this.commonPropertyDataProvider,
  }) : super(key: key);

  @override
  State<ViewAllPropertiesByMap> createState() => _ViewAllPropertiesByMapState();
}

class _ViewAllPropertiesByMapState extends State<ViewAllPropertiesByMap>
    with AutomaticKeepAliveClientMixin {
  ViewAllPropertiesProvider? _viewAllPropertiesProvider;

  @override
  void didChangeDependencies() {
    if (_viewAllPropertiesProvider == null) {
      _viewAllPropertiesProvider =
          Provider.of<ViewAllPropertiesProvider>(context, listen: false);
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _viewAllPropertiesProvider?.mapController?.onSymbolTapped.remove(
      _onSymbolTapped,
    );
    _viewAllPropertiesProvider?.debounceSearchProperties?.cancel();
    _viewAllPropertiesProvider?.debounceSearchInquiries?.cancel();
    super.dispose();
  }

  _onSymbolTapped(Symbol symbol) {
    _viewAllPropertiesProvider?.replaceMarker(
      symbol,
    );
  }

  _onMapCreated(MapboxMapController controller) async {
    Future.delayed(
      Duration(
        milliseconds: AppConfig.minorDelayToLoadMapInMilliseconds,
      ),
      () {
        _viewAllPropertiesProvider?.setMapCreated = true;
      },
    );
    _viewAllPropertiesProvider?.mapController = controller;
    controller.onSymbolTapped.add(_onSymbolTapped);
    _viewAllPropertiesProvider?.refreshMarkers();
  }

  Widget _switchViewWidget() {
    return Container(
      width: Dimensions.searchPropertyViewModeSwitcherWidth.w,
      margin: EdgeInsets.symmetric(
        vertical: Dimensions.searchPropertyViewModeSwitcherVerticalMargin.w,
      ),
      child: ButtonWidget(
        text: widget.localizationsContext!.switchToListView,
        textColor: StaticFunctions.getColor(
          context,
          ColorEnum.whiteColor,
        ),
        bgColor: StaticFunctions.getColor(
          context,
          ColorEnum.themeColor,
        ),
        icon: Strings.iconViewModeList,
        iconWidth: Dimensions.searchPropertyViewModeListSize.w,
        iconHeight: Dimensions.searchPropertyViewModeListSize.w,
        iconColor: StaticFunctions.getColor(
          context,
          ColorEnum.whiteColor,
        ),
        onClick: () {
          StaticFunctions.unFocusKeyboardIfAny(context);
          _viewAllPropertiesProvider?.updatePropertyVisualType(
            PropertyVisualType.list,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final userInfo = _viewAllPropertiesProvider?.userInfo;
    return Stack(
      children: [
        Stack(
          children: [
            Positioned.fill(
              child: MapboxMap(
                styleString: AppConfig.mapboxStyle,
                accessToken: AppConfig.mapboxAccessToken,
                onMapCreated: _onMapCreated,
                minMaxZoomPreference: const MinMaxZoomPreference(
                  AppConfig.minZoomLevel,
                  null,
                ),
                initialCameraPosition: CameraPosition(
                  zoom: AppConfig.defaultZoomProperty,
                  target: LatLng(
                    AppConfig.enableNearByRealTimeFeature
                        ? (userInfo?.liveLatitude ?? userInfo?.latitude ?? 0.0)
                        : userInfo?.latitude ?? 0.0,
                    AppConfig.enableNearByRealTimeFeature
                        ? (userInfo?.liveLongitude ??
                            userInfo?.longitude ??
                            0.0)
                        : userInfo?.longitude ?? 0.0,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: Dimensions.screenHorizontalMargin.w,
              right: Dimensions.screenHorizontalMargin.w,
              child: Selector<ViewAllPropertiesProvider, DbProperty?>(
                selector: (_, state) => state.selectedMapProperty,
                builder: (context, selectedProperty, child) {
                  return Column(
                    children: [
                      if (selectedProperty != null)
                        ViewAllPropertyItem(
                          property: selectedProperty,
                          localizationsContext: widget.localizationsContext!,
                          commonPropertyDataProvider:
                              widget.commonPropertyDataProvider!,
                          viewAllFromType: widget.arguments.showDataFor,
                          isLastIndex: false,
                          isMapItem: true,
                          onSelectedProperty: (selectedProperty) {
                            selectedProperty.customHeroTagKey = 'map';
                            _viewAllPropertiesProvider
                                ?.openPropertyDetailScreen(
                              context,
                              selectedProperty,
                            );
                          },
                        ),
                      _switchViewWidget(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
        Selector<ViewAllPropertiesProvider, bool>(
          selector: (_, state) => state.isMapCreated,
          shouldRebuild: (prev, next) => true,
          builder: (context, isMapCreated, child) {
            return LoadingMapWidget(
              isMapCreated: isMapCreated,
            );
          },
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
