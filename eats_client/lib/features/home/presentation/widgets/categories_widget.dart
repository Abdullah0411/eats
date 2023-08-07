import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eats_core/constants/constants.dart';
import 'package:eats_client/theme/extensions.dart';
import 'package:eats_client/constants/constants.dart';


class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);
  final String label;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(

        decoration: BoxDecoration(
          boxShadow: [ShadowConst.blackShadow],
          borderRadius: mediumBorderRadius,
        ),
        height: 155.h,
        width: 350.w,
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
                      height: 155.h,

                      width: double.infinity,
                      child: Image.asset(
                        'assets/images/food.jpeg',
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
                        height: 155.h,
                      ),

                    )
                  ],
                ),
                Positioned(

                  left: 20.w,
                  top: 115.h,
                  child: Text(
                    label,
                    style: context.textThemes.bodyLarge!
                        .copyWith(color: AppColors.white),

                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
