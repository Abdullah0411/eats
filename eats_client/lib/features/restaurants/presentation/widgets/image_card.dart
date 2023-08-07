import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:eats_core/widgets/loading_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eats_core/constants/constants.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    Key? key,
    required this.imgUrl,
  }) : super(key: key);

  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 345.w,
      height: 175.h,
      child: ClipRRect(
        borderRadius: smallBorderRadius,
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: imgUrl,
          placeholder: (context, url) => LoadingContainer(
            borderRadius: smallBorderRadius,
            height: 175.h,
            width: 345.w,
          ),
        ),
      ),
    );
  }
}
