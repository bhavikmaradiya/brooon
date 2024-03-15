import 'dart:convert';

import '../../../../generated/json/base/json_field.dart';
import '../../../../generated/json/google_places_response_entity.g.dart';

@JsonSerializable()
class GooglePlacesResponseEntity {
  List<GooglePlacesResponsePredictions>? predictions;
  String? status;

  GooglePlacesResponseEntity();

  factory GooglePlacesResponseEntity.fromJson(Map<String, dynamic> json) =>
      $GooglePlacesResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => $GooglePlacesResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class GooglePlacesResponsePredictions {
  String? description;
  @JSONField(name: "matched_substrings")
  List<GooglePlacesResponsePredictionsMatchedSubstrings>? matchedSubstrings;
  @JSONField(name: "place_id")
  String? placeId;
  String? reference;
  @JSONField(name: "structured_formatting")
  GooglePlacesResponsePredictionsStructuredFormatting? structuredFormatting;
  List<GooglePlacesResponsePredictionsTerms>? terms;
  List<String>? types;

  GooglePlacesResponsePredictions();

  factory GooglePlacesResponsePredictions.fromJson(Map<String, dynamic> json) =>
      $GooglePlacesResponsePredictionsFromJson(json);

  Map<String, dynamic> toJson() => $GooglePlacesResponsePredictionsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class GooglePlacesResponsePredictionsMatchedSubstrings {
  int? length;
  int? offset;

  GooglePlacesResponsePredictionsMatchedSubstrings();

  factory GooglePlacesResponsePredictionsMatchedSubstrings.fromJson(
          Map<String, dynamic> json) =>
      $GooglePlacesResponsePredictionsMatchedSubstringsFromJson(json);

  Map<String, dynamic> toJson() =>
      $GooglePlacesResponsePredictionsMatchedSubstringsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class GooglePlacesResponsePredictionsStructuredFormatting {
  @JSONField(name: "main_text")
  String? mainText;
  @JSONField(name: "main_text_matched_substrings")
  List<GooglePlacesResponsePredictionsStructuredFormattingMainTextMatchedSubstrings>?
      mainTextMatchedSubstrings;
  @JSONField(name: "secondary_text")
  String? secondaryText;
  @JSONField(name: "secondary_text_matched_substrings")
  List<GooglePlacesResponsePredictionsStructuredFormattingSecondaryTextMatchedSubstrings>?
      secondaryTextMatchedSubstrings;

  GooglePlacesResponsePredictionsStructuredFormatting();

  factory GooglePlacesResponsePredictionsStructuredFormatting.fromJson(
          Map<String, dynamic> json) =>
      $GooglePlacesResponsePredictionsStructuredFormattingFromJson(json);

  Map<String, dynamic> toJson() =>
      $GooglePlacesResponsePredictionsStructuredFormattingToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class GooglePlacesResponsePredictionsStructuredFormattingMainTextMatchedSubstrings {
  int? length;
  int? offset;

  GooglePlacesResponsePredictionsStructuredFormattingMainTextMatchedSubstrings();

  factory GooglePlacesResponsePredictionsStructuredFormattingMainTextMatchedSubstrings.fromJson(
          Map<String, dynamic> json) =>
      $GooglePlacesResponsePredictionsStructuredFormattingMainTextMatchedSubstringsFromJson(
          json);

  Map<String, dynamic> toJson() =>
      $GooglePlacesResponsePredictionsStructuredFormattingMainTextMatchedSubstringsToJson(
          this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class GooglePlacesResponsePredictionsStructuredFormattingSecondaryTextMatchedSubstrings {
  int? length;
  int? offset;

  GooglePlacesResponsePredictionsStructuredFormattingSecondaryTextMatchedSubstrings();

  factory GooglePlacesResponsePredictionsStructuredFormattingSecondaryTextMatchedSubstrings.fromJson(
          Map<String, dynamic> json) =>
      $GooglePlacesResponsePredictionsStructuredFormattingSecondaryTextMatchedSubstringsFromJson(
          json);

  Map<String, dynamic> toJson() =>
      $GooglePlacesResponsePredictionsStructuredFormattingSecondaryTextMatchedSubstringsToJson(
          this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class GooglePlacesResponsePredictionsTerms {
  int? offset;
  String? value;

  GooglePlacesResponsePredictionsTerms();

  factory GooglePlacesResponsePredictionsTerms.fromJson(
          Map<String, dynamic> json) =>
      $GooglePlacesResponsePredictionsTermsFromJson(json);

  Map<String, dynamic> toJson() =>
      $GooglePlacesResponsePredictionsTermsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
