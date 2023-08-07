import 'package:flutter/material.dart';
import 'package:eats_core/constants/constants.dart';
import 'package:eats_core/widgets/custom_textfield/textfield_types.dart';

class CustomTextFieldWidgetController {
  Color getTextFieldColor(TextFieldType type, bool isValid, bool showValid) {
    if (type == TextFieldType.active) {
      return CoreColors.veryDarkGrey;
    } else if (isValid) {
      if (showValid) {
        return CoreColors.positiveGreen;
      } else {
        return Colors.grey;
      }
    } else {
      return CoreColors.errorRed;
    }
  }
}
