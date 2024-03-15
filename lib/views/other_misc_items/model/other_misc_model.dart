class MiscItem {
  int id;
  String icon;
  String title;

  MiscItem({
    required this.id,
    required this.icon,
    required this.title,
  });

  @override
  bool operator ==(Object other) {
    return this.id == (other as MiscItem).id;
  }
}
