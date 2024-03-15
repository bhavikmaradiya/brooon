class SettingsApiRequest {
  bool? enabledNotification;
  bool? enabledShare;
  bool? enabledShareBasicDetails;
  bool? enabledShareOtherDetails;
  bool? enabledShareOwnerDetails;
  bool? enabledSharePriceDetails;
  bool? enabledSharePhotos;
  bool? enabledShareWatermark;
  bool? enabledAppReminder;
  bool? enabledPublicProperties;
  int? radius;
  double? nearByDistance;
  double? mySearchDistance;
  double? brooonSearchDistance;

  Map<String, dynamic> toMap(SettingsApiRequest request) {
    Map<String, dynamic> body = {};
    if (request.enabledNotification != null) {
      body['notification'] = request.enabledNotification;
    }
    if (request.enabledShare != null) {
      body['share'] = request.enabledShare;
    }
    if (request.enabledShareBasicDetails != null) {
      body['basic_details'] = request.enabledShareBasicDetails;
    }
    if (request.enabledShareOtherDetails != null) {
      body['other_details'] = request.enabledShareOtherDetails;
    }
    if (request.enabledShareOwnerDetails != null) {
      body['owner_details'] = request.enabledShareOwnerDetails;
    }
    if (request.enabledSharePriceDetails != null) {
      body['price_details'] = request.enabledSharePriceDetails;
    }
    if (request.enabledSharePhotos != null) {
      body['photos'] = request.enabledSharePhotos;
    }
    if (request.enabledShareWatermark != null) {
      body['watermark'] = request.enabledShareWatermark;
    }
    if (request.enabledAppReminder != null) {
      body['app_reminder'] = request.enabledAppReminder;
    }
    if (request.enabledPublicProperties != null) {
      body['public_properties'] = request.enabledPublicProperties;
    }
    if (request.radius != null) {
      body['radius'] = request.radius;
    }
    if (request.nearByDistance != null) {
      body['near_by_distance'] = request.nearByDistance;
    }
    if (request.mySearchDistance != null) {
      body['search_distance'] = request.mySearchDistance;
    }
    if (request.brooonSearchDistance != null) {
      body['brooon_distance'] = request.brooonSearchDistance;
    }
    return body;
  }
}
