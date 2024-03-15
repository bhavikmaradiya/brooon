import 'package:flutter/material.dart';

class LocationProvider extends ChangeNotifier {
  bool _isMapCreated = false;

  bool get isMapCreated => _isMapCreated;

  set setMapCreated(bool value) {
    _isMapCreated = value;
    notifyListeners();
  }
}
