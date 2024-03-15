import 'package:brooon/generated/json/base/json_convert_content.dart';
import 'package:brooon/views/backup/api_response/upload_backup_info_response_entity.dart';

UploadBackupInfoResponseEntity $UploadBackupInfoResponseEntityFromJson(Map<String, dynamic> json) {
	final UploadBackupInfoResponseEntity uploadBackupInfoResponseEntity = UploadBackupInfoResponseEntity();
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		uploadBackupInfoResponseEntity.code = code;
	}
	final bool? success = jsonConvert.convert<bool>(json['success']);
	if (success != null) {
		uploadBackupInfoResponseEntity.success = success;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		uploadBackupInfoResponseEntity.message = message;
	}
	final UploadBackupInfoResponseData? data = jsonConvert.convert<UploadBackupInfoResponseData>(json['data']);
	if (data != null) {
		uploadBackupInfoResponseEntity.data = data;
	}
	return uploadBackupInfoResponseEntity;
}

Map<String, dynamic> $UploadBackupInfoResponseEntityToJson(UploadBackupInfoResponseEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['success'] = entity.success;
	data['message'] = entity.message;
	data['data'] = entity.data?.toJson();
	return data;
}

UploadBackupInfoResponseData $UploadBackupInfoResponseDataFromJson(Map<String, dynamic> json) {
	final UploadBackupInfoResponseData uploadBackupInfoResponseData = UploadBackupInfoResponseData();
	final String? googleBackupId = jsonConvert.convert<String>(json['google_backup_id']);
	if (googleBackupId != null) {
		uploadBackupInfoResponseData.googleBackupId = googleBackupId;
	}
	return uploadBackupInfoResponseData;
}

Map<String, dynamic> $UploadBackupInfoResponseDataToJson(UploadBackupInfoResponseData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['google_backup_id'] = entity.googleBackupId;
	return data;
}