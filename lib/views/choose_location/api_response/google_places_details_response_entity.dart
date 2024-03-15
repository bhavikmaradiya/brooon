import 'dart:convert';

import '../../../../generated/json/base/json_field.dart';
import '../../../../generated/json/google_places_details_response_entity.g.dart';

@JsonSerializable()
class GooglePlacesDetailsResponseEntity {
  @JSONField(name: "html_attributions")
  List<dynamic>? htmlAttributions;
  GooglePlacesDetailsResponseResult? result;
  String? status;

  GooglePlacesDetailsResponseEntity();

  factory GooglePlacesDetailsResponseEntity.fromJson(
          Map<String, dynamic> json) =>
      $GooglePlacesDetailsResponseEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      $GooglePlacesDetailsResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class GooglePlacesDetailsResponseResult {
  GooglePlacesDetailsResponseResultGeometry? geometry;

  GooglePlacesDetailsResponseResult();

  factory GooglePlacesDetailsResponseResult.fromJson(
          Map<String, dynamic> json) =>
      $GooglePlacesDetailsResponseResultFromJson(json);

  Map<String, dynamic> toJson() =>
      $GooglePlacesDetailsResponseResultToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class GooglePlacesDetailsResponseResultGeometry {
  GooglePlacesDetailsResponseResultGeometryLocation? location;
  GooglePlacesDetailsResponseResultGeometryViewport? viewport;

  GooglePlacesDetailsResponseResultGeometry();

  factory GooglePlacesDetailsResponseResultGeometry.fromJson(
          Map<String, dynamic> json) =>
      $GooglePlacesDetailsResponseResultGeometryFromJson(json);

  Map<String, dynamic> toJson() =>
      $GooglePlacesDetailsResponseResultGeometryToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class GooglePlacesDetailsResponseResultGeometryLocation {
  double? lat;
  double? lng;

  GooglePlacesDetailsResponseResultGeometryLocation();

  factory GooglePlacesDetailsResponseResultGeometryLocation.fromJson(
          Map<String, dynamic> json) =>
      $GooglePlacesDetailsResponseResultGeometryLocationFromJson(json);

  Map<String, dynamic> toJson() =>
      $GooglePlacesDetailsResponseResultGeometryLocationToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class GooglePlacesDetailsResponseResultGeometryViewport {
  GooglePlacesDetailsResponseResultGeometryViewportNortheast? northeast;
  GooglePlacesDetailsResponseResultGeometryViewportSouthwest? southwest;

  GooglePlacesDetailsResponseResultGeometryViewport();

  factory GooglePlacesDetailsResponseResultGeometryViewport.fromJson(
          Map<String, dynamic> json) =>
      $GooglePlacesDetailsResponseResultGeometryViewportFromJson(json);

  Map<String, dynamic> toJson() =>
      $GooglePlacesDetailsResponseResultGeometryViewportToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class GooglePlacesDetailsResponseResultGeometryViewportNortheast {
  double? lat;
  double? lng;

  GooglePlacesDetailsResponseResultGeometryViewportNortheast();

  factory GooglePlacesDetailsResponseResultGeometryViewportNortheast.fromJson(
          Map<String, dynamic> json) =>
      $GooglePlacesDetailsResponseResultGeometryViewportNortheastFromJson(json);

  Map<String, dynamic> toJson() =>
      $GooglePlacesDetailsResponseResultGeometryViewportNortheastToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class GooglePlacesDetailsResponseResultGeometryViewportSouthwest {
  double? lat;
  double? lng;

  GooglePlacesDetailsResponseResultGeometryViewportSouthwest();

  factory GooglePlacesDetailsResponseResultGeometryViewportSouthwest.fromJson(
          Map<String, dynamic> json) =>
      $GooglePlacesDetailsResponseResultGeometryViewportSouthwestFromJson(json);

  Map<String, dynamic> toJson() =>
      $GooglePlacesDetailsResponseResultGeometryViewportSouthwestToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
