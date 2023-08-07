import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:eats_client/constants/constants.dart';
import 'package:eats_client/constants/spacing_const.dart';
import 'package:eats_core/constants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:eats_client/theme/extensions.dart';

class CustomPhoneTextField extends StatelessWidget {
  final String? Function(String?)? validator;
  final void Function(String) onChange;

  const CustomPhoneTextField({
    Key? key,
    required this.validator,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320.h,
      child: Stack(
        children: [
          TextFormField(
            onChanged: onChange,
            validator: validator,
            keyboardType: TextInputType.number,
            inputFormatters: [LengthLimitingTextInputFormatter(10)],
            textAlign: TextAlign.center,
            style: context.textThemes.bodySmall,
            decoration: InputDecoration(
              border: const OutlineInputBorder(borderRadius: smallBorderRadius),
              enabledBorder: const OutlineInputBorder(
                borderRadius: smallBorderRadius,
                borderSide: BorderSide(width: 0, color: Colors.transparent),
              ),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: smallBorderRadius,
                  borderSide:
                      BorderSide(width: 1.w, color: AppColors.negativeRed)),
              errorBorder: OutlineInputBorder(
                  borderRadius: smallBorderRadius,
                  borderSide:
                      BorderSide(width: 1.w, color: AppColors.negativeRed)),
              hintText: "05XXXXXXXX",
              hintStyle: context.textThemes.bodySmall
                  ?.copyWith(color: AppColors.lightGrey),
              fillColor: AppColors.cultured,
              filled: true,
              contentPadding:
                  EdgeInsets.only(left: 20.w, top: 14.h, bottom: 14.h),
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColors.primary, width: 0.8.w),
                  borderRadius: smallBorderRadius),
            ),
          ),
          Positioned(
            left: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: SpacingConst.spacing6.toDouble()),
              child: Container(
                height: 33.h,
                padding: EdgeInsets.symmetric(
                    horizontal: SpacingConst.spacing16.toDouble()),
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      width: 1.w,
                      color: AppColors.lightGrey,
                    ),
                  ),
                ),
                child: SizedBox(
                  height: 23.h,
                  width: 32.w,
                  child: ClipRRect(
                    borderRadius: smallBorderRadius,
                    child: SvgPicture.asset(AssetsConst.saudiArabiaFlag),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
