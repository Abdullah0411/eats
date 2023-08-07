import 'package:eats_client/app.dart';
import 'package:eats_client/localization/extensions.dart';
import 'package:eats_client/theme/extensions.dart';
import 'package:eats_core/constants/core_colors.dart';
import 'package:eats_core/widgets/bottom_sheet/utils/sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_button/custom_button.dart';

class AlertDialogBox {
  static Future<bool?> showAssertionDialog(
      {required String message,
      String title = '',
      String trueText = 'button.confirm',
      String falseText = 'button.cancel'}) async {
    final context = App.navigatorKey!.currentState!.overlay!.context;

    final isPopProvider = StateProvider.autoDispose<bool>((ref) {
      return false;
    });

    return showDialog<bool>(
      context: context,
      barrierDismissible: false, // user must tap button!
      barrierColor: Colors.black.withOpacity(0.3),

      builder: (BuildContext context) {
        return Consumer(builder: (context, ref, _) {
          return AlertDialog(
            title: title != ''
                ? Text(
                    title.translate(),
                    style: context.textThemes.bodyMedium,
                    textAlign: TextAlign.center,
                  )
                : null,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25.r))),
            backgroundColor: CoreColors.whiteColor,
            content: WillPopScope(
              onWillPop: () async {
                ref.read(isPopProvider.notifier).state = true;

                await Future.delayed(300.ms);
                return true;
              },
              child: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Center(
                      child: Text(
                        message.translate(),
                        style: context.textThemes.bodySmall?.copyWith(color: CoreColors.lightGrey),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: CustomButton(
                              label: falseText.translate(),
                              // style: CustomButtonStyle.transparent,
                              // textStyle: context.textThemes.bodySmall?.copyWith(color: AppColors.greenTerquise),
                              onPressed: () async {
                                ref.read(isPopProvider.notifier).state = true;

                                await Future.delayed(300.ms);
                                Navigator.pop(context, false);
                              },
                            ),
                          ),
                          SizedBox(width: 30.w),
                          Expanded(
                            child: CustomButton(
                              label: trueText.translate(),
                              color: CoreColors.errorRed.withOpacity(0.9),
                              // textStyle: context.textThemes.bodySmall?.copyWith(color: CoreColors.whiteColor),
                              onPressed: () => Navigator.pop(context, true),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
              .animate(
                target: ref.watch(isPopProvider) == true ? 0 : 1,
              )
              .slideY(
                begin: 1,
                end: 0,
                duration: 1000.ms,
                curve: Sprung.overDamped,
              )
              .animate(
                target: ref.watch(isPopProvider) == true ? 1 : 0,
              )
              .slideY(
                begin: 0,
                end: 1,
                duration: 1000.ms,
                curve: Sprung.overDamped,
              );
        });
      },
    );
  }

  static Future<bool?> showBoxDialog({
    required Widget child,
    EdgeInsetsGeometry? contentPadding,
    bool barrierDismissible = true,
  }) async {
    final context = App.navigatorKey!.currentState!.overlay!.context;

    final isPopProvider = StateProvider.autoDispose<bool>((ref) {
      return false;
    });

    return showDialog<bool>(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierColor: Colors.black.withOpacity(0.3),
      builder: (BuildContext context) {
        return Consumer(builder: (context, ref, _) {
          return AlertDialog(
            contentPadding: contentPadding,
            insetPadding: EdgeInsets.symmetric(horizontal: 12.w),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.r))),
            backgroundColor: CoreColors.whiteColor,
            content: WillPopScope(
                onWillPop: () async {
                  ref.read(isPopProvider.notifier).state = true;

                  await Future.delayed(300.ms);
                  return true;
                },
                child: child),
          )
              .animate(
                target: ref.watch(isPopProvider) == true ? 0 : 1,
              )
              .slideY(
                begin: 1,
                end: 0,
                duration: 900.ms,
                curve: Sprung.overDamped,
              )
              .animate(
                target: ref.watch(isPopProvider) == true ? 1 : 0,
              )
              .slideY(
                begin: 0,
                end: 1,
                duration: 900.ms,
                curve: Sprung.overDamped,
              );
        });
      },
    );
  }
}
