import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eats_client/constants/colors_const.dart';
import 'package:eats_client/constants/spacing_const.dart';
import 'package:eats_core/constants/constants.dart';
import 'package:eats_client/theme/extensions.dart';

class CustomSearchField extends StatefulWidget {
  const CustomSearchField(
      {Key? key,
      required this.onChange,
      required this.controller,
      required this.onPressed})
      : super(key: key);

  final void Function(String) onChange;
  final void Function() onPressed;
  final TextEditingController controller;

  @override
  State<CustomSearchField> createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  bool _isShowen = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.w,
      height: 40.h,
      child: Stack(
        children: [
          TextField(
            controller: widget.controller,
            cursorColor: AppColors.darkGreen,
            onChanged: (value) {
              setState(() {
                if (widget.controller.text.isNotEmpty) {
                  _isShowen = true;
                } else {
                  _isShowen = false;
                }
              });
              widget.onChange(value);
            },
            keyboardType: TextInputType.text,
            textAlign: TextAlign.start,
            style: context.textThemes.bodySmall!
                .copyWith(color: AppColors.darkGrey),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: mediumBorderRadius,
                  borderSide:
                      BorderSide(color: AppColors.transparent, width: 1.w)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: mediumBorderRadius,
                  borderSide:
                      BorderSide(color: AppColors.transparent, width: 1.w)),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: mediumBorderRadius,
                borderSide:
                    BorderSide(width: 1.w, color: AppColors.negativeRed),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: mediumBorderRadius,
                borderSide:
                    BorderSide(width: 1.w, color: AppColors.negativeRed),
              ),
              hintText: "Search for restaurants",
              hintStyle: context.textThemes.bodySmall
                  ?.copyWith(color: AppColors.darkGrey),
              fillColor: AppColors.lightGrey,
              filled: true,
              contentPadding:
                  EdgeInsets.only(left: 50.w, top: 14.h, bottom: 14.h),
              focusedBorder: OutlineInputBorder(
                  borderRadius: mediumBorderRadius,
                  borderSide:
                      BorderSide(width: 0.7.w, color: AppColors.darkGreen)),
            ),
          ),
          Positioned(
            left: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: SpacingConst.spacing6.toDouble()),
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: SpacingConst.spacing8.toDouble()),
                height: 25.h,
                child: SizedBox(
                    height: 23.h,
                    width: 32.w,
                    child: const Icon(
                      Icons.search,
                      color: AppColors.darkGrey,
                    )),
              ),
            ),
          ),
          Visibility(
            visible: _isShowen,
            child: Positioned(
                right: 10,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: SpacingConst.spacing8.toDouble()),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isShowen = false;
                      });
                      widget.onPressed();
                    },
                    child: const Icon(
                      Icons.highlight_remove_rounded,
                      color: AppColors.darkGrey,
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
