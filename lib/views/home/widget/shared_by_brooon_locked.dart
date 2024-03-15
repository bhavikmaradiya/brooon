import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import '../../../common_property_data_provider.dart';
import '../../../const/dimen_const.dart';
import '../../../const/string_const.dart';
import '../../../utils/enums.dart';
import '../../../utils/static_functions.dart';

class SharedByBrooonLocked extends StatelessWidget {
  final Function onLockItemClicked;

  const SharedByBrooonLocked({
    Key? key,
    required this.onLockItemClicked,
  }) : super(key: key);

  Widget _sharedByBrooonLockView() {
    return Selector<CommonPropertyDataProvider, Tuple2<bool, Size>>(
      selector: (_, state) => Tuple2(
        state.isUserSubscribed,
        state.homeSharedByBrooonItemSize,
      ),
      shouldRebuild: (_, __) => true,
      builder: (context, tuple, child) {
        if (tuple.item1) {
          return const SizedBox();
        } else {
          return GestureDetector(
            onTap: () {
              onLockItemClicked();
            },
            child: SizedBox(
              width: tuple.item2.width,
              height: tuple.item2.height, // constraint.constrainHeight(),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 5,
                          sigmaY: 5,
                        ),
                        child: Container(
                          color: Colors.black.withOpacity(
                            0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      width: Dimensions.propertyLockContainerSize.w,
                      height: Dimensions.propertyLockContainerSize.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          Dimensions.propertyItemBorderRadius.r,
                        ),
                        color: StaticFunctions.getColor(
                          context,
                          ColorEnum.blackColor,
                        ).withOpacity(
                          0.5,
                        ),
                      ),
                      padding: EdgeInsets.all(
                        (Dimensions.propertyLockContainerSize / 5).w,
                      ),
                      child: SvgPicture.asset(
                        Strings.iconLock,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _sharedByBrooonLockView();
  }
}
