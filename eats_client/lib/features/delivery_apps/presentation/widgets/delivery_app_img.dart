import 'package:flutter/material.dart';

class DeliveryAppsImg extends StatelessWidget {
  const DeliveryAppsImg(
      {super.key,
      required this.imgAssetName,
      this.width = 25,
      this.height = 25});
  final String imgAssetName;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          imgAssetName,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
