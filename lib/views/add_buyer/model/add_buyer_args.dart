enum InquiryEnums { add, edit, copy }

class AddBuyerArgs {
  InquiryEnums? inquiryEnum;
  int inquiryId;
  int? propertyTypeId;

  AddBuyerArgs({
    required this.inquiryEnum,
    required this.inquiryId,
    this.propertyTypeId,
  });
}
