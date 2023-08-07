import 'package:flutter/material.dart';
export 'core_colors.dart';


// Boarder radiuses
const bottomSheetBorderRadius = BorderRadius.only(topRight: Radius.circular(15.0), topLeft: Radius.circular(15.0));
const smallBorderRadius = BorderRadius.all(Radius.circular(10));
const mediumBorderRadius = BorderRadius.all(Radius.circular(30));
const largeBorderRadius = BorderRadius.all(Radius.circular(40));

const double verySmallSeparation = 5;
const double smallSeparation = 10;
const double mediumSeparation = 15;
const double largeSeparation = 20;
const double veryLargeSeparation = 25;

// Flags
const saudiArabiaFlag = 'assets/svg/saudi_arabia_flag.svg';
const fullScreenIcon = 'assets/svg/full_screen.svg';
const exitFullScreenIcon = 'assets/svg/exit_full_screen.svg';

// Fonts
const dinNext = 'DinNext';

class ScreensSizesConstants {
  static const manageServicesScreenH = 750;
  static const manageServicesScreenW = 950;
}

class ShadowsConstants {
  static final blackShadow = BoxShadow(
    color: Colors.black.withOpacity(0.1),
    spreadRadius: 0.5,
    blurRadius: 10,
  );
}

class BordersConstants {
  static final whiteBorder = Border.all(color: Colors.white);
}

class BorderSideConstants {}

class BorderRadiusConstants {
  static const circularBorderRadius = BorderRadius.all(Radius.circular(100));
}

class GlobalAssetsConstants {
  static const garageLogo = "assets/svg/garage_lines.svg";
}

class BackendConstants {
  static const domain = "hevea.app";
}
