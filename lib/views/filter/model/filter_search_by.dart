class FilterSearchBy {
  final int id;
  final String value;
  bool isSelected;

  FilterSearchBy({
    required this.id,
    required this.value,
    this.isSelected = false,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FilterSearchBy &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
