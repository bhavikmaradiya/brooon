import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import './photo_gallery_arg.dart';
import '../../../../utils/static_functions.dart';
import '../../const/dimen_const.dart';
import '../../const/string_const.dart';
import '../../utils/enums.dart';
import '../circular_indicator.dart';

class PhotoGallery extends StatelessWidget {
  const PhotoGallery({
    Key? key,
  }) : super(key: key);

  File _getFile(File file) {
    final isFileExist = file.existsSync();
    if (!isFileExist) {
      return File(StaticFunctions.noImagePreviewFilePath);
    }
    return file;
  }

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as PhotoGalleryArg;
    final List<File> galleryItems = data.imagePaths;
    final currentIndex = data.index;
    return Stack(
      children: [
        PhotoViewGallery.builder(
          scrollPhysics: const BouncingScrollPhysics(),
          loadingBuilder: (context, event) {
            return Center(child: const CircularIndicator());
          },
          builder: (BuildContext context, int index) {
            final file = _getFile(galleryItems[index]);
            return PhotoViewGalleryPageOptions(
              imageProvider: FileImage(file),
              initialScale: PhotoViewComputedScale.contained,
              minScale: PhotoViewComputedScale.contained,
              maxScale: PhotoViewComputedScale.covered * 2,
              heroAttributes: PhotoViewHeroAttributes(tag: file),
            );
          },
          itemCount: galleryItems.length,
          backgroundDecoration: BoxDecoration(
            color: StaticFunctions.getColor(
              context,
              ColorEnum.blackColor,
            ),
          ),
          pageController: PageController(initialPage: currentIndex),
          // onPageChanged: onPageChanged,
        ),
        Positioned(
          top: MediaQuery.of(context).padding.top +
              Dimensions.imageGalleryClosePadding.h,
          right: Dimensions.imageGalleryClosePadding.h,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
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
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          Dimensions
                              .propertyDetailAppBarMenuIconContainerRadius.r,
                        ),
                        border: Border.all(
                          color: StaticFunctions.getColor(
                            context,
                            ColorEnum.transparentBlackColor,
                          ),
                        ),
                        color: StaticFunctions.getColor(
                          context,
                          ColorEnum.transparentBlackColor,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(
                          Dimensions.closeIconPadding.w,
                        ),
                        child: SvgPicture.asset(
                          Strings.iconBottomSheetClose,
                          width: Dimensions.closeIconSize.w,
                          height: Dimensions.closeIconSize.w,
                          color: StaticFunctions.getColor(
                            context,
                            ColorEnum.whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
