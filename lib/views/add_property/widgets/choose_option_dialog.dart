import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../const/dimen_const.dart';
import '../../../const/string_const.dart';
import '../../../utils/app_config.dart';
import '../../../utils/enums.dart';
import '../../../utils/static_functions.dart';
import '../../../widgets/snack_bar_view.dart';
import '../add_property_provider.dart';

class ChooseOptionsDialog {
  final AppLocalizations localizationContext;
  final AddPropertyProvider addPropertyProvider;
  final String title;

  const ChooseOptionsDialog({
    required this.localizationContext,
    required this.addPropertyProvider,
    required this.title,
  });

  BoxDecoration _boxBorder(BuildContext context) {
    return BoxDecoration(
      border: Border.all(
        color: StaticFunctions.getColor(
          context,
          ColorEnum.grayColor,
        ),
        width: Dimensions.dialogBorderWidth.w,
      ),
      borderRadius: BorderRadius.circular(
        Dimensions.dialogRadius.r,
      ),
    );
  }

  Widget _dialogTitle(BuildContext context, String title) {
    return ColoredBox(
      color: StaticFunctions.getColor(
        context,
        ColorEnum.themeColorOpacity3Percentage,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: Dimensions.screenHorizontalMargin.w,
          right: (Dimensions.screenHorizontalMargin / 2).w,
          top: Dimensions.screenHorizontalMargin.h,
          bottom: Dimensions.screenHorizontalMargin.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: Dimensions.dialogUploadImageTitleTextSize.sp,
                color: StaticFunctions.getColor(
                  context,
                  ColorEnum.blackColor,
                ),
              ),
            ),
            Container(
              width: Dimensions.closeIconSize.w,
              height: Dimensions.closeIconSize.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  Dimensions.closeIconRippleRadius.r,
                ),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  borderRadius: BorderRadius.circular(
                    Dimensions.closeIconRippleRadius.r,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(
                      Dimensions.closeIconPadding.w,
                    ),
                    child: SvgPicture.asset(
                      Strings.iconClose,
                      width: Dimensions.closeIconSize.w,
                      height: Dimensions.closeIconSize.w,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _uploadImageBody(
    BuildContext context,
    BuildContext dialogContext,
    String data,
    String iconPath,
  ) {
    final bodyWidth = (MediaQuery.of(context).size.width / 2) -
        ((Dimensions.screenHorizontalMargin * 3).w) +
        ((Dimensions.screenHorizontalMargin / 2).w);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Material(
          type: MaterialType.transparency,
          child: InkWell(
            splashColor: StaticFunctions.getColor(
              context,
              ColorEnum.touchSplashColor,
            ),
            borderRadius: BorderRadius.circular(
              Dimensions.dialogRadius.r,
            ),
            onTap: () {
              if (data == localizationContext.camera) {
                Navigator.pop(dialogContext);
                final photoFile = addPropertyProvider.chooseFromCamera();
                photoFile.then((isPhotoChosen) {
                  if (!isPhotoChosen) {
                    showCustomDialog(context);
                  }
                });
              } else {
                Navigator.pop(dialogContext);
                final photoFile = addPropertyProvider.chooseFromGallery();
                photoFile.then((flag) {
                  if (flag == 0) {
                    showCustomDialog(context);
                  } else if (flag == 2) {
                    SnackBarView.showSnackBar(
                      context,
                      '${localizationContext.maximum} ${AppConfig.maxImagesAllowed} ${localizationContext.imagesAllowed}',
                    );
                  }
                });
              }
            },
            child: Container(
              width: bodyWidth,
              decoration: _boxBorder(context),
              padding: EdgeInsets.symmetric(
                vertical:
                    Dimensions.dialogUploadImageBodyContentVerticalSpacing.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    iconPath,
                    width: Dimensions.dialogUploadImageBodyIconSize.w,
                    height: Dimensions.dialogUploadImageBodyIconSize.w,
                    color: StaticFunctions.getColor(
                      context,
                      ColorEnum.themeColor,
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.dialogUploadImageItemPadding.h,
                  ),
                  Text(
                    data,
                    style: TextStyle(
                      color: StaticFunctions.getColor(
                        context,
                        ColorEnum.blackColor,
                      ),
                      fontSize: Dimensions.dialogUploadImageItemTextSize.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(
            horizontal: Dimensions.screenHorizontalMargin.w,
          ),
          backgroundColor: StaticFunctions.getColor(
            context,
            ColorEnum.whiteColor,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              Dimensions.dialogRadius.r,
            ),
          ), //this right here
          child: Wrap(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _dialogTitle(context, title),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.screenHorizontalMargin.w,
                      vertical:
                          Dimensions.dialogUploadImageBodyVerticalSpacing.h,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        _uploadImageBody(
                          context,
                          dialogContext,
                          localizationContext.camera,
                          Strings.iconTakeImageFromCamera,
                        ),
                        SizedBox(
                          width: Dimensions.screenHorizontalMargin.w,
                        ),
                        _uploadImageBody(
                          context,
                          dialogContext,
                          localizationContext.gallery,
                          Strings.iconTakeImageFromGallery,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
