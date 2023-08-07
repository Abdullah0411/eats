import 'package:flutter/material.dart';
import 'package:eats_core/constants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eats_client/constants/constants.dart';
import 'package:eats_client/theme/extensions.dart';

class CustomCenteredTextField extends StatelessWidget {
  const CustomCenteredTextField({
    Key? key,
    required this.onChange,
  }) : super(key: key);

  final void Function(String) onChange;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChange,
      keyboardType: TextInputType.name,
      textAlign: TextAlign.center,
      style: context.textThemes.bodySmall,
      decoration: InputDecoration(
        border: const OutlineInputBorder(borderRadius: smallBorderRadius),
        enabledBorder: OutlineInputBorder(
          borderRadius: smallBorderRadius,
          borderSide: BorderSide(color: AppColors.green, width: 0.8.w),
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: smallBorderRadius,
            borderSide: BorderSide(width: 1.w, color: AppColors.negativeRed)),
        errorBorder: OutlineInputBorder(
            borderRadius: smallBorderRadius,
            borderSide: BorderSide(width: 1.w, color: AppColors.negativeRed)),
        hintText: "الاسم",
        hintStyle:
            context.textThemes.bodySmall?.copyWith(color: AppColors.lightGrey),
        fillColor: AppColors.cultured,
        filled: true,
        contentPadding: EdgeInsets.only(top: 14.h, bottom: 14.h),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.green, width: 0.8.w),
            borderRadius: smallBorderRadius),
      ),
    );
  }
}
