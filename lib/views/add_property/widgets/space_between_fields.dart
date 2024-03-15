import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../const/dimen_const.dart';

class SpaceBetweenFields extends StatelessWidget {
  const SpaceBetweenFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.addPropertyFieldsSpacing.h,
    );
  }
}
