import 'package:flutter/material.dart';
import 'package:eats_client/constants/colors_const.dart';
import 'package:eats_client/features/auth/login/presentation/widgets/otp_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eats_core/constants/constants.dart';
import 'package:eats_client/theme/extensions.dart';

class OtpField extends StatefulWidget {
  // The ["\u200b"] is a zero size character, we use it as a workaround to detect user's clicking on delete button, more info: https://medium.com/super-declarative/why-you-cant-detect-a-delete-action-in-an-empty-flutter-text-field-3cf53e47b631
  final TextEditingController controller =
      TextEditingController(text: "\u200b");

  final List<FocusNode> focusNodes;
  final int fieldIndex;
  final void Function() callback;

  String get value => controller.text;

  OtpField(
      {required this.callback,
      Key? key,
      required this.focusNodes,
      required this.fieldIndex})
      : super(key: key);

  @override
  State<OtpField> createState() => OtpFieldState();
}

class OtpFieldState extends State<OtpField> {
  @override
  void initState() {
    super.initState();

    widget.controller.addListener(() {
      OTPFieldController.handleEmptyText(widget.controller);
    });
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  /// Return the OTP field value
  String get value => widget.controller.text.replaceAll("\u200b", '');

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.w,
      width: 48.w,
      child: TextFormField(
        style: context.textThemes.bodyLarge,
        autofocus: widget.fieldIndex == 0,
        focusNode: widget.focusNodes[widget.fieldIndex],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: widget.controller,
        maxLength: 2,
        cursorColor: Theme.of(context).primaryColor,
        onChanged: (_) => OTPFieldController.handleChangeFocus(
          controller: widget.controller,
          context: context,
          callback: widget.callback,
          focusNodes: widget.focusNodes,
          fieldIndex: widget.fieldIndex,
        ),
        decoration: InputDecoration(
          border: const OutlineInputBorder(borderRadius: smallBorderRadius),
          enabledBorder: const OutlineInputBorder(
            borderRadius: smallBorderRadius,
            borderSide: BorderSide(width: 0, color: Colors.transparent),
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: smallBorderRadius,
              borderSide: BorderSide(width: 1.w, color: AppColors.negativeRed)),
          errorBorder: OutlineInputBorder(
              borderRadius: smallBorderRadius,
              borderSide: BorderSide(width: 1.w, color: AppColors.negativeRed)),
          hintStyle: context.textThemes.bodySmall
              ?.copyWith(color: AppColors.lightGrey),
          contentPadding: EdgeInsets.only(bottom: 10.h),
          fillColor: AppColors.cultured,
          filled: true,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.green, width: 0.8.w),
              borderRadius: smallBorderRadius),
          counterText: '',
        ),
      ),
    );
  }
}
