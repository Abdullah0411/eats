import 'package:eats_client/constants/shadow_const.dart';
import 'package:eats_client/constants/spacing_const.dart';
import 'package:eats_core/constants/constants.dart';
import 'package:eats_core/widgets/loading_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RestaurantLoading extends StatelessWidget {
  const RestaurantLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: SpacingConst.spacing16.toDouble()),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: smallBorderRadius,
          color: Colors.white,
          boxShadow: [
            ShadowConst.outerLightShadow,
            ShadowConst.outerDarkShadow,
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 345.w,
              height: 175.h,
              child: const LoadingContainer(borderRadius: smallBorderRadius),
            ),
            SpacingConst.vSpacing6,
            const LoadingContainer(borderRadius: smallBorderRadius),
            SpacingConst.vSpacing6,
            const LoadingContainer(borderRadius: smallBorderRadius),
            SpacingConst.vSpacing6,
            const LoadingContainer(borderRadius: smallBorderRadius),
            SpacingConst.vSpacing6,
            SpacingConst.vSpacing6
          ],
        ),
      ),
    );
  }
}
