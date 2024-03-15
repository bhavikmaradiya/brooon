import 'package:flutter/material.dart';

import '../utils/enums.dart';
import '../utils/static_functions.dart';
import 'circular_indicator.dart';

class LoadingMapWidget extends StatelessWidget {
  final bool isMapCreated;

  const LoadingMapWidget({
    Key? key,
    required this.isMapCreated,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !isMapCreated
        ? Positioned.fill(
            child: IgnorePointer(
              child: Container(
                color: StaticFunctions.getColor(
                  context,
                  ColorEnum.whiteColor,
                ),
                child: Center(
                  child: CircularIndicator(),
                ),
              ),
            ),
          )
        : Positioned(
            top: 0,
            left: 0,
            child: const SizedBox(),
          );
  }
}
