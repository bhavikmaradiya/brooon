class CloseDealModel {
  final String name;
  final String mobile;
  final String notes;
  final int dealType;
  String? linkedPropertyInquiryId;

  CloseDealModel({
    required this.name,
    required this.mobile,
    required this.notes,
    required this.dealType,
    required this.linkedPropertyInquiryId,
  });
}
