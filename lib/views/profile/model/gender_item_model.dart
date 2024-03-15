class GenderItem {
  int id;
  String value;
  bool isSelected;

  GenderItem(
      {required this.id,
        required this.value,
        this.isSelected = false});

  @override
  bool operator ==(Object other) {
    return this.id == (other as GenderItem).id;
  }
}