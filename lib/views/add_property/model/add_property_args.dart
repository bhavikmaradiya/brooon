enum AddPropertyEnums { add, edit, copy }

class AddPropertyArgs {
  AddPropertyEnums addPropertyEnums;
  int propertyId;
  int? propertyTypeId;

  AddPropertyArgs({
    required this.addPropertyEnums,
    required this.propertyId,
    this.propertyTypeId,
  });
}
