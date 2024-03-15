import 'package:brooon/generated/json/base/json_convert_content.dart';
import 'package:brooon/views/choose_location/api_response/google_places_response_entity.dart';

GooglePlacesResponseEntity $GooglePlacesResponseEntityFromJson(Map<String, dynamic> json) {
	final GooglePlacesResponseEntity googlePlacesResponseEntity = GooglePlacesResponseEntity();
	final List<GooglePlacesResponsePredictions>? predictions = jsonConvert.convertListNotNull<GooglePlacesResponsePredictions>(json['predictions']);
	if (predictions != null) {
		googlePlacesResponseEntity.predictions = predictions;
	}
	final String? status = jsonConvert.convert<String>(json['status']);
	if (status != null) {
		googlePlacesResponseEntity.status = status;
	}
	return googlePlacesResponseEntity;
}

Map<String, dynamic> $GooglePlacesResponseEntityToJson(GooglePlacesResponseEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['predictions'] =  entity.predictions?.map((v) => v.toJson()).toList();
	data['status'] = entity.status;
	return data;
}

GooglePlacesResponsePredictions $GooglePlacesResponsePredictionsFromJson(Map<String, dynamic> json) {
	final GooglePlacesResponsePredictions googlePlacesResponsePredictions = GooglePlacesResponsePredictions();
	final String? description = jsonConvert.convert<String>(json['description']);
	if (description != null) {
		googlePlacesResponsePredictions.description = description;
	}
	final List<GooglePlacesResponsePredictionsMatchedSubstrings>? matchedSubstrings = jsonConvert.convertListNotNull<GooglePlacesResponsePredictionsMatchedSubstrings>(json['matched_substrings']);
	if (matchedSubstrings != null) {
		googlePlacesResponsePredictions.matchedSubstrings = matchedSubstrings;
	}
	final String? placeId = jsonConvert.convert<String>(json['place_id']);
	if (placeId != null) {
		googlePlacesResponsePredictions.placeId = placeId;
	}
	final String? reference = jsonConvert.convert<String>(json['reference']);
	if (reference != null) {
		googlePlacesResponsePredictions.reference = reference;
	}
	final GooglePlacesResponsePredictionsStructuredFormatting? structuredFormatting = jsonConvert.convert<GooglePlacesResponsePredictionsStructuredFormatting>(json['structured_formatting']);
	if (structuredFormatting != null) {
		googlePlacesResponsePredictions.structuredFormatting = structuredFormatting;
	}
	final List<GooglePlacesResponsePredictionsTerms>? terms = jsonConvert.convertListNotNull<GooglePlacesResponsePredictionsTerms>(json['terms']);
	if (terms != null) {
		googlePlacesResponsePredictions.terms = terms;
	}
	final List<String>? types = jsonConvert.convertListNotNull<String>(json['types']);
	if (types != null) {
		googlePlacesResponsePredictions.types = types;
	}
	return googlePlacesResponsePredictions;
}

Map<String, dynamic> $GooglePlacesResponsePredictionsToJson(GooglePlacesResponsePredictions entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['description'] = entity.description;
	data['matched_substrings'] =  entity.matchedSubstrings?.map((v) => v.toJson()).toList();
	data['place_id'] = entity.placeId;
	data['reference'] = entity.reference;
	data['structured_formatting'] = entity.structuredFormatting?.toJson();
	data['terms'] =  entity.terms?.map((v) => v.toJson()).toList();
	data['types'] =  entity.types;
	return data;
}

GooglePlacesResponsePredictionsMatchedSubstrings $GooglePlacesResponsePredictionsMatchedSubstringsFromJson(Map<String, dynamic> json) {
	final GooglePlacesResponsePredictionsMatchedSubstrings googlePlacesResponsePredictionsMatchedSubstrings = GooglePlacesResponsePredictionsMatchedSubstrings();
	final int? length = jsonConvert.convert<int>(json['length']);
	if (length != null) {
		googlePlacesResponsePredictionsMatchedSubstrings.length = length;
	}
	final int? offset = jsonConvert.convert<int>(json['offset']);
	if (offset != null) {
		googlePlacesResponsePredictionsMatchedSubstrings.offset = offset;
	}
	return googlePlacesResponsePredictionsMatchedSubstrings;
}

Map<String, dynamic> $GooglePlacesResponsePredictionsMatchedSubstringsToJson(GooglePlacesResponsePredictionsMatchedSubstrings entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['length'] = entity.length;
	data['offset'] = entity.offset;
	return data;
}

GooglePlacesResponsePredictionsStructuredFormatting $GooglePlacesResponsePredictionsStructuredFormattingFromJson(Map<String, dynamic> json) {
	final GooglePlacesResponsePredictionsStructuredFormatting googlePlacesResponsePredictionsStructuredFormatting = GooglePlacesResponsePredictionsStructuredFormatting();
	final String? mainText = jsonConvert.convert<String>(json['main_text']);
	if (mainText != null) {
		googlePlacesResponsePredictionsStructuredFormatting.mainText = mainText;
	}
	final List<GooglePlacesResponsePredictionsStructuredFormattingMainTextMatchedSubstrings>? mainTextMatchedSubstrings = jsonConvert.convertListNotNull<GooglePlacesResponsePredictionsStructuredFormattingMainTextMatchedSubstrings>(json['main_text_matched_substrings']);
	if (mainTextMatchedSubstrings != null) {
		googlePlacesResponsePredictionsStructuredFormatting.mainTextMatchedSubstrings = mainTextMatchedSubstrings;
	}
	final String? secondaryText = jsonConvert.convert<String>(json['secondary_text']);
	if (secondaryText != null) {
		googlePlacesResponsePredictionsStructuredFormatting.secondaryText = secondaryText;
	}
	final List<GooglePlacesResponsePredictionsStructuredFormattingSecondaryTextMatchedSubstrings>? secondaryTextMatchedSubstrings = jsonConvert.convertListNotNull<GooglePlacesResponsePredictionsStructuredFormattingSecondaryTextMatchedSubstrings>(json['secondary_text_matched_substrings']);
	if (secondaryTextMatchedSubstrings != null) {
		googlePlacesResponsePredictionsStructuredFormatting.secondaryTextMatchedSubstrings = secondaryTextMatchedSubstrings;
	}
	return googlePlacesResponsePredictionsStructuredFormatting;
}

Map<String, dynamic> $GooglePlacesResponsePredictionsStructuredFormattingToJson(GooglePlacesResponsePredictionsStructuredFormatting entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['main_text'] = entity.mainText;
	data['main_text_matched_substrings'] =  entity.mainTextMatchedSubstrings?.map((v) => v.toJson()).toList();
	data['secondary_text'] = entity.secondaryText;
	data['secondary_text_matched_substrings'] =  entity.secondaryTextMatchedSubstrings?.map((v) => v.toJson()).toList();
	return data;
}

GooglePlacesResponsePredictionsStructuredFormattingMainTextMatchedSubstrings $GooglePlacesResponsePredictionsStructuredFormattingMainTextMatchedSubstringsFromJson(Map<String, dynamic> json) {
	final GooglePlacesResponsePredictionsStructuredFormattingMainTextMatchedSubstrings googlePlacesResponsePredictionsStructuredFormattingMainTextMatchedSubstrings = GooglePlacesResponsePredictionsStructuredFormattingMainTextMatchedSubstrings();
	final int? length = jsonConvert.convert<int>(json['length']);
	if (length != null) {
		googlePlacesResponsePredictionsStructuredFormattingMainTextMatchedSubstrings.length = length;
	}
	final int? offset = jsonConvert.convert<int>(json['offset']);
	if (offset != null) {
		googlePlacesResponsePredictionsStructuredFormattingMainTextMatchedSubstrings.offset = offset;
	}
	return googlePlacesResponsePredictionsStructuredFormattingMainTextMatchedSubstrings;
}

Map<String, dynamic> $GooglePlacesResponsePredictionsStructuredFormattingMainTextMatchedSubstringsToJson(GooglePlacesResponsePredictionsStructuredFormattingMainTextMatchedSubstrings entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['length'] = entity.length;
	data['offset'] = entity.offset;
	return data;
}

GooglePlacesResponsePredictionsStructuredFormattingSecondaryTextMatchedSubstrings $GooglePlacesResponsePredictionsStructuredFormattingSecondaryTextMatchedSubstringsFromJson(Map<String, dynamic> json) {
	final GooglePlacesResponsePredictionsStructuredFormattingSecondaryTextMatchedSubstrings googlePlacesResponsePredictionsStructuredFormattingSecondaryTextMatchedSubstrings = GooglePlacesResponsePredictionsStructuredFormattingSecondaryTextMatchedSubstrings();
	final int? length = jsonConvert.convert<int>(json['length']);
	if (length != null) {
		googlePlacesResponsePredictionsStructuredFormattingSecondaryTextMatchedSubstrings.length = length;
	}
	final int? offset = jsonConvert.convert<int>(json['offset']);
	if (offset != null) {
		googlePlacesResponsePredictionsStructuredFormattingSecondaryTextMatchedSubstrings.offset = offset;
	}
	return googlePlacesResponsePredictionsStructuredFormattingSecondaryTextMatchedSubstrings;
}

Map<String, dynamic> $GooglePlacesResponsePredictionsStructuredFormattingSecondaryTextMatchedSubstringsToJson(GooglePlacesResponsePredictionsStructuredFormattingSecondaryTextMatchedSubstrings entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['length'] = entity.length;
	data['offset'] = entity.offset;
	return data;
}

GooglePlacesResponsePredictionsTerms $GooglePlacesResponsePredictionsTermsFromJson(Map<String, dynamic> json) {
	final GooglePlacesResponsePredictionsTerms googlePlacesResponsePredictionsTerms = GooglePlacesResponsePredictionsTerms();
	final int? offset = jsonConvert.convert<int>(json['offset']);
	if (offset != null) {
		googlePlacesResponsePredictionsTerms.offset = offset;
	}
	final String? value = jsonConvert.convert<String>(json['value']);
	if (value != null) {
		googlePlacesResponsePredictionsTerms.value = value;
	}
	return googlePlacesResponsePredictionsTerms;
}

Map<String, dynamic> $GooglePlacesResponsePredictionsTermsToJson(GooglePlacesResponsePredictionsTerms entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['offset'] = entity.offset;
	data['value'] = entity.value;
	return data;
}