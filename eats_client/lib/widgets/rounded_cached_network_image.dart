import 'package:eats_client/widgets/shimmer_container.dart';
import 'package:eats_core/services/validator.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';

class RoundedCachedNetworkImage extends StatelessWidget {
  final double size;
  final String imageUrl;
  final BoxBorder? border;
  final EdgeInsets? padding;
  final List<BoxShadow>? shadow;
  const RoundedCachedNetworkImage(
      {super.key, required this.size, required this.imageUrl, this.border, this.padding, this.shadow});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      clipBehavior: Clip.none,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: shadow ??
            (Validator.safeIsNotEmpty(imageUrl)
                ? [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 27, spreadRadius: 0)]
                : null),
        border: border,
      ),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        placeholderFadeInDuration: 50.ms,
        imageBuilder: (context, imageProvider) => Container(
          width: size.r,
          height: size.r,
          clipBehavior: Clip.none,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          ),
        ),
        placeholder: (context, url) => ShimmerContainer(height: size.r, width: size.r, shape: BoxShape.circle),
        errorWidget: (context, url, error) => SizedBox(
          height: size.r,
          width: size.r,
        ),
      ),
    );
  }
}
