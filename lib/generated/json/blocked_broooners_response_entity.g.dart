import 'package:brooon/generated/json/base/json_convert_content.dart';
import 'package:brooon/views/blocked_broooners/api_response/blocked_broooners_response_entity.dart';

BlockedBrooonersResponseEntity $BlockedBrooonersResponseEntityFromJson(Map<String, dynamic> json) {
	final BlockedBrooonersResponseEntity blockedBrooonersResponseEntity = BlockedBrooonersResponseEntity();
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		blockedBrooonersResponseEntity.code = code;
	}
	final bool? success = jsonConvert.convert<bool>(json['success']);
	if (success != null) {
		blockedBrooonersResponseEntity.success = success;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		blockedBrooonersResponseEntity.message = message;
	}
	final BlockedBrooonersResponseData? data = jsonConvert.convert<BlockedBrooonersResponseData>(json['data']);
	if (data != null) {
		blockedBrooonersResponseEntity.data = data;
	}
	return blockedBrooonersResponseEntity;
}

Map<String, dynamic> $BlockedBrooonersResponseEntityToJson(BlockedBrooonersResponseEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['success'] = entity.success;
	data['message'] = entity.message;
	data['data'] = entity.data?.toJson();
	return data;
}

BlockedBrooonersResponseData $BlockedBrooonersResponseDataFromJson(Map<String, dynamic> json) {
	final BlockedBrooonersResponseData blockedBrooonersResponseData = BlockedBrooonersResponseData();
	final int? totalBlokedUser = jsonConvert.convert<int>(json['total_bloked_user']);
	if (totalBlokedUser != null) {
		blockedBrooonersResponseData.totalBlokedUser = totalBlokedUser;
	}
	final int? totalPages = jsonConvert.convert<int>(json['total_pages']);
	if (totalPages != null) {
		blockedBrooonersResponseData.totalPages = totalPages;
	}
	final int? currentPage = jsonConvert.convert<int>(json['current_page']);
	if (currentPage != null) {
		blockedBrooonersResponseData.currentPage = currentPage;
	}
	final int? nextPage = jsonConvert.convert<int>(json['next_page']);
	if (nextPage != null) {
		blockedBrooonersResponseData.nextPage = nextPage;
	}
	final List<BlockedBrooonersResponseDataUsers>? users = jsonConvert.convertListNotNull<BlockedBrooonersResponseDataUsers>(json['users']);
	if (users != null) {
		blockedBrooonersResponseData.users = users;
	}
	return blockedBrooonersResponseData;
}

Map<String, dynamic> $BlockedBrooonersResponseDataToJson(BlockedBrooonersResponseData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['total_bloked_user'] = entity.totalBlokedUser;
	data['total_pages'] = entity.totalPages;
	data['current_page'] = entity.currentPage;
	data['next_page'] = entity.nextPage;
	data['users'] =  entity.users?.map((v) => v.toJson()).toList();
	return data;
}

BlockedBrooonersResponseDataUsers $BlockedBrooonersResponseDataUsersFromJson(Map<String, dynamic> json) {
	final BlockedBrooonersResponseDataUsers blockedBrooonersResponseDataUsers = BlockedBrooonersResponseDataUsers();
	final int? createdAt = jsonConvert.convert<int>(json['created_at']);
	if (createdAt != null) {
		blockedBrooonersResponseDataUsers.createdAt = createdAt;
	}
	final int? updatedAt = jsonConvert.convert<int>(json['updated_at']);
	if (updatedAt != null) {
		blockedBrooonersResponseDataUsers.updatedAt = updatedAt;
	}
	final BlockedBrooonersResponseDataUsersBrooonInfo? brooonInfo = jsonConvert.convert<BlockedBrooonersResponseDataUsersBrooonInfo>(json['brooon_info']);
	if (brooonInfo != null) {
		blockedBrooonersResponseDataUsers.brooonInfo = brooonInfo;
	}
	return blockedBrooonersResponseDataUsers;
}

Map<String, dynamic> $BlockedBrooonersResponseDataUsersToJson(BlockedBrooonersResponseDataUsers entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['created_at'] = entity.createdAt;
	data['updated_at'] = entity.updatedAt;
	data['brooon_info'] = entity.brooonInfo?.toJson();
	return data;
}

BlockedBrooonersResponseDataUsersBrooonInfo $BlockedBrooonersResponseDataUsersBrooonInfoFromJson(Map<String, dynamic> json) {
	final BlockedBrooonersResponseDataUsersBrooonInfo blockedBrooonersResponseDataUsersBrooonInfo = BlockedBrooonersResponseDataUsersBrooonInfo();
	final int? brooonId = jsonConvert.convert<int>(json['brooon_id']);
	if (brooonId != null) {
		blockedBrooonersResponseDataUsersBrooonInfo.brooonId = brooonId;
	}
	final String? brooonCode = jsonConvert.convert<String>(json['brooon_code']);
	if (brooonCode != null) {
		blockedBrooonersResponseDataUsersBrooonInfo.brooonCode = brooonCode;
	}
	final String? firstName = jsonConvert.convert<String>(json['first_name']);
	if (firstName != null) {
		blockedBrooonersResponseDataUsersBrooonInfo.firstName = firstName;
	}
	final String? lastName = jsonConvert.convert<String>(json['last_name']);
	if (lastName != null) {
		blockedBrooonersResponseDataUsersBrooonInfo.lastName = lastName;
	}
	final int? mobileNumber = jsonConvert.convert<int>(json['mobile_number']);
	if (mobileNumber != null) {
		blockedBrooonersResponseDataUsersBrooonInfo.mobileNumber = mobileNumber;
	}
	final dynamic? brooonPhoto = jsonConvert.convert<dynamic>(json['brooon_photo']);
	if (brooonPhoto != null) {
		blockedBrooonersResponseDataUsersBrooonInfo.brooonPhoto = brooonPhoto;
	}
	return blockedBrooonersResponseDataUsersBrooonInfo;
}

Map<String, dynamic> $BlockedBrooonersResponseDataUsersBrooonInfoToJson(BlockedBrooonersResponseDataUsersBrooonInfo entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['brooon_id'] = entity.brooonId;
	data['brooon_code'] = entity.brooonCode;
	data['first_name'] = entity.firstName;
	data['last_name'] = entity.lastName;
	data['mobile_number'] = entity.mobileNumber;
	data['brooon_photo'] = entity.brooonPhoto;
	return data;
}