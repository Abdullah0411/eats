import 'package:flutter/material.dart';
import 'package:eats_client/constants/colors_const.dart';
import 'package:eats_core/widgets/custom_textfield/textfield_types.dart';

class CustomTextFieldWidgetController {
  Color getTextFieldColor(TextFieldType type, bool isValid, bool showValid) {
    if (type == TextFieldType.active) {
      return AppColors.primary;
    } else if (isValid) {
      if (showValid) {
        return AppColors.positiveGreen;
      } else {
        return Colors.grey;
      }
    } else {
      return AppColors.negativeRed;
    }
  }
}
