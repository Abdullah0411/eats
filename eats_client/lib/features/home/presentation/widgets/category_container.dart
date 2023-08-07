import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eats_core/constants/constants.dart';
import 'package:eats_client/theme/extensions.dart';
import 'package:eats_client/constants/constants.dart';

class CategoryContainer extends StatelessWidget {
  const CategoryContainer(
      {Key? key,
      required this.label,
      required this.imgUrl,
      required this.onPressed})
      : super(key: key);
  final String label;
  final String imgUrl;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [ShadowConst.blackShadow],
        borderRadius: mediumBorderRadius,
      ),
      width: 150.w,
      child: ClipRRect(
        borderRadius: mediumBorderRadius,
        child: InkWell(
          borderRadius: mediumBorderRadius,
          onTap: onPressed,
          child: Stack(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 160.h,
                    child: Image.asset(
                      imgUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    child: Container(
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [AppColors.transparent, AppColors.lightblack],
                      )),
                    ),
                  )
                ],
              ),
              Positioned(
                left: 10.w,
                top: 112.h,
                child: Text(
                  label,
                  style: context.textThemes.bodyMedium!
                      .copyWith(color: AppColors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
