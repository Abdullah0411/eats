import 'package:eats_client/constants/border_radius_const.dart';
import 'package:eats_core/constants/core_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';


class ShimmerContainer extends StatelessWidget {
  const ShimmerContainer({super.key, this.height, this.width, this.shape = BoxShape.rectangle, this.isAnimated = true});

  final double? height;
  final double? width;
  final BoxShape shape;
  final bool isAnimated;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: CoreColors.lightGrey.withOpacity(0.7),
          shape: shape,
          borderRadius: shape == BoxShape.rectangle ? BorderRadiusConst.largeBorderRadius : null),
      height: height,
      width: width,
    )
        .animate(
          onPlay: (controller) {
            controller.loop();
          },
          target: isAnimated ? 1 : 0,
        )
        .shimmer(duration: 800.ms);
  }
}

class ListShimmerContainer extends StatelessWidget {
  const ListShimmerContainer(
      {super.key, this.height, this.width, this.shape = BoxShape.rectangle, this.count = 3, this.padding});

  final double? height;
  final double? width;
  final EdgeInsets? padding;
  final BoxShape shape;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        count,
        (index) {
          return Padding(
            padding: padding ?? EdgeInsets.all(8.0.r),
            child: ShimmerContainer(
              height: height,
              width: width,
              isAnimated: false,
            ),
          );
        },
      )
          .animate(interval: 200.ms)
          .fadeIn()
          .animate(
              onPlay: (controller) {
                controller.loop();
              },
              interval: 400.ms)
          .shimmer(duration: 1500.ms, angle: 1),
    );
  }
}
