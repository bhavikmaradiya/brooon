import 'package:brooon/generated/json/base/json_convert_content.dart';
import 'package:brooon/views/choose_location/api_response/google_places_details_response_entity.dart';

GooglePlacesDetailsResponseEntity $GooglePlacesDetailsResponseEntityFromJson(Map<String, dynamic> json) {
	final GooglePlacesDetailsResponseEntity googlePlacesDetailsResponseEntity = GooglePlacesDetailsResponseEntity();
	final List<dynamic>? htmlAttributions = jsonConvert.convertListNotNull<dynamic>(json['html_attributions']);
	if (htmlAttributions != null) {
		googlePlacesDetailsResponseEntity.htmlAttributions = htmlAttributions;
	}
	final GooglePlacesDetailsResponseResult? result = jsonConvert.convert<GooglePlacesDetailsResponseResult>(json['result']);
	if (result != null) {
		googlePlacesDetailsResponseEntity.result = result;
	}
	final String? status = jsonConvert.convert<String>(json['status']);
	if (status != null) {
		googlePlacesDetailsResponseEntity.status = status;
	}
	return googlePlacesDetailsResponseEntity;
}

Map<String, dynamic> $GooglePlacesDetailsResponseEntityToJson(GooglePlacesDetailsResponseEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['html_attributions'] =  entity.htmlAttributions;
	data['result'] = entity.result?.toJson();
	data['status'] = entity.status;
	return data;
}

GooglePlacesDetailsResponseResult $GooglePlacesDetailsResponseResultFromJson(Map<String, dynamic> json) {
	final GooglePlacesDetailsResponseResult googlePlacesDetailsResponseResult = GooglePlacesDetailsResponseResult();
	final GooglePlacesDetailsResponseResultGeometry? geometry = jsonConvert.convert<GooglePlacesDetailsResponseResultGeometry>(json['geometry']);
	if (geometry != null) {
		googlePlacesDetailsResponseResult.geometry = geometry;
	}
	return googlePlacesDetailsResponseResult;
}

Map<String, dynamic> $GooglePlacesDetailsResponseResultToJson(GooglePlacesDetailsResponseResult entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['geometry'] = entity.geometry?.toJson();
	return data;
}

GooglePlacesDetailsResponseResultGeometry $GooglePlacesDetailsResponseResultGeometryFromJson(Map<String, dynamic> json) {
	final GooglePlacesDetailsResponseResultGeometry googlePlacesDetailsResponseResultGeometry = GooglePlacesDetailsResponseResultGeometry();
	final GooglePlacesDetailsResponseResultGeometryLocation? location = jsonConvert.convert<GooglePlacesDetailsResponseResultGeometryLocation>(json['location']);
	if (location != null) {
		googlePlacesDetailsResponseResultGeometry.location = location;
	}
	final GooglePlacesDetailsResponseResultGeometryViewport? viewport = jsonConvert.convert<GooglePlacesDetailsResponseResultGeometryViewport>(json['viewport']);
	if (viewport != null) {
		googlePlacesDetailsResponseResultGeometry.viewport = viewport;
	}
	return googlePlacesDetailsResponseResultGeometry;
}

Map<String, dynamic> $GooglePlacesDetailsResponseResultGeometryToJson(GooglePlacesDetailsResponseResultGeometry entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['location'] = entity.location?.toJson();
	data['viewport'] = entity.viewport?.toJson();
	return data;
}

GooglePlacesDetailsResponseResultGeometryLocation $GooglePlacesDetailsResponseResultGeometryLocationFromJson(Map<String, dynamic> json) {
	final GooglePlacesDetailsResponseResultGeometryLocation googlePlacesDetailsResponseResultGeometryLocation = GooglePlacesDetailsResponseResultGeometryLocation();
	final double? lat = jsonConvert.convert<double>(json['lat']);
	if (lat != null) {
		googlePlacesDetailsResponseResultGeometryLocation.lat = lat;
	}
	final double? lng = jsonConvert.convert<double>(json['lng']);
	if (lng != null) {
		googlePlacesDetailsResponseResultGeometryLocation.lng = lng;
	}
	return googlePlacesDetailsResponseResultGeometryLocation;
}

Map<String, dynamic> $GooglePlacesDetailsResponseResultGeometryLocationToJson(GooglePlacesDetailsResponseResultGeometryLocation entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['lat'] = entity.lat;
	data['lng'] = entity.lng;
	return data;
}

GooglePlacesDetailsResponseResultGeometryViewport $GooglePlacesDetailsResponseResultGeometryViewportFromJson(Map<String, dynamic> json) {
	final GooglePlacesDetailsResponseResultGeometryViewport googlePlacesDetailsResponseResultGeometryViewport = GooglePlacesDetailsResponseResultGeometryViewport();
	final GooglePlacesDetailsResponseResultGeometryViewportNortheast? northeast = jsonConvert.convert<GooglePlacesDetailsResponseResultGeometryViewportNortheast>(json['northeast']);
	if (northeast != null) {
		googlePlacesDetailsResponseResultGeometryViewport.northeast = northeast;
	}
	final GooglePlacesDetailsResponseResultGeometryViewportSouthwest? southwest = jsonConvert.convert<GooglePlacesDetailsResponseResultGeometryViewportSouthwest>(json['southwest']);
	if (southwest != null) {
		googlePlacesDetailsResponseResultGeometryViewport.southwest = southwest;
	}
	return googlePlacesDetailsResponseResultGeometryViewport;
}

Map<String, dynamic> $GooglePlacesDetailsResponseResultGeometryViewportToJson(GooglePlacesDetailsResponseResultGeometryViewport entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['northeast'] = entity.northeast?.toJson();
	data['southwest'] = entity.southwest?.toJson();
	return data;
}

GooglePlacesDetailsResponseResultGeometryViewportNortheast $GooglePlacesDetailsResponseResultGeometryViewportNortheastFromJson(Map<String, dynamic> json) {
	final GooglePlacesDetailsResponseResultGeometryViewportNortheast googlePlacesDetailsResponseResultGeometryViewportNortheast = GooglePlacesDetailsResponseResultGeometryViewportNortheast();
	final double? lat = jsonConvert.convert<double>(json['lat']);
	if (lat != null) {
		googlePlacesDetailsResponseResultGeometryViewportNortheast.lat = lat;
	}
	final double? lng = jsonConvert.convert<double>(json['lng']);
	if (lng != null) {
		googlePlacesDetailsResponseResultGeometryViewportNortheast.lng = lng;
	}
	return googlePlacesDetailsResponseResultGeometryViewportNortheast;
}

Map<String, dynamic> $GooglePlacesDetailsResponseResultGeometryViewportNortheastToJson(GooglePlacesDetailsResponseResultGeometryViewportNortheast entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['lat'] = entity.lat;
	data['lng'] = entity.lng;
	return data;
}

GooglePlacesDetailsResponseResultGeometryViewportSouthwest $GooglePlacesDetailsResponseResultGeometryViewportSouthwestFromJson(Map<String, dynamic> json) {
	final GooglePlacesDetailsResponseResultGeometryViewportSouthwest googlePlacesDetailsResponseResultGeometryViewportSouthwest = GooglePlacesDetailsResponseResultGeometryViewportSouthwest();
	final double? lat = jsonConvert.convert<double>(json['lat']);
	if (lat != null) {
		googlePlacesDetailsResponseResultGeometryViewportSouthwest.lat = lat;
	}
	final double? lng = jsonConvert.convert<double>(json['lng']);
	if (lng != null) {
		googlePlacesDetailsResponseResultGeometryViewportSouthwest.lng = lng;
	}
	return googlePlacesDetailsResponseResultGeometryViewportSouthwest;
}

Map<String, dynamic> $GooglePlacesDetailsResponseResultGeometryViewportSouthwestToJson(GooglePlacesDetailsResponseResultGeometryViewportSouthwest entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['lat'] = entity.lat;
	data['lng'] = entity.lng;
	return data;
}