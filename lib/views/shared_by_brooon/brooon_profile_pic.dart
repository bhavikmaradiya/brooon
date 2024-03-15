import 'package:brooon/const/string_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../const/dimen_const.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';
import '../../widgets/image_loader.dart';

class BrooonProfilePic extends StatelessWidget {
  final String? brooonProfilePic;
  final String? brooonName;
  final AppLocalizations localizationsContext;

  const BrooonProfilePic({
    Key? key,
    required this.localizationsContext,
    required this.brooonProfilePic,
    required this.brooonName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.propertyItemBrooonProfileSize.w,
      height: Dimensions.propertyItemBrooonProfileSize.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: StaticFunctions.getColor(
            context,
            ColorEnum.borderColorE0,
          ),
          width: Dimensions.propertyItemBorderWidth.w,
        ),
        color: StaticFunctions.getColor(
          context,
          ColorEnum.whiteColor,
        ),
      ),
      child: (brooonProfilePic ?? '').isNotEmpty
          ? ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  Dimensions.propertyItemBrooonProfileSize.r,
                ),
              ), //
              child: ImageLoader(
                image: brooonProfilePic ?? '',
                isUserPlaceHolder: true,
              ),
            )
          : Center(
              child: Text(
                (brooonName ?? localizationsContext.appName).getInitials(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: StaticFunctions.getColor(
                    context,
                    ColorEnum.blueColor,
                  ),
                  fontSize: Dimensions.propertyItemBrooonInitialTextSpacing.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
    );
  }
}
