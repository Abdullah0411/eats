import 'package:cached_network_image/cached_network_image.dart';
import 'package:eats_client/constants/constants.dart';
import 'package:eats_client/constants/shadow_const.dart';
import 'package:eats_core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedSquaredNetworkCachedImage extends StatelessWidget {
  const RoundedSquaredNetworkCachedImage({super.key, required this.imgUrl});
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75.h,
      width: 75.w,
      decoration: BoxDecoration(
        borderRadius: smallBorderRadius,
        boxShadow: [ShadowConst.outerLightShadow, ShadowConst.blackShadow],
      ),
      child: ClipRRect(
          borderRadius: smallBorderRadius,
          child: CachedNetworkImage(
            errorWidget: (context, url, error) => Image.asset(
              AssetsConst.placeholderMeal,
              fit: BoxFit.cover,
            ),
            placeholder: (context, url) => Image.asset(
              AssetsConst.placeholderMeal,
              fit: BoxFit.cover,
            ),
            imageUrl: imgUrl,
            fit: BoxFit.cover,
          )),
    );
  }
}
