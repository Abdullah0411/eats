import 'package:flutter/material.dart';
import 'package:eats_client/constants/colors_const.dart';

class ShadowConst {
  static final blackShadow = BoxShadow(
    color: AppColors.black.withOpacity(0.1),
    blurRadius: 15,
  );
  static const outerDarkShadow = BoxShadow(
    blurRadius: 10,
    offset: Offset(3, 3),
    color: Color(0xffa7a9af),
  );
  static const outerLightShadow = BoxShadow(
    blurRadius: 20,
    offset: Offset(-10, -10),
    color: Colors.white,
  );

  static const innerDarkShadow = BoxShadow(
    color: Color(0xffa7a9af),
    spreadRadius: 2.0,
    blurRadius: 1,
  );
  static const innerLightShadow = BoxShadow(
    color: Colors.white,
    spreadRadius: 5.0,
    blurRadius: 10,
  );
}
