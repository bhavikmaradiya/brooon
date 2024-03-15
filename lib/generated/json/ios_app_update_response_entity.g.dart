import 'package:brooon/generated/json/base/json_convert_content.dart';
import 'package:brooon/views/app_update/api_response/ios_app_update_response_entity.dart';

IosAppUpdateResponseEntity $IosAppUpdateResponseEntityFromJson(Map<String, dynamic> json) {
	final IosAppUpdateResponseEntity iosAppUpdateResponseEntity = IosAppUpdateResponseEntity();
	final int? resultCount = jsonConvert.convert<int>(json['resultCount']);
	if (resultCount != null) {
		iosAppUpdateResponseEntity.resultCount = resultCount;
	}
	final List<IosAppUpdateResponseResults>? results = jsonConvert.convertListNotNull<IosAppUpdateResponseResults>(json['results']);
	if (results != null) {
		iosAppUpdateResponseEntity.results = results;
	}
	return iosAppUpdateResponseEntity;
}

Map<String, dynamic> $IosAppUpdateResponseEntityToJson(IosAppUpdateResponseEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['resultCount'] = entity.resultCount;
	data['results'] =  entity.results?.map((v) => v.toJson()).toList();
	return data;
}

IosAppUpdateResponseResults $IosAppUpdateResponseResultsFromJson(Map<String, dynamic> json) {
	final IosAppUpdateResponseResults iosAppUpdateResponseResults = IosAppUpdateResponseResults();
	final bool? isGameCenterEnabled = jsonConvert.convert<bool>(json['isGameCenterEnabled']);
	if (isGameCenterEnabled != null) {
		iosAppUpdateResponseResults.isGameCenterEnabled = isGameCenterEnabled;
	}
	final List<String>? features = jsonConvert.convertListNotNull<String>(json['features']);
	if (features != null) {
		iosAppUpdateResponseResults.features = features;
	}
	final List<dynamic>? advisories = jsonConvert.convertListNotNull<dynamic>(json['advisories']);
	if (advisories != null) {
		iosAppUpdateResponseResults.advisories = advisories;
	}
	final List<String>? supportedDevices = jsonConvert.convertListNotNull<String>(json['supportedDevices']);
	if (supportedDevices != null) {
		iosAppUpdateResponseResults.supportedDevices = supportedDevices;
	}
	final String? kind = jsonConvert.convert<String>(json['kind']);
	if (kind != null) {
		iosAppUpdateResponseResults.kind = kind;
	}
	final List<String>? ipadScreenshotUrls = jsonConvert.convertListNotNull<String>(json['ipadScreenshotUrls']);
	if (ipadScreenshotUrls != null) {
		iosAppUpdateResponseResults.ipadScreenshotUrls = ipadScreenshotUrls;
	}
	final List<dynamic>? appletvScreenshotUrls = jsonConvert.convertListNotNull<dynamic>(json['appletvScreenshotUrls']);
	if (appletvScreenshotUrls != null) {
		iosAppUpdateResponseResults.appletvScreenshotUrls = appletvScreenshotUrls;
	}
	final String? artworkUrl60 = jsonConvert.convert<String>(json['artworkUrl60']);
	if (artworkUrl60 != null) {
		iosAppUpdateResponseResults.artworkUrl60 = artworkUrl60;
	}
	final String? artworkUrl512 = jsonConvert.convert<String>(json['artworkUrl512']);
	if (artworkUrl512 != null) {
		iosAppUpdateResponseResults.artworkUrl512 = artworkUrl512;
	}
	final String? artworkUrl100 = jsonConvert.convert<String>(json['artworkUrl100']);
	if (artworkUrl100 != null) {
		iosAppUpdateResponseResults.artworkUrl100 = artworkUrl100;
	}
	final String? artistViewUrl = jsonConvert.convert<String>(json['artistViewUrl']);
	if (artistViewUrl != null) {
		iosAppUpdateResponseResults.artistViewUrl = artistViewUrl;
	}
	final List<String>? screenshotUrls = jsonConvert.convertListNotNull<String>(json['screenshotUrls']);
	if (screenshotUrls != null) {
		iosAppUpdateResponseResults.screenshotUrls = screenshotUrls;
	}
	final String? currency = jsonConvert.convert<String>(json['currency']);
	if (currency != null) {
		iosAppUpdateResponseResults.currency = currency;
	}
	final String? releaseNotes = jsonConvert.convert<String>(json['releaseNotes']);
	if (releaseNotes != null) {
		iosAppUpdateResponseResults.releaseNotes = releaseNotes;
	}
	final int? artistId = jsonConvert.convert<int>(json['artistId']);
	if (artistId != null) {
		iosAppUpdateResponseResults.artistId = artistId;
	}
	final String? artistName = jsonConvert.convert<String>(json['artistName']);
	if (artistName != null) {
		iosAppUpdateResponseResults.artistName = artistName;
	}
	final List<String>? genres = jsonConvert.convertListNotNull<String>(json['genres']);
	if (genres != null) {
		iosAppUpdateResponseResults.genres = genres;
	}
	final double? price = jsonConvert.convert<double>(json['price']);
	if (price != null) {
		iosAppUpdateResponseResults.price = price;
	}
	final String? description = jsonConvert.convert<String>(json['description']);
	if (description != null) {
		iosAppUpdateResponseResults.description = description;
	}
	final int? trackId = jsonConvert.convert<int>(json['trackId']);
	if (trackId != null) {
		iosAppUpdateResponseResults.trackId = trackId;
	}
	final String? trackName = jsonConvert.convert<String>(json['trackName']);
	if (trackName != null) {
		iosAppUpdateResponseResults.trackName = trackName;
	}
	final String? currentVersionReleaseDate = jsonConvert.convert<String>(json['currentVersionReleaseDate']);
	if (currentVersionReleaseDate != null) {
		iosAppUpdateResponseResults.currentVersionReleaseDate = currentVersionReleaseDate;
	}
	final String? sellerName = jsonConvert.convert<String>(json['sellerName']);
	if (sellerName != null) {
		iosAppUpdateResponseResults.sellerName = sellerName;
	}
	final String? primaryGenreName = jsonConvert.convert<String>(json['primaryGenreName']);
	if (primaryGenreName != null) {
		iosAppUpdateResponseResults.primaryGenreName = primaryGenreName;
	}
	final int? primaryGenreId = jsonConvert.convert<int>(json['primaryGenreId']);
	if (primaryGenreId != null) {
		iosAppUpdateResponseResults.primaryGenreId = primaryGenreId;
	}
	final String? bundleId = jsonConvert.convert<String>(json['bundleId']);
	if (bundleId != null) {
		iosAppUpdateResponseResults.bundleId = bundleId;
	}
	final bool? isVppDeviceBasedLicensingEnabled = jsonConvert.convert<bool>(json['isVppDeviceBasedLicensingEnabled']);
	if (isVppDeviceBasedLicensingEnabled != null) {
		iosAppUpdateResponseResults.isVppDeviceBasedLicensingEnabled = isVppDeviceBasedLicensingEnabled;
	}
	final List<String>? genreIds = jsonConvert.convertListNotNull<String>(json['genreIds']);
	if (genreIds != null) {
		iosAppUpdateResponseResults.genreIds = genreIds;
	}
	final String? releaseDate = jsonConvert.convert<String>(json['releaseDate']);
	if (releaseDate != null) {
		iosAppUpdateResponseResults.releaseDate = releaseDate;
	}
	final String? version = jsonConvert.convert<String>(json['version']);
	if (version != null) {
		iosAppUpdateResponseResults.version = version;
	}
	final String? wrapperType = jsonConvert.convert<String>(json['wrapperType']);
	if (wrapperType != null) {
		iosAppUpdateResponseResults.wrapperType = wrapperType;
	}
	final String? trackViewUrl = jsonConvert.convert<String>(json['trackViewUrl']);
	if (trackViewUrl != null) {
		iosAppUpdateResponseResults.trackViewUrl = trackViewUrl;
	}
	final String? minimumOsVersion = jsonConvert.convert<String>(json['minimumOsVersion']);
	if (minimumOsVersion != null) {
		iosAppUpdateResponseResults.minimumOsVersion = minimumOsVersion;
	}
	final String? trackCensoredName = jsonConvert.convert<String>(json['trackCensoredName']);
	if (trackCensoredName != null) {
		iosAppUpdateResponseResults.trackCensoredName = trackCensoredName;
	}
	final List<String>? languageCodesISO2A = jsonConvert.convertListNotNull<String>(json['languageCodesISO2A']);
	if (languageCodesISO2A != null) {
		iosAppUpdateResponseResults.languageCodesISO2A = languageCodesISO2A;
	}
	final String? fileSizeBytes = jsonConvert.convert<String>(json['fileSizeBytes']);
	if (fileSizeBytes != null) {
		iosAppUpdateResponseResults.fileSizeBytes = fileSizeBytes;
	}
	final String? formattedPrice = jsonConvert.convert<String>(json['formattedPrice']);
	if (formattedPrice != null) {
		iosAppUpdateResponseResults.formattedPrice = formattedPrice;
	}
	final String? contentAdvisoryRating = jsonConvert.convert<String>(json['contentAdvisoryRating']);
	if (contentAdvisoryRating != null) {
		iosAppUpdateResponseResults.contentAdvisoryRating = contentAdvisoryRating;
	}
	final int? averageUserRatingForCurrentVersion = jsonConvert.convert<int>(json['averageUserRatingForCurrentVersion']);
	if (averageUserRatingForCurrentVersion != null) {
		iosAppUpdateResponseResults.averageUserRatingForCurrentVersion = averageUserRatingForCurrentVersion;
	}
	final int? userRatingCountForCurrentVersion = jsonConvert.convert<int>(json['userRatingCountForCurrentVersion']);
	if (userRatingCountForCurrentVersion != null) {
		iosAppUpdateResponseResults.userRatingCountForCurrentVersion = userRatingCountForCurrentVersion;
	}
	final int? averageUserRating = jsonConvert.convert<int>(json['averageUserRating']);
	if (averageUserRating != null) {
		iosAppUpdateResponseResults.averageUserRating = averageUserRating;
	}
	final String? trackContentRating = jsonConvert.convert<String>(json['trackContentRating']);
	if (trackContentRating != null) {
		iosAppUpdateResponseResults.trackContentRating = trackContentRating;
	}
	final int? userRatingCount = jsonConvert.convert<int>(json['userRatingCount']);
	if (userRatingCount != null) {
		iosAppUpdateResponseResults.userRatingCount = userRatingCount;
	}
	return iosAppUpdateResponseResults;
}

Map<String, dynamic> $IosAppUpdateResponseResultsToJson(IosAppUpdateResponseResults entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['isGameCenterEnabled'] = entity.isGameCenterEnabled;
	data['features'] =  entity.features;
	data['advisories'] =  entity.advisories;
	data['supportedDevices'] =  entity.supportedDevices;
	data['kind'] = entity.kind;
	data['ipadScreenshotUrls'] =  entity.ipadScreenshotUrls;
	data['appletvScreenshotUrls'] =  entity.appletvScreenshotUrls;
	data['artworkUrl60'] = entity.artworkUrl60;
	data['artworkUrl512'] = entity.artworkUrl512;
	data['artworkUrl100'] = entity.artworkUrl100;
	data['artistViewUrl'] = entity.artistViewUrl;
	data['screenshotUrls'] =  entity.screenshotUrls;
	data['currency'] = entity.currency;
	data['releaseNotes'] = entity.releaseNotes;
	data['artistId'] = entity.artistId;
	data['artistName'] = entity.artistName;
	data['genres'] =  entity.genres;
	data['price'] = entity.price;
	data['description'] = entity.description;
	data['trackId'] = entity.trackId;
	data['trackName'] = entity.trackName;
	data['currentVersionReleaseDate'] = entity.currentVersionReleaseDate;
	data['sellerName'] = entity.sellerName;
	data['primaryGenreName'] = entity.primaryGenreName;
	data['primaryGenreId'] = entity.primaryGenreId;
	data['bundleId'] = entity.bundleId;
	data['isVppDeviceBasedLicensingEnabled'] = entity.isVppDeviceBasedLicensingEnabled;
	data['genreIds'] =  entity.genreIds;
	data['releaseDate'] = entity.releaseDate;
	data['version'] = entity.version;
	data['wrapperType'] = entity.wrapperType;
	data['trackViewUrl'] = entity.trackViewUrl;
	data['minimumOsVersion'] = entity.minimumOsVersion;
	data['trackCensoredName'] = entity.trackCensoredName;
	data['languageCodesISO2A'] =  entity.languageCodesISO2A;
	data['fileSizeBytes'] = entity.fileSizeBytes;
	data['formattedPrice'] = entity.formattedPrice;
	data['contentAdvisoryRating'] = entity.contentAdvisoryRating;
	data['averageUserRatingForCurrentVersion'] = entity.averageUserRatingForCurrentVersion;
	data['userRatingCountForCurrentVersion'] = entity.userRatingCountForCurrentVersion;
	data['averageUserRating'] = entity.averageUserRating;
	data['trackContentRating'] = entity.trackContentRating;
	data['userRatingCount'] = entity.userRatingCount;
	return data;
}