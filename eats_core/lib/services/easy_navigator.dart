import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:eats_core/utilis/logger/g_logger.dart';
import 'package:eats_core/widgets/bottom_sheet/src.dart';
import 'package:eats_core/widgets/bottom_sheet/utils/bottom_sheet_wrapper.dart';

class EasyNavigator {
  static Future<T?> openPage<T>({
    required BuildContext context,
    required Widget page,
    bool isAnimated = false,
    bool isPushReplaced = false,
    bool isPushAndRemoveUntil = false,
    bool isCupertinoStyle = true,
    bool isDismissible = true,
    bool expand = true,
  }) async {
// It's just a check to make sure that you can't set isCupertinoStyle to true and isPushReplaced or
// isPushAndRemoveUntil to true, you should set only one of them to true.
    if ((isPushReplaced || isPushAndRemoveUntil) && isCupertinoStyle) {
      log("(EasyNavigator): Can't set [isCupertinoStyle = true] and [isPushReplaced or isPushAndRemoveUntil = true], you should set only one of them to true\nSetting isCupertinoStyle to `false`");
      isCupertinoStyle = false;
    }

    if (kIsWeb) {
      log("(EasyNavigator): Can't set [isCupertinoStyle = true] in web mode");
      isCupertinoStyle = false;
    }

    // Screens
    if (isCupertinoStyle) {
      return await showCupertinoModalBottomSheet<T>(
        expand: expand,
        isDismissible: isDismissible,
        duration: const Duration(milliseconds: 300),
        // settings: RouteSettings(arguments: {'isAnimated': isAnimated}),
        context: context,

        builder: (context) {
          return BottomSheetWrapper(body: page);
        },
      );
    } else {
      // Push

      if (isPushAndRemoveUntil) {
        return await Navigator.of(context).pushAndRemoveUntil<T>(
            MaterialWithModalsPageRoute(builder: (context) => page),
            (Route<dynamic> route) => false);
      }

      if (isPushReplaced) {
        return await Navigator.of(context).pushReplacement(
            AnimatedMaterialWithModalsPageRoute(builder: (context) => page));
      }

      if (!isAnimated) {
        return await Navigator.of(context, rootNavigator: true)
            .push<T>(MaterialWithModalsPageRoute(
          fullscreenDialog: true,
          builder: (BuildContext context) => page,
        ));
      } else if (isAnimated) {
        // return await Navigator.of(context).push<T>(
        // AnimatedMaterialWithModalsPageRoute(builder: (context) => page));
        // return await Navigator.of(context).push(PageRouteBuilder(
        //   pageBuilder: ((context, animation, secondaryAnimation) => page),
        //   transitionsBuilder: (context, animation, secondaryAnimation, child) {
        //     Curve curve = Curves.ease;
        //     var curveTween = CurveTween(curve: curve);
        //     const begin = Offset(0.0, 1.0);
        //     const end = Offset.zero;
        //     Animatable<Offset> tween =
        //         Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        //     final offsetAnimation = animation.drive(tween);
        //     final curvedAnimation = CurvedAnimation(
        //       parent: animation,
        //       curve: curve,
        //     );

        //     return SlideTransition(
        //       position: tween.animate(curvedAnimation),
        //       child: child,
        //     );
        //   },
        // ));
        return await Navigator.of(context)
            .push(MaterialPageRoute(builder: ((context) {
          return page;
        })));
      }
    }
    return null;
  }

  /// Pop the view to the root view
  static void popToFirstView(BuildContext context) {
    GLogger.debug("Pop to first view");
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  static Future<void> popPage(context, {args}) async {
    await Navigator.maybePop(context, args);
  }
}
