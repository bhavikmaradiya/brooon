class BedSizeModel {
  int id;
  String bedSize;
  bool isSelected;

  BedSizeModel(
      {required this.id,
        required this.bedSize,
        this.isSelected = false});

  @override
  bool operator ==(Object other) {
    return this.id == (other as BedSizeModel).id;
  }
}