import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

import '../../localdb/isar_service.dart';
import '../../localdb/user_info/db_user_info.dart';
import '../../network/dio_client.dart';
import '../../utils/app_config.dart';
import '../settings/api_request/settings_api_request.dart';

class RadiusProvider extends ChangeNotifier {
  final isarService = IsarService();
  final double _zoomLevelMax = 12;
  final double _zoomLevelMedium = 10.5;
  final double _zoomLevelMin = 9.5;
  int radius = AppConfig.defaultRadius;
  final minus = 1;
  final plus = 2;
  DbUserInfo? userInfo;
  bool _radiusInfoVisible = false;
  bool _isMapCreated = false;

  bool get isMapCreated => _isMapCreated;

  bool get radiusInfoVisible => _radiusInfoVisible;

  set setMapCreated(bool value) {
    _isMapCreated = value;
    notifyListeners();
  }

  init() async {
    userInfo = await isarService.getUserInfo();
    radius = userInfo?.radius ?? radius;
    notifyListeners();
  }

  bool resetRadius() {
    if (radius != AppConfig.defaultRadius) {
      radius = AppConfig.defaultRadius;
      notifyListeners();
      return true;
    }
    return false;
  }

  bool updateRadius(int type) {
    bool isValueNeedToUpdate = false;
    if (type == minus) {
      if (radius != AppConfig.minRadius) {
        isValueNeedToUpdate = true;
        radius -= 1;
      }
    } else {
      if (radius != AppConfig.maxRadius) {
        isValueNeedToUpdate = true;
        radius += 1;
      }
    }
    if (isValueNeedToUpdate) {
      notifyListeners();
    }
    return isValueNeedToUpdate;
  }

  applyRadius() async {
    if (userInfo != null) {
      userInfo!.radius = radius;
      await isarService.saveOrUpdateUserInfo(userInfo!);
      _updateSettingsToServer();
    }
  }

  double getZoomLevel() {
    return radius < (AppConfig.maxRadius / 4)
        ? _zoomLevelMax
        : radius < (AppConfig.maxRadius / 2)
            ? _zoomLevelMedium
            : _zoomLevelMin;
  }

  List<LatLng> drawCircle(LatLng point, [int dir = 1]) {
    final radiusInKm = radius * 1000;
    var d2r = pi / 180; // degrees to radians
    var r2d = 180 / pi; // radians to degrees
    var earthsRadius = 6371000; // radius of the earth in meters

    var points = 32;

    // find the radius in lat/lon
    var rLat = (radiusInKm / earthsRadius) * r2d;
    var rLng = rLat / cos(point.latitude * d2r);

    List<LatLng> latLngList = [];
    int start = 0;
    int end = points + 1;
    if (dir == -1) {
      start = points + 1;
      end = 0;
    }
    for (var i = start; (dir == 1 ? i < end : i > end); i = i + dir) {
      var theta = pi * (i / (points / 2));
      // center a + radius x * cos(theta)
      double ey = point.longitude + (rLng * cos(theta));
      // center b + radius y * sin(theta)
      double ex = point.latitude + (rLat * sin(theta));
      latLngList.add(LatLng(ex, ey));
    }
    return latLngList;
  }

  _updateSettingsToServer() {
    DioClient().updateSettings(
      SettingsApiRequest().toMap(
        SettingsApiRequest()..radius = radius,
      ),
    );
  }

  showRadiusInfo() {
    _radiusInfoVisible = true;
    notifyListeners();
  }

}
