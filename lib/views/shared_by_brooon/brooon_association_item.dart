import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../const/dimen_const.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';
import '../../widgets/image_loader.dart';

class BrooonAssociationItem extends StatelessWidget {
  final String? brooonAssociationPic;
  final String? brooonAssociationName;
  final double? iconSize;
  final double? textSize;
  final double? textIconBetweenSpace;

  const BrooonAssociationItem({
    Key? key,
    required this.brooonAssociationPic,
    required this.brooonAssociationName,
    this.iconSize,
    this.textSize,
    this.textIconBetweenSpace,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations? _localizationsContext = AppLocalizations.of(context)!;
    if ((brooonAssociationPic == null ||
            brooonAssociationPic!.trim().isEmpty) &&
        (brooonAssociationName == null ||
            brooonAssociationName!.trim().isEmpty)) {
      return const SizedBox();
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: iconSize ?? Dimensions.propertyItemBrooonProfileSize.w,
          height: iconSize ?? Dimensions.propertyItemBrooonProfileSize.w,
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
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(
                Dimensions.propertyItemBrooonProfileSize.r,
              ),
            ), //
            child: ImageLoader(
              image: brooonAssociationPic ?? '',
            ),
          ),
        ),
        if (brooonAssociationName != null)
          SizedBox(
            width: textIconBetweenSpace ??
                Dimensions
                    .propertyDetailAssociateIconAndContentBetweenSpacing.w,
          ),
        if (brooonAssociationName != null)
          Expanded(
            child: Text(
              _localizationsContext.memberOfAssociation(brooonAssociationName!),
              style: TextStyle(
                fontSize:
                    textSize ?? Dimensions.propertyDetailAssociateTextSize.sp,
                color: StaticFunctions.getColor(
                  context,
                  ColorEnum.gray90Color,
                ),
              ),
            ),
          )
      ],
    );
  }
}
