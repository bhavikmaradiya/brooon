import 'package:brooon/generated/json/base/json_convert_content.dart';
import 'package:brooon/views/shared_by_brooon/api_response/block_unblock_broker_response_entity.dart';

BlockUnblockBrokerResponseEntity $BlockUnblockBrokerResponseEntityFromJson(Map<String, dynamic> json) {
	final BlockUnblockBrokerResponseEntity blockUnblockBrokerResponseEntity = BlockUnblockBrokerResponseEntity();
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		blockUnblockBrokerResponseEntity.code = code;
	}
	final bool? success = jsonConvert.convert<bool>(json['success']);
	if (success != null) {
		blockUnblockBrokerResponseEntity.success = success;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		blockUnblockBrokerResponseEntity.message = message;
	}
	return blockUnblockBrokerResponseEntity;
}

Map<String, dynamic> $BlockUnblockBrokerResponseEntityToJson(BlockUnblockBrokerResponseEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['success'] = entity.success;
	data['message'] = entity.message;
	return data;
}