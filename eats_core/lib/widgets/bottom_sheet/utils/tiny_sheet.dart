import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/core_colors.dart';
import '../bottom_sheets/bar_bottom_sheet.dart';

/// A widget that can be used a wrapper to the Scaffold to handle Cupertino bottom sheets
class TinySheet extends StatelessWidget {
  const TinySheet(
      {Key? key,
      this.child,
      this.children,
      this.isScrolling = false,
      this.backgroundColor = CoreColors.whiteColor,
      this.isFullScreen = true,
      this.bottomSheet,
      this.appBar,
      this.overriddenHeight,
      this.footer})
      : assert(child == null || children == null, "child/children must not be null"),
        super(key: key);

  /// The  Widget body of the sheet (You can pass a one Widget using [child] or List of Widgets using [children])
  final Widget? child;

  final Widget? bottomSheet;

  /// The lit of Widgets body of the sheet
  final List<Widget>? children;

  final List<Widget>? footer;

  /// Is this sheet scrollable or not?
  final bool isScrolling;

  final bool isFullScreen;

  final Color? backgroundColor;

  final Widget? appBar;

  final double? overriddenHeight;

  @override
  Widget build(BuildContext context) {
    final Widget body = children != null
        ? Column(
            children: children!,
          )
        : child!;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        physics: isScrolling ? const ClampingScrollPhysics() : const NeverScrollableScrollPhysics(),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            BarBottomSheet(
              isFullScreen: isFullScreen,
              backgroundColor: backgroundColor,
              overriddenHeight: overriddenHeight,
              // control: const SizedBox.shrink(),
              child: (Center(
                child: body,
              )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
              child: appBar ?? const SizedBox.shrink(),
            ),
          ],
        ),
      ),
      persistentFooterButtons: footer,
      bottomSheet: bottomSheet,
    );
  }
}
