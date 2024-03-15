import 'package:brooon/generated/json/base/json_convert_content.dart';
import 'package:brooon/views/app_feedback/api_response/app_feedback_response_entity.dart';

AppFeedbackResponseEntity $AppFeedbackResponseEntityFromJson(Map<String, dynamic> json) {
	final AppFeedbackResponseEntity appFeedbackResponseEntity = AppFeedbackResponseEntity();
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		appFeedbackResponseEntity.code = code;
	}
	final bool? success = jsonConvert.convert<bool>(json['success']);
	if (success != null) {
		appFeedbackResponseEntity.success = success;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		appFeedbackResponseEntity.message = message;
	}
	return appFeedbackResponseEntity;
}

Map<String, dynamic> $AppFeedbackResponseEntityToJson(AppFeedbackResponseEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['success'] = entity.success;
	data['message'] = entity.message;
	return data;
}