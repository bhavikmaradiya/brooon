class DrawerItem {
  int id;
  String icon;
  String title;

  DrawerItem({
    required this.id,
    required this.icon,
    required this.title,
  });

  @override
  bool operator ==(Object other) {
    return this.id == (other as DrawerItem).id;
  }
}
