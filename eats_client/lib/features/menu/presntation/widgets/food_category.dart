import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eats_client/constants/colors_const.dart';
import 'package:eats_client/constants/shadow_const.dart';
import 'package:eats_core/constants/constants.dart';
import 'package:eats_core/widgets/bottom_sheet/utils/sheet.dart';

class FoodCategory extends StatelessWidget {
  FoodCategory({super.key, required this.title, this.isSelected = false});
  final String title;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: 100.ms,
      curve: Curves.easeInOut,
      width: 120.w,
      height: 39.h,
      decoration: BoxDecoration(
        borderRadius: largeBorderRadius,
        color: isSelected ? AppColors.darkGreenTerquise : AppColors.white,
        boxShadow: const [
          ShadowConst.outerLightShadow,
          ShadowConst.outerDarkShadow,
        ],
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          title,
          style: isSelected
              ? Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: AppColors.white, fontSize: 15)
              : Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
