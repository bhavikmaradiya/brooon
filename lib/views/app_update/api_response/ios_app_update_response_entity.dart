import 'dart:convert';

import '../../../generated/json/base/json_field.dart';
import '../../../generated/json/ios_app_update_response_entity.g.dart';

@JsonSerializable()
class IosAppUpdateResponseEntity {
  int? resultCount;
  List<IosAppUpdateResponseResults>? results;

  IosAppUpdateResponseEntity();

  factory IosAppUpdateResponseEntity.fromJson(Map<String, dynamic> json) =>
      $IosAppUpdateResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => $IosAppUpdateResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class IosAppUpdateResponseResults {
  bool? isGameCenterEnabled;
  List<String>? features;
  List<dynamic>? advisories;
  List<String>? supportedDevices;
  String? kind;
  List<String>? ipadScreenshotUrls;
  List<dynamic>? appletvScreenshotUrls;
  String? artworkUrl60;
  String? artworkUrl512;
  String? artworkUrl100;
  String? artistViewUrl;
  List<String>? screenshotUrls;
  String? currency;
  String? releaseNotes;
  int? artistId;
  String? artistName;
  List<String>? genres;
  double? price;
  String? description;
  int? trackId;
  String? trackName;
  String? currentVersionReleaseDate;
  String? sellerName;
  String? primaryGenreName;
  int? primaryGenreId;
  String? bundleId;
  bool? isVppDeviceBasedLicensingEnabled;
  List<String>? genreIds;
  String? releaseDate;
  String? version;
  String? wrapperType;
  String? trackViewUrl;
  String? minimumOsVersion;
  String? trackCensoredName;
  List<String>? languageCodesISO2A;
  String? fileSizeBytes;
  String? formattedPrice;
  String? contentAdvisoryRating;
  int? averageUserRatingForCurrentVersion;
  int? userRatingCountForCurrentVersion;
  int? averageUserRating;
  String? trackContentRating;
  int? userRatingCount;

  IosAppUpdateResponseResults();

  factory IosAppUpdateResponseResults.fromJson(Map<String, dynamic> json) =>
      $IosAppUpdateResponseResultsFromJson(json);

  Map<String, dynamic> toJson() => $IosAppUpdateResponseResultsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
