import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/static_functions.dart';
import '../const/dark_colors.dart';
import '../const/light_colors.dart';
import '../const/string_const.dart';
import 'enums.dart';

class ThemeConfig {
  static ThemeData lightTheme = ThemeData(
    primaryColor: LightColors.themeColor,
    backgroundColor: LightColors.whiteColor,
    fontFamily: Strings.poppinsFonts,
    scaffoldBackgroundColor: LightColors.whiteColor,
    brightness: Brightness.light,
  );
  static ThemeData darkTheme = ThemeData(
    primaryColor: DarkColors.themeColor,
    backgroundColor: DarkColors.whiteColor,
    fontFamily: Strings.poppinsFonts,
    scaffoldBackgroundColor: DarkColors.whiteColor,
    brightness: Brightness.dark,
  );

  static AppBar appBar(
    BuildContext context, {
    ColorEnum statusBarColor = ColorEnum.toolbarDefaultColor,
    Brightness brightness = Brightness.dark,
  }) =>
      AppBar(
        toolbarHeight: 0,
        elevation: 0,
        systemOverlayStyle: brightness == Brightness.light
            ? SystemUiOverlayStyle.light.copyWith(
                statusBarColor: StaticFunctions.getColor(
                  context,
                  statusBarColor,
                ),
              )
            : SystemUiOverlayStyle.dark.copyWith(
                statusBarColor: StaticFunctions.getColor(
                  context,
                  statusBarColor,
                ),
              ),
        shadowColor: Colors.transparent,
        backgroundColor: StaticFunctions.getColor(
          context,
          statusBarColor,
        ),
      );
}
