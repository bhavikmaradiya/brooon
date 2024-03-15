import 'dart:ui';

class MenuItemModel {
  final int id;
  final String title;
  final String? subtitle;
  final String? icon;
  final double? iconHeight;
  final double? iconWidth;
  final double? titleIconBetweenSpacing;
  final FontWeight? titleFontWeight;
  final double? titleTextSize;

  MenuItemModel({
    required this.id,
    required this.title,
    this.subtitle,
    this.icon,
    this.iconHeight,
    this.iconWidth,
    this.titleIconBetweenSpacing,
    this.titleFontWeight,
    this.titleTextSize,
  });
}
