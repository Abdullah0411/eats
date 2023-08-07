import 'package:flutter/material.dart';
import 'package:eats_core/constants/constants.dart';
import 'package:shimmer/shimmer.dart';

class LoadingContainer extends StatelessWidget {
  /// height in [Sizer]
  final double height;

  /// width in [Sizer]
  final double width;
  final BorderRadiusGeometry borderRadius;
  const LoadingContainer(
      {Key? key,
      this.height = 7,
      this.width = 85,
      this.borderRadius = largeBorderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        period: const Duration(seconds: 1),
        baseColor: CoreColors.lightGrey2,
        highlightColor: Colors.grey.shade200,
        enabled: true,
        child: Container(
          width: width,
          height: height,
          decoration:
              BoxDecoration(color: Colors.grey, borderRadius: borderRadius),
        ));
  }
}
