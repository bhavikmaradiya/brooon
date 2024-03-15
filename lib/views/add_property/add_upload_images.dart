import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import './add_property_provider.dart';
import './widgets/choose_option_dialog.dart';
import '../../const/dimen_const.dart';
import '../../const/routes.dart';
import '../../const/string_const.dart';
import '../../utils/app_config.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';
import '../../widgets/image_loader.dart';
import '../../widgets/photo_gallery/photo_gallery_arg.dart';

class AddUploadImages extends StatefulWidget {
  final AppLocalizations localizationsContext;
  final AddPropertyProvider addPropertyProvider;

  const AddUploadImages({
    Key? key,
    required this.localizationsContext,
    required this.addPropertyProvider,
  }) : super(key: key);

  @override
  State<AddUploadImages> createState() => _AddUploadImagesState();
}

class _AddUploadImagesState extends State<AddUploadImages> {
  BoxDecoration _boxBorder(BuildContext context) {
    return BoxDecoration(
      border: Border.all(
        color: StaticFunctions.getColor(
          context,
          ColorEnum.borderColorE0,
        ),
        width: Dimensions.addImageBorderWidth.w,
      ),
      borderRadius: BorderRadius.circular(
        Dimensions.addImageRadius.r,
      ),
      color: StaticFunctions.getColor(
        context,
        ColorEnum.themeColorOpacity3Percentage,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Selector<AddPropertyProvider, List<File>>(
      selector: (_, state) => state.imagePaths,
      shouldRebuild: (prev, next) => true,
      builder: (context, files, child) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          child: Row(
            children: [
              if (files.length < AppConfig.maxImagesAllowed)
                Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    splashColor: StaticFunctions.getColor(
                      context,
                      ColorEnum.touchSplashColor,
                    ),
                    borderRadius: BorderRadius.circular(
                      Dimensions.fieldCornerRadius.w,
                    ),
                    onTap: () {
                      StaticFunctions.unFocusKeyboardIfAny(context);
                      ChooseOptionsDialog(
                        localizationContext: widget.localizationsContext,
                        addPropertyProvider: widget.addPropertyProvider,
                        title: widget.localizationsContext.uploadImages,
                      ).showCustomDialog(
                        context,
                      );
                    },
                    child: Container(
                      decoration: _boxBorder(context),
                      width: Dimensions.addImageThumbnailContainerWidth.w,
                      height: Dimensions.addImageThumbnailContainerHeight.w,
                      child: Center(
                        child: SvgPicture.asset(
                          Strings.iconTakeImageFromGallery,
                          width: Dimensions.addImageIconSize.w,
                          height: Dimensions.addImageIconSize.w,
                          color: StaticFunctions.getColor(
                            context,
                            ColorEnum.themeColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              if (files.isNotEmpty)
                ...files.asMap().entries.map(
                  (element) {
                    return Wrap(
                      direction: Axis.horizontal,
                      children: [
                        Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                left: element.key == 0
                                    ? (files.length ==
                                            AppConfig.maxImagesAllowed
                                        ? 0
                                        : Dimensions.addedImagesPadding.w)
                                    : Dimensions.addedImagesPadding.w,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: Dimensions.addImageBorderWidth.w,
                                  color: StaticFunctions.getColor(
                                    context,
                                    ColorEnum.borderColorE0,
                                  ),
                                ),
                                borderRadius: BorderRadius.circular(
                                  Dimensions.addImageRadius.r,
                                ),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    Routes.photoGallery,
                                    arguments: PhotoGalleryArg(
                                      imagePaths:
                                          widget.addPropertyProvider.imagePaths,
                                      index: element.key,
                                    ),
                                  );
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    Dimensions.addImageRadius.r,
                                  ),
                                  child: SizedBox(
                                    width: Dimensions.addImageContainerSize.w,
                                    height: Dimensions.addImageContainerSize.w,
                                    child: ImageLoader(
                                      image: element.value.path,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: Dimensions.addedImageClosePadding,
                              right: Dimensions.addedImageClosePadding,
                              child: GestureDetector(
                                onTap: () {
                                  widget.addPropertyProvider
                                      .removeSelectedImage(
                                    element.key,
                                  );
                                },
                                child: Container(
                                  width: Dimensions.addedImageCloseBgSize.w,
                                  height: Dimensions.addedImageCloseBgSize.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: StaticFunctions.getColor(
                                      context,
                                      ColorEnum.blackColor,
                                    ).withOpacity(0.5),
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      Strings.iconBottomSheetClose,
                                      width:
                                          Dimensions.addedImageCloseIconSize.w,
                                      height:
                                          Dimensions.addedImageCloseIconSize.w,
                                      color: StaticFunctions.getColor(
                                        context,
                                        ColorEnum.whiteColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ).toList(),
            ],
          ),
          // runSpacing: Dimensions.addedImagesPadding.h,
          // spacing: Dimensions.addedImagesPadding.w,
        );
      },
    );
  }
}
