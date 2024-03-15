class ShareTypeModel {
  bool shareTextEnabled = false;
  bool shareImageEnabled = false;
  bool sharePdfEnabled = false;
  bool isBasicDetailsEnabled = false;
  bool isOtherDetailsEnabled = false;
  bool isPhotosEnabled = false;
  bool isWatermarkEnabled = false;
  bool isShareLogoEnabled  = false;

  ShareTypeModel({
    required this.shareTextEnabled,
    required this.shareImageEnabled,
    required this.sharePdfEnabled,
    required this.isBasicDetailsEnabled,
    required this.isOtherDetailsEnabled,
    required this.isPhotosEnabled,
    required this.isWatermarkEnabled,
    required this.isShareLogoEnabled,
  });
}
