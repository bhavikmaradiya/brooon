class WashroomModel {
  int id;
  String washroomCount;
  bool isSelected;

  WashroomModel({
    required this.id,
    required this.washroomCount,
    this.isSelected = false,
  });
}
