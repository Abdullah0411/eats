import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedImage extends StatelessWidget {
  const RoundedImage({super.key, required this.size, required this.imgUrl});
  final double size;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.r,
      height: size.r,
      clipBehavior: Clip.none,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 27,
              spreadRadius: 0)
        ],
      ),
      child: Image.asset(imgUrl),
    );
  }
}
