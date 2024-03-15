import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../const/string_const.dart';
import '../localdb/save_default_data.dart';
import '../utils/enums.dart';
import '../utils/file_utils.dart';
import '../utils/static_functions.dart';

class ImageLoader extends StatelessWidget {
  final bool isUserPlaceHolder;
  final String? image;
  final String? heroTag;
  final bool isCurrentUserProfilePic;
  final bool isItInquiry;
  final bool shouldApplyColor;
  final int? propertyTypeId;

  const ImageLoader({
    Key? key,
    required this.image,
    this.isUserPlaceHolder = false,
    this.isCurrentUserProfilePic = false,
    this.isItInquiry = false,
    this.shouldApplyColor = true,
    this.heroTag,
    this.propertyTypeId,
  }) : super(key: key);

  String getRandomTag() {
    return '${DateTime.now().millisecondsSinceEpoch}';
  }

  String _getPropertyPlaceHolder(int propertyTypeId) {
    if (propertyTypeId == SaveDefaultData.propertyTypeBungalowId) {
      return !isItInquiry
          ? Strings.iconPropertyTypeBungalow
          : Strings.iconInquiryTypeBungalow;
    } else if (propertyTypeId == SaveDefaultData.propertyTypeFlatId) {
      return !isItInquiry
          ? Strings.iconPropertyTypeFlat
          : Strings.iconInquiryTypeFlat;
    } else if (propertyTypeId == SaveDefaultData.propertyTypeShowRoomId) {
      return !isItInquiry
          ? Strings.iconPropertyTypeShowroom
          : Strings.iconInquiryTypeShowroom;
    } else if (propertyTypeId == SaveDefaultData.propertyTypeOfficeId) {
      return !isItInquiry
          ? Strings.iconPropertyTypeOffice
          : Strings.iconInquiryTypeOffice;
    } else if (propertyTypeId == SaveDefaultData.propertyTypePlotId) {
      return !isItInquiry
          ? Strings.iconPropertyTypePlot
          : Strings.iconInquiryTypePlot;
    } else if (propertyTypeId ==
        SaveDefaultData.propertyTypeAgricultureLandId) {
      return !isItInquiry
          ? Strings.iconPropertyTypeAgricultureLand
          : Strings.iconInquiryTypeAgricultureLand;
    }
    return Strings.iconPropertyPlaceHolder;
  }

  Widget _loadPlaceHolder(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: (constraint.constrainWidth() / 4).w,
            vertical: (constraint.constrainHeight() / 4).h,
          ),
          color: isUserPlaceHolder
              ? StaticFunctions.getColor(
                  context,
                  ColorEnum.themeColorOpacity3Percentage,
                )
              : StaticFunctions.getColor(
                  context,
                  ColorEnum.blueColor,
                ).withOpacity(
                  0.08,
                ),
          child: Center(
            child: SvgPicture.asset(
              isUserPlaceHolder
                  ? Strings.iconUserPlaceHolder
                  : _getPropertyPlaceHolder(
                      propertyTypeId ?? -1,
                    ),
              width: (constraint.constrainWidth() / 2).w,
              height: (constraint.constrainHeight() / 2).h,
              fit: BoxFit.cover,
              color: shouldApplyColor
                  ? StaticFunctions.getColor(
                      context,
                      ColorEnum.blueColor,
                    )
                  : null,
            ),
          ),
        );
      },
    );
  }

  Widget _loadLocalProfilePic() {
    return FutureBuilder(
      future: FileUtils.userProfilePicLocalPath(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return (snapshot.data != null && snapshot.data!.isNotEmpty)
              ? File(snapshot.data!).existsSync()
                  ? Image.file(
                      File(snapshot.data!),
                      fit: BoxFit.cover,
                    )
                  : _loadPlaceHolder(context)
              : _loadPlaceHolder(context);
        }
        return _loadPlaceHolder(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return image == null || image!.trim().isEmpty
        ? Hero(
            tag: heroTag ?? getRandomTag(),
            child: _loadPlaceHolder(context),
          )
        : StaticFunctions.isHttpUrl(image)
            ? Hero(
                tag: heroTag ?? getRandomTag(),
                child: CachedNetworkImage(
                  imageUrl: image!,
                  placeholder: (context, url) => _loadPlaceHolder(context),
                  errorWidget: (context, error, stackTrace) {
                    if (isCurrentUserProfilePic) {
                      return _loadLocalProfilePic();
                    }
                    return _loadPlaceHolder(context);
                  },
                  fit: BoxFit.cover,
                ),
              )
            : Hero(
                tag: heroTag ?? getRandomTag(),
                child: File(image!).existsSync()
                    ? Image.file(
                        File(image!),
                        fit: BoxFit.cover,
                      )
                    : _loadPlaceHolder(context),
              );
  }
}
