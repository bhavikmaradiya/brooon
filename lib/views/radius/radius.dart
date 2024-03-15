import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:provider/provider.dart';

import './radius_provider.dart';
import '../../const/dimen_const.dart';
import '../../const/string_const.dart';
import '../../utils/app_config.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';
import '../../utils/theme_config.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/light_divider.dart';
import '../../widgets/loading_map_widget.dart';
import '../../widgets/toolbar.dart';
import '../choose_location/fetch_location_provider.dart';

class ChooseRadius extends StatelessWidget {
  const ChooseRadius({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RadiusProvider(),
      builder: (_, __) => _ChooseRadiusBody(),
    );
  }
}

class _ChooseRadiusBody extends StatefulWidget {
  const _ChooseRadiusBody({
    Key? key,
  }) : super(key: key);

  @override
  State<_ChooseRadiusBody> createState() => _ChooseRadiusBodyState();
}

class _ChooseRadiusBodyState extends State<_ChooseRadiusBody> {
  AppLocalizations? localizationsContext;
  FetchLocationProvider? _fetchLocationProvider;
  MapboxMapController? _mapController;
  LatLng? _currentPosition;
  RadiusProvider? _radiusProvider;
  Fill? _circularFill;
  Timer? _debounce;

  @override
  void didChangeDependencies() async {
    if (localizationsContext == null) {
      localizationsContext = AppLocalizations.of(context)!;
    }
    if (_radiusProvider == null) {
      _radiusProvider = Provider.of<RadiusProvider>(context, listen: false);
      _radiusProvider?.init();
    }
    if (_fetchLocationProvider == null) {
      _fetchLocationProvider = Provider.of<FetchLocationProvider>(
        context,
        listen: false,
      );
      _fetchLocationProvider!.locationStreamController = StreamController();
      _fetchLocationProvider!.init();
      final position = _fetchLocationProvider!.myLocation;
      if (position != null) {
        _currentPosition = LatLng(position.latitude, position.longitude);
      } else {
        final latitude = _radiusProvider?.userInfo?.latitude ?? 0;
        final longitude = _radiusProvider?.userInfo?.longitude ?? 0;
        _currentPosition = LatLng(latitude, longitude);
      }
      listenOnLocationChanges();
    }
    super.didChangeDependencies();
  }

  _onMapCreated(MapboxMapController controller) {
    Future.delayed(
      Duration(
        milliseconds: AppConfig.minorDelayToLoadMapInMilliseconds,
      ),
      () {
        _radiusProvider?.setMapCreated = true;
      },
    );
    _mapController = controller;
    Future.delayed(
      const Duration(seconds: 1),
      () {
        _moveToMyLocation();
      },
    );
  }

  _drawRadiusCircle() {
    if (_debounce?.isActive ?? false) {
      _debounce?.cancel();
    }
    _debounce = Timer(
      const Duration(
        milliseconds: 100,
      ),
      () async {
        if (_circularFill != null) {
          await _mapController?.removeFill(_circularFill!);
          _circularFill = null;
        }
        if (_circularFill == null && _currentPosition != null) {
          _circularFill = await _mapController?.addFill(
            FillOptions(
              geometry: [
                _radiusProvider!.drawCircle(_currentPosition!, 1),
              ],
              fillColor: "#FE6B01",
              fillOutlineColor: "#FE6B01",
              fillOpacity: 0.15,
            ),
          );
        }
      },
    );
  }

  _animateCameraToCurrentPosition(LatLng location) {
    _mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: location,
          zoom: _radiusProvider?.getZoomLevel() ?? 0,
          bearing: 0,
        ),
      ),
    );
  }

  listenOnLocationChanges() {
    _fetchLocationProvider!.locationStream.listen(
      (event) {
        _currentPosition = LatLng(event.latitude, event.longitude);
      },
    );
  }

  @override
  void dispose() {
    _fetchLocationProvider?.locationStreamController?.close();
    _mapController = null;
    _mapController?.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  Widget _radiusPlusMinusWidget(int type) {
    return InkWell(
      onTap: () {
        bool isNeedToAnimate = _radiusProvider?.updateRadius(type) ?? false;
        if (isNeedToAnimate) {
          _animateCameraToCurrentPosition(
            _currentPosition!,
          );
          _drawRadiusCircle();
        }
      },
      splashColor: StaticFunctions.getColor(
        context,
        ColorEnum.touchSplashColor,
      ),
      child: Container(
        width: Dimensions.radiusFieldsHeight.w,
        height: Dimensions.radiusFieldsHeight.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            Dimensions.radiusFieldsRadius.r,
          ),
          border: Border.all(
            color: StaticFunctions.getColor(
              context,
              ColorEnum.borderColorE0,
            ),
            width: Dimensions.radiusFieldsBorderWidth.w,
          ),
          color: StaticFunctions.getColor(
            context,
            ColorEnum.blueColor,
          ).withOpacity(0.08),
        ),
        child: Center(
          child: SvgPicture.asset(
            type == _radiusProvider?.minus
                ? Strings.iconRadiusMinus
                : Strings.iconRadiusPlus,
            width: Dimensions.radiusFieldIconWidth.w,
            height: type == _radiusProvider?.minus
                ? Dimensions.radiusFieldIconHeight.h
                : Dimensions.radiusFieldIconWidth.w,
          ),
        ),
      ),
    );
  }

  _moveToMyLocation() {
    if (_currentPosition != null) {
      _animateCameraToCurrentPosition(
        _currentPosition!,
      );
      _drawRadiusCircle();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ThemeConfig.appBar(context),
      backgroundColor: StaticFunctions.getColor(
        context,
        ColorEnum.whiteColor,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ToolBar(
              title: localizationsContext!.settingTitleRadius,
              customIconSvgPath: Strings.iconInfo,
              onCustomIconClicked: () {
                _radiusProvider?.showRadiusInfo();
              },
            ),
            Expanded(
              child: Stack(
                children: [
                  Stack(
                    children: [
                      MapboxMap(
                        styleString: AppConfig.mapboxStyle,
                        accessToken: AppConfig.mapboxAccessToken,
                        onMapCreated: _onMapCreated,
                        zoomGesturesEnabled: false,
                        dragEnabled: false,
                        doubleClickZoomEnabled: false,
                        rotateGesturesEnabled: false,
                        compassEnabled: false,
                        scrollGesturesEnabled: false,
                        tiltGesturesEnabled: false,
                        initialCameraPosition: CameraPosition(
                          target: _currentPosition ?? LatLng(0, 0),
                          zoom: _radiusProvider?.getZoomLevel() ?? 0,
                        ),
                      ),
                      Positioned(
                        bottom: Dimensions.currentLocationContainerMargin.w,
                        right: 0,
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: Dimensions.screenHorizontalMargin.w,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              Dimensions.currentLocationIconContainerRadius.r,
                            ),
                            color: StaticFunctions.getColor(
                              context,
                              ColorEnum.themeColor,
                            ),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              splashColor: StaticFunctions.getColor(
                                context,
                                ColorEnum.touchSplashColor,
                              ),
                              borderRadius: BorderRadius.circular(
                                Dimensions.currentLocationIconContainerRadius.r,
                              ),
                              onTap: () {
                                _moveToMyLocation();
                              },
                              child: Container(
                                padding: EdgeInsets.all(
                                  Dimensions.currentLocationContainerPadding.w,
                                ),
                                child: Center(
                                  child: SvgPicture.asset(
                                    Strings.iconCurrentLocation,
                                    width: Dimensions.currentLocationIconSize.w,
                                    height:
                                        Dimensions.currentLocationIconSize.w,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: IgnorePointer(
                          child: Stack(
                            children: [
                              Center(
                                child: SvgPicture.asset(
                                  Strings.iconOrangeMarker,
                                  width: Dimensions.currentLocationMarkerSize.w,
                                  height:
                                      Dimensions.currentLocationMarkerSize.w,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Selector<RadiusProvider, bool>(
                    selector: (_, state) => state.isMapCreated,
                    shouldRebuild: (prev, next) => true,
                    builder: (context, isMapCreated, child) {
                      return LoadingMapWidget(
                        isMapCreated: isMapCreated,
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              height: Dimensions.radiusShadowHeight.h,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: StaticFunctions.getColor(
                      context,
                      ColorEnum.shadowColor,
                    ),
                    blurRadius: Dimensions.radiusShadowRadius.r,
                  ),
                ],
              ),
            ),
            Selector<RadiusProvider, bool>(
              selector: (_, state) => state.radiusInfoVisible,
              shouldRebuild: (prev, next) => prev != next,
              builder: (context, isVisible, child) {
                if (!isVisible) {
                  return const SizedBox();
                }
                return Column(
                  children: [
                    Container(
                      width: double.infinity,
                      color: StaticFunctions.getColor(
                        context,
                        ColorEnum.whiteColor,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: Dimensions.screenHorizontalMargin.w,
                          right: Dimensions.screenHorizontalMargin.w,
                          top: Dimensions.screenHorizontalMargin.h,
                          bottom: Dimensions.screenHorizontalMargin.h,
                        ),
                        child: Text(
                          localizationsContext!.radiusInfo,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: Dimensions.bottomSheetTitleTextSize.sp,
                            color: StaticFunctions.getColor(
                              context,
                              ColorEnum.blackColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    LightDivider(),
                  ],
                );
              },
            ),
            SizedBox(
              height: Dimensions.screenVerticalMarginBottom.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.screenHorizontalMargin.w,
              ),
              child: Row(
                children: [
                  _radiusPlusMinusWidget(_radiusProvider!.minus),
                  SizedBox(
                    width: Dimensions.radiusFieldsHorizontalPadding.w,
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      width: Dimensions.radiusFieldsHeight.w,
                      height: Dimensions.radiusFieldsHeight.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          Dimensions.radiusFieldsRadius.r,
                        ),
                        border: Border.all(
                          color: StaticFunctions.getColor(
                            context,
                            ColorEnum.borderColorE0,
                          ),
                          width: Dimensions.radiusFieldsBorderWidth.w,
                        ),
                        color: StaticFunctions.getColor(
                          context,
                          ColorEnum.whiteColor,
                        ),
                      ),
                      child: Selector<RadiusProvider, int>(
                        selector: (_, state) => state.radius,
                        builder: (context, value, child) {
                          return Text(
                            '$value ${localizationsContext!.radiusKiloMeter}',
                            style: TextStyle(
                              color: StaticFunctions.getColor(
                                context,
                                ColorEnum.blackColor,
                              ),
                              fontWeight: FontWeight.w600,
                              fontSize: Dimensions.radiusFieldTextSize.sp,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Dimensions.radiusFieldsHorizontalPadding.w,
                  ),
                  _radiusPlusMinusWidget(_radiusProvider!.plus),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.screenHorizontalMargin.w,
                vertical: Dimensions.screenVerticalMarginBottom.h,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: ButtonWidget(
                      text: localizationsContext!.radiusReset,
                      textColor: StaticFunctions.getColor(
                        context,
                        ColorEnum.themeColor,
                      ),
                      bgColor: StaticFunctions.getColor(
                        context,
                        ColorEnum.themeColorOpacity3Percentage,
                      ),
                      borderColor: StaticFunctions.getColor(
                        context,
                        ColorEnum.borderColorE0,
                      ),
                      onClick: () {
                        bool isNeedToAnimate =
                            _radiusProvider?.resetRadius() ?? false;
                        if (isNeedToAnimate) {
                          _animateCameraToCurrentPosition(
                            _currentPosition!,
                          );
                          _drawRadiusCircle();
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    width: Dimensions.radiusButtonsHorizontalMargin.w,
                  ),
                  Expanded(
                    child: ButtonWidget(
                      text: localizationsContext!.radiusApply,
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
                      onClick: () async {
                        _radiusProvider?.applyRadius();
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
