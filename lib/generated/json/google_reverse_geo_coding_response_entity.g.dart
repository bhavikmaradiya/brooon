import 'package:brooon/generated/json/base/json_convert_content.dart';
import 'package:brooon/views/choose_location/api_response/google_reverse_geo_coding_response_entity.dart';

GoogleReverseGeoCodingResponseEntity $GoogleReverseGeoCodingResponseEntityFromJson(Map<String, dynamic> json) {
	final GoogleReverseGeoCodingResponseEntity googleReverseGeoCodingResponseEntity = GoogleReverseGeoCodingResponseEntity();
	final GoogleReverseGeoCodingResponsePlusCode? plusCode = jsonConvert.convert<GoogleReverseGeoCodingResponsePlusCode>(json['plus_code']);
	if (plusCode != null) {
		googleReverseGeoCodingResponseEntity.plusCode = plusCode;
	}
	final List<GoogleReverseGeoCodingResponseResults>? results = jsonConvert.convertListNotNull<GoogleReverseGeoCodingResponseResults>(json['results']);
	if (results != null) {
		googleReverseGeoCodingResponseEntity.results = results;
	}
	final String? status = jsonConvert.convert<String>(json['status']);
	if (status != null) {
		googleReverseGeoCodingResponseEntity.status = status;
	}
	return googleReverseGeoCodingResponseEntity;
}

Map<String, dynamic> $GoogleReverseGeoCodingResponseEntityToJson(GoogleReverseGeoCodingResponseEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['plus_code'] = entity.plusCode?.toJson();
	data['results'] =  entity.results?.map((v) => v.toJson()).toList();
	data['status'] = entity.status;
	return data;
}

GoogleReverseGeoCodingResponsePlusCode $GoogleReverseGeoCodingResponsePlusCodeFromJson(Map<String, dynamic> json) {
	final GoogleReverseGeoCodingResponsePlusCode googleReverseGeoCodingResponsePlusCode = GoogleReverseGeoCodingResponsePlusCode();
	final String? compoundCode = jsonConvert.convert<String>(json['compound_code']);
	if (compoundCode != null) {
		googleReverseGeoCodingResponsePlusCode.compoundCode = compoundCode;
	}
	final String? globalCode = jsonConvert.convert<String>(json['global_code']);
	if (globalCode != null) {
		googleReverseGeoCodingResponsePlusCode.globalCode = globalCode;
	}
	return googleReverseGeoCodingResponsePlusCode;
}

Map<String, dynamic> $GoogleReverseGeoCodingResponsePlusCodeToJson(GoogleReverseGeoCodingResponsePlusCode entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['compound_code'] = entity.compoundCode;
	data['global_code'] = entity.globalCode;
	return data;
}

GoogleReverseGeoCodingResponseResults $GoogleReverseGeoCodingResponseResultsFromJson(Map<String, dynamic> json) {
	final GoogleReverseGeoCodingResponseResults googleReverseGeoCodingResponseResults = GoogleReverseGeoCodingResponseResults();
	final List<GoogleReverseGeoCodingResponseResultsAddressComponents>? addressComponents = jsonConvert.convertListNotNull<GoogleReverseGeoCodingResponseResultsAddressComponents>(json['address_components']);
	if (addressComponents != null) {
		googleReverseGeoCodingResponseResults.addressComponents = addressComponents;
	}
	final String? formattedAddress = jsonConvert.convert<String>(json['formatted_address']);
	if (formattedAddress != null) {
		googleReverseGeoCodingResponseResults.formattedAddress = formattedAddress;
	}
	final GoogleReverseGeoCodingResponseResultsGeometry? geometry = jsonConvert.convert<GoogleReverseGeoCodingResponseResultsGeometry>(json['geometry']);
	if (geometry != null) {
		googleReverseGeoCodingResponseResults.geometry = geometry;
	}
	final String? placeId = jsonConvert.convert<String>(json['place_id']);
	if (placeId != null) {
		googleReverseGeoCodingResponseResults.placeId = placeId;
	}
	final GoogleReverseGeoCodingResponseResultsPlusCode? plusCode = jsonConvert.convert<GoogleReverseGeoCodingResponseResultsPlusCode>(json['plus_code']);
	if (plusCode != null) {
		googleReverseGeoCodingResponseResults.plusCode = plusCode;
	}
	final List<String>? types = jsonConvert.convertListNotNull<String>(json['types']);
	if (types != null) {
		googleReverseGeoCodingResponseResults.types = types;
	}
	return googleReverseGeoCodingResponseResults;
}

Map<String, dynamic> $GoogleReverseGeoCodingResponseResultsToJson(GoogleReverseGeoCodingResponseResults entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['address_components'] =  entity.addressComponents?.map((v) => v.toJson()).toList();
	data['formatted_address'] = entity.formattedAddress;
	data['geometry'] = entity.geometry?.toJson();
	data['place_id'] = entity.placeId;
	data['plus_code'] = entity.plusCode?.toJson();
	data['types'] =  entity.types;
	return data;
}

GoogleReverseGeoCodingResponseResultsAddressComponents $GoogleReverseGeoCodingResponseResultsAddressComponentsFromJson(Map<String, dynamic> json) {
	final GoogleReverseGeoCodingResponseResultsAddressComponents googleReverseGeoCodingResponseResultsAddressComponents = GoogleReverseGeoCodingResponseResultsAddressComponents();
	final String? longName = jsonConvert.convert<String>(json['long_name']);
	if (longName != null) {
		googleReverseGeoCodingResponseResultsAddressComponents.longName = longName;
	}
	final String? shortName = jsonConvert.convert<String>(json['short_name']);
	if (shortName != null) {
		googleReverseGeoCodingResponseResultsAddressComponents.shortName = shortName;
	}
	final List<String>? types = jsonConvert.convertListNotNull<String>(json['types']);
	if (types != null) {
		googleReverseGeoCodingResponseResultsAddressComponents.types = types;
	}
	return googleReverseGeoCodingResponseResultsAddressComponents;
}

Map<String, dynamic> $GoogleReverseGeoCodingResponseResultsAddressComponentsToJson(GoogleReverseGeoCodingResponseResultsAddressComponents entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['long_name'] = entity.longName;
	data['short_name'] = entity.shortName;
	data['types'] =  entity.types;
	return data;
}

GoogleReverseGeoCodingResponseResultsGeometry $GoogleReverseGeoCodingResponseResultsGeometryFromJson(Map<String, dynamic> json) {
	final GoogleReverseGeoCodingResponseResultsGeometry googleReverseGeoCodingResponseResultsGeometry = GoogleReverseGeoCodingResponseResultsGeometry();
	final GoogleReverseGeoCodingResponseResultsGeometryLocation? location = jsonConvert.convert<GoogleReverseGeoCodingResponseResultsGeometryLocation>(json['location']);
	if (location != null) {
		googleReverseGeoCodingResponseResultsGeometry.location = location;
	}
	final String? locationType = jsonConvert.convert<String>(json['location_type']);
	if (locationType != null) {
		googleReverseGeoCodingResponseResultsGeometry.locationType = locationType;
	}
	final GoogleReverseGeoCodingResponseResultsGeometryViewport? viewport = jsonConvert.convert<GoogleReverseGeoCodingResponseResultsGeometryViewport>(json['viewport']);
	if (viewport != null) {
		googleReverseGeoCodingResponseResultsGeometry.viewport = viewport;
	}
	return googleReverseGeoCodingResponseResultsGeometry;
}

Map<String, dynamic> $GoogleReverseGeoCodingResponseResultsGeometryToJson(GoogleReverseGeoCodingResponseResultsGeometry entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['location'] = entity.location?.toJson();
	data['location_type'] = entity.locationType;
	data['viewport'] = entity.viewport?.toJson();
	return data;
}

GoogleReverseGeoCodingResponseResultsGeometryLocation $GoogleReverseGeoCodingResponseResultsGeometryLocationFromJson(Map<String, dynamic> json) {
	final GoogleReverseGeoCodingResponseResultsGeometryLocation googleReverseGeoCodingResponseResultsGeometryLocation = GoogleReverseGeoCodingResponseResultsGeometryLocation();
	final double? lat = jsonConvert.convert<double>(json['lat']);
	if (lat != null) {
		googleReverseGeoCodingResponseResultsGeometryLocation.lat = lat;
	}
	final double? lng = jsonConvert.convert<double>(json['lng']);
	if (lng != null) {
		googleReverseGeoCodingResponseResultsGeometryLocation.lng = lng;
	}
	return googleReverseGeoCodingResponseResultsGeometryLocation;
}

Map<String, dynamic> $GoogleReverseGeoCodingResponseResultsGeometryLocationToJson(GoogleReverseGeoCodingResponseResultsGeometryLocation entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['lat'] = entity.lat;
	data['lng'] = entity.lng;
	return data;
}

GoogleReverseGeoCodingResponseResultsGeometryViewport $GoogleReverseGeoCodingResponseResultsGeometryViewportFromJson(Map<String, dynamic> json) {
	final GoogleReverseGeoCodingResponseResultsGeometryViewport googleReverseGeoCodingResponseResultsGeometryViewport = GoogleReverseGeoCodingResponseResultsGeometryViewport();
	final GoogleReverseGeoCodingResponseResultsGeometryViewportNortheast? northeast = jsonConvert.convert<GoogleReverseGeoCodingResponseResultsGeometryViewportNortheast>(json['northeast']);
	if (northeast != null) {
		googleReverseGeoCodingResponseResultsGeometryViewport.northeast = northeast;
	}
	final GoogleReverseGeoCodingResponseResultsGeometryViewportSouthwest? southwest = jsonConvert.convert<GoogleReverseGeoCodingResponseResultsGeometryViewportSouthwest>(json['southwest']);
	if (southwest != null) {
		googleReverseGeoCodingResponseResultsGeometryViewport.southwest = southwest;
	}
	return googleReverseGeoCodingResponseResultsGeometryViewport;
}

Map<String, dynamic> $GoogleReverseGeoCodingResponseResultsGeometryViewportToJson(GoogleReverseGeoCodingResponseResultsGeometryViewport entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['northeast'] = entity.northeast?.toJson();
	data['southwest'] = entity.southwest?.toJson();
	return data;
}

GoogleReverseGeoCodingResponseResultsGeometryViewportNortheast $GoogleReverseGeoCodingResponseResultsGeometryViewportNortheastFromJson(Map<String, dynamic> json) {
	final GoogleReverseGeoCodingResponseResultsGeometryViewportNortheast googleReverseGeoCodingResponseResultsGeometryViewportNortheast = GoogleReverseGeoCodingResponseResultsGeometryViewportNortheast();
	final double? lat = jsonConvert.convert<double>(json['lat']);
	if (lat != null) {
		googleReverseGeoCodingResponseResultsGeometryViewportNortheast.lat = lat;
	}
	final double? lng = jsonConvert.convert<double>(json['lng']);
	if (lng != null) {
		googleReverseGeoCodingResponseResultsGeometryViewportNortheast.lng = lng;
	}
	return googleReverseGeoCodingResponseResultsGeometryViewportNortheast;
}

Map<String, dynamic> $GoogleReverseGeoCodingResponseResultsGeometryViewportNortheastToJson(GoogleReverseGeoCodingResponseResultsGeometryViewportNortheast entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['lat'] = entity.lat;
	data['lng'] = entity.lng;
	return data;
}

GoogleReverseGeoCodingResponseResultsGeometryViewportSouthwest $GoogleReverseGeoCodingResponseResultsGeometryViewportSouthwestFromJson(Map<String, dynamic> json) {
	final GoogleReverseGeoCodingResponseResultsGeometryViewportSouthwest googleReverseGeoCodingResponseResultsGeometryViewportSouthwest = GoogleReverseGeoCodingResponseResultsGeometryViewportSouthwest();
	final double? lat = jsonConvert.convert<double>(json['lat']);
	if (lat != null) {
		googleReverseGeoCodingResponseResultsGeometryViewportSouthwest.lat = lat;
	}
	final double? lng = jsonConvert.convert<double>(json['lng']);
	if (lng != null) {
		googleReverseGeoCodingResponseResultsGeometryViewportSouthwest.lng = lng;
	}
	return googleReverseGeoCodingResponseResultsGeometryViewportSouthwest;
}

Map<String, dynamic> $GoogleReverseGeoCodingResponseResultsGeometryViewportSouthwestToJson(GoogleReverseGeoCodingResponseResultsGeometryViewportSouthwest entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['lat'] = entity.lat;
	data['lng'] = entity.lng;
	return data;
}

GoogleReverseGeoCodingResponseResultsPlusCode $GoogleReverseGeoCodingResponseResultsPlusCodeFromJson(Map<String, dynamic> json) {
	final GoogleReverseGeoCodingResponseResultsPlusCode googleReverseGeoCodingResponseResultsPlusCode = GoogleReverseGeoCodingResponseResultsPlusCode();
	final String? compoundCode = jsonConvert.convert<String>(json['compound_code']);
	if (compoundCode != null) {
		googleReverseGeoCodingResponseResultsPlusCode.compoundCode = compoundCode;
	}
	final String? globalCode = jsonConvert.convert<String>(json['global_code']);
	if (globalCode != null) {
		googleReverseGeoCodingResponseResultsPlusCode.globalCode = globalCode;
	}
	return googleReverseGeoCodingResponseResultsPlusCode;
}

Map<String, dynamic> $GoogleReverseGeoCodingResponseResultsPlusCodeToJson(GoogleReverseGeoCodingResponseResultsPlusCode entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['compound_code'] = entity.compoundCode;
	data['global_code'] = entity.globalCode;
	return data;
}