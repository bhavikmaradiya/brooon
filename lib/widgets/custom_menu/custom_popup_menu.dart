import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import './menu_item_model.dart';
import '../../const/dimen_const.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';

class CustomPopupMenu extends StatelessWidget {
  final Key? popupMenuKey;
  final Widget icon;
  final List<MenuItemModel> menuItem;
  final List<PopupMenuEntry> menuList = [];
  final bool isFullWidth;
  final bool itemDividerRequired;
  final bool isClickable;
  double? iconSize;
  double? titleSize;
  FontWeight? titleWeight;
  double? subtitleSize;
  double? iconAndTitleSpacing;
  final Function(MenuItemModel) onSelectedItem;

  CustomPopupMenu({
    Key? key,
    this.popupMenuKey,
    this.isClickable = true,
    required this.menuItem,
    required this.icon,
    required this.onSelectedItem,
    this.isFullWidth = false,
    this.itemDividerRequired = true,
    this.iconSize,
    this.titleSize,
    this.subtitleSize,
    this.titleWeight,
    this.iconAndTitleSpacing,
  }) : super(key: key) {
    this.iconSize ??= Dimensions.popupMenuIconSize.w;
    this.titleSize ??= Dimensions.popupMenuTextSize.sp;
    this.subtitleSize ??= Dimensions.popupMenuSubTextSize.sp;
    this.iconAndTitleSpacing ??= Dimensions.popupMenuIconTextSpacing.w;
    this.titleWeight ??= FontWeight.w400;
  }

  createMenuItem(BuildContext buildContext) {
    for (int index = 0; index < menuItem.length; index++) {
      menuList.add(
        PopupMenuItem<MenuItemModel>(
          value: menuItem[index],
          height: Dimensions.popupMenuItemHeight.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  if (menuItem[index].icon != null &&
                      menuItem[index].icon.toString().trim().isNotEmpty)
                    SvgPicture.asset(
                      menuItem[index].icon!,
                      width: menuItem[index].iconWidth ?? iconSize,
                      height: menuItem[index].iconHeight ?? iconSize,
                    ),
                  if (menuItem[index].icon != null &&
                      menuItem[index].icon.toString().trim().isNotEmpty)
                    SizedBox(
                      width: iconAndTitleSpacing,
                    ),
                  Text(
                    menuItem[index].title,
                    style: TextStyle(
                      color: StaticFunctions.getColor(
                        buildContext,
                        ColorEnum.blackColor,
                      ),
                      fontWeight: titleWeight,
                      fontSize: titleSize,
                    ),
                  ),
                ],
              ),
              if (menuItem[index].subtitle != null)
                SizedBox(
                  height: Dimensions.popupMenuTitleSubtitleBetweenSpacing.h,
                ),
              if (menuItem[index].subtitle != null)
                Text(
                  menuItem[index].subtitle!,
                  style: TextStyle(
                    color: StaticFunctions.getColor(
                      buildContext,
                      ColorEnum.gray90Color,
                    ),
                    fontSize: subtitleSize,
                  ),
                )
            ],
          ),
        ),
      );
      if (index != menuItem.length - 1) {
        menuList.add(
          PopupMenuDivider(),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    createMenuItem(context);
    return PopupMenuButton(
      key: popupMenuKey,
      tooltip: '',
      enabled: isClickable,
      padding: EdgeInsets.zero,
      constraints: isFullWidth
          ? BoxConstraints(
              minWidth: MediaQuery.of(context).size.width -
                  Dimensions.screenHorizontalMargin.w,
              maxWidth: MediaQuery.of(context).size.width -
                  Dimensions.screenHorizontalMargin.w,
            )
          : null,
      itemBuilder: (context) => menuList,
      icon: icon,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          Dimensions.popupMenuShapeRadius.r,
        ),
      ),
      color: StaticFunctions.getColor(
        context,
        ColorEnum.whiteColor,
      ),
      onSelected: (value) {
        onSelectedItem(value);
      },
    );
  }
}
