import 'package:brooon/generated/json/base/json_convert_content.dart';
import 'package:brooon/views/report/api_response/report_response_entity.dart';

ReportResponseEntity $ReportResponseEntityFromJson(Map<String, dynamic> json) {
	final ReportResponseEntity reportResponseEntity = ReportResponseEntity();
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		reportResponseEntity.code = code;
	}
	final bool? success = jsonConvert.convert<bool>(json['success']);
	if (success != null) {
		reportResponseEntity.success = success;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		reportResponseEntity.message = message;
	}
	return reportResponseEntity;
}

Map<String, dynamic> $ReportResponseEntityToJson(ReportResponseEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['success'] = entity.success;
	data['message'] = entity.message;
	return data;
}