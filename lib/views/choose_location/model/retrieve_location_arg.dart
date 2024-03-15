import 'package:mapbox_gl/mapbox_gl.dart';

class RetrieveLocationArg {
  final String? areaName;
  final bool? useCurrentLocation;
  final String? placeId;
  final String? landMarkLocationForLocationField;
  LatLng? coordinates;

  RetrieveLocationArg({
    this.areaName,
    this.coordinates,
    this.useCurrentLocation = false,
    this.placeId,
    this.landMarkLocationForLocationField,
  });
}
