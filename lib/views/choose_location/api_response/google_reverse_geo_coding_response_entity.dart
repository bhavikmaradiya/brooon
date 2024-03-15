import 'dart:convert';

import '../../../../generated/json/base/json_field.dart';
import '../../../../generated/json/google_reverse_geo_coding_response_entity.g.dart';

@JsonSerializable()
class GoogleReverseGeoCodingResponseEntity {
  @JSONField(name: "plus_code")
  GoogleReverseGeoCodingResponsePlusCode? plusCode;
  List<GoogleReverseGeoCodingResponseResults>? results;
  String? status;

  GoogleReverseGeoCodingResponseEntity();

  factory GoogleReverseGeoCodingResponseEntity.fromJson(
          Map<String, dynamic> json) =>
      $GoogleReverseGeoCodingResponseEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      $GoogleReverseGeoCodingResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class GoogleReverseGeoCodingResponsePlusCode {
  @JSONField(name: "compound_code")
  String? compoundCode;
  @JSONField(name: "global_code")
  String? globalCode;

  GoogleReverseGeoCodingResponsePlusCode();

  factory GoogleReverseGeoCodingResponsePlusCode.fromJson(
          Map<String, dynamic> json) =>
      $GoogleReverseGeoCodingResponsePlusCodeFromJson(json);

  Map<String, dynamic> toJson() =>
      $GoogleReverseGeoCodingResponsePlusCodeToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class GoogleReverseGeoCodingResponseResults {
  @JSONField(name: "address_components")
  List<GoogleReverseGeoCodingResponseResultsAddressComponents>?
      addressComponents;
  @JSONField(name: "formatted_address")
  String? formattedAddress;
  GoogleReverseGeoCodingResponseResultsGeometry? geometry;
  @JSONField(name: "place_id")
  String? placeId;
  @JSONField(name: "plus_code")
  GoogleReverseGeoCodingResponseResultsPlusCode? plusCode;
  List<String>? types;

  GoogleReverseGeoCodingResponseResults();

  factory GoogleReverseGeoCodingResponseResults.fromJson(
          Map<String, dynamic> json) =>
      $GoogleReverseGeoCodingResponseResultsFromJson(json);

  Map<String, dynamic> toJson() =>
      $GoogleReverseGeoCodingResponseResultsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class GoogleReverseGeoCodingResponseResultsAddressComponents {
  @JSONField(name: "long_name")
  String? longName;
  @JSONField(name: "short_name")
  String? shortName;
  List<String>? types;

  GoogleReverseGeoCodingResponseResultsAddressComponents();

  factory GoogleReverseGeoCodingResponseResultsAddressComponents.fromJson(
          Map<String, dynamic> json) =>
      $GoogleReverseGeoCodingResponseResultsAddressComponentsFromJson(json);

  Map<String, dynamic> toJson() =>
      $GoogleReverseGeoCodingResponseResultsAddressComponentsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class GoogleReverseGeoCodingResponseResultsGeometry {
  GoogleReverseGeoCodingResponseResultsGeometryLocation? location;
  @JSONField(name: "location_type")
  String? locationType;
  GoogleReverseGeoCodingResponseResultsGeometryViewport? viewport;

  GoogleReverseGeoCodingResponseResultsGeometry();

  factory GoogleReverseGeoCodingResponseResultsGeometry.fromJson(
          Map<String, dynamic> json) =>
      $GoogleReverseGeoCodingResponseResultsGeometryFromJson(json);

  Map<String, dynamic> toJson() =>
      $GoogleReverseGeoCodingResponseResultsGeometryToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class GoogleReverseGeoCodingResponseResultsGeometryLocation {
  double? lat;
  double? lng;

  GoogleReverseGeoCodingResponseResultsGeometryLocation();

  factory GoogleReverseGeoCodingResponseResultsGeometryLocation.fromJson(
          Map<String, dynamic> json) =>
      $GoogleReverseGeoCodingResponseResultsGeometryLocationFromJson(json);

  Map<String, dynamic> toJson() =>
      $GoogleReverseGeoCodingResponseResultsGeometryLocationToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class GoogleReverseGeoCodingResponseResultsGeometryViewport {
  GoogleReverseGeoCodingResponseResultsGeometryViewportNortheast? northeast;
  GoogleReverseGeoCodingResponseResultsGeometryViewportSouthwest? southwest;

  GoogleReverseGeoCodingResponseResultsGeometryViewport();

  factory GoogleReverseGeoCodingResponseResultsGeometryViewport.fromJson(
          Map<String, dynamic> json) =>
      $GoogleReverseGeoCodingResponseResultsGeometryViewportFromJson(json);

  Map<String, dynamic> toJson() =>
      $GoogleReverseGeoCodingResponseResultsGeometryViewportToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class GoogleReverseGeoCodingResponseResultsGeometryViewportNortheast {
  double? lat;
  double? lng;

  GoogleReverseGeoCodingResponseResultsGeometryViewportNortheast();

  factory GoogleReverseGeoCodingResponseResultsGeometryViewportNortheast.fromJson(
          Map<String, dynamic> json) =>
      $GoogleReverseGeoCodingResponseResultsGeometryViewportNortheastFromJson(
          json);

  Map<String, dynamic> toJson() =>
      $GoogleReverseGeoCodingResponseResultsGeometryViewportNortheastToJson(
          this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class GoogleReverseGeoCodingResponseResultsGeometryViewportSouthwest {
  double? lat;
  double? lng;

  GoogleReverseGeoCodingResponseResultsGeometryViewportSouthwest();

  factory GoogleReverseGeoCodingResponseResultsGeometryViewportSouthwest.fromJson(
          Map<String, dynamic> json) =>
      $GoogleReverseGeoCodingResponseResultsGeometryViewportSouthwestFromJson(
          json);

  Map<String, dynamic> toJson() =>
      $GoogleReverseGeoCodingResponseResultsGeometryViewportSouthwestToJson(
          this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class GoogleReverseGeoCodingResponseResultsPlusCode {
  @JSONField(name: "compound_code")
  String? compoundCode;
  @JSONField(name: "global_code")
  String? globalCode;

  GoogleReverseGeoCodingResponseResultsPlusCode();

  factory GoogleReverseGeoCodingResponseResultsPlusCode.fromJson(
          Map<String, dynamic> json) =>
      $GoogleReverseGeoCodingResponseResultsPlusCodeFromJson(json);

  Map<String, dynamic> toJson() =>
      $GoogleReverseGeoCodingResponseResultsPlusCodeToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
