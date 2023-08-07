import 'package:flutter/material.dart';
import 'package:eats_client/features/auth/login/domain/login_providers.dart';
import 'package:eats_client/features/auth/login/presentation/controllers/login_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eats_client/constants/constants.dart';
import 'package:eats_client/constants/spacing_const.dart';
import 'package:eats_client/widgets/custom_button/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eats_client/widgets/otp_text_field/otp_textfield.dart';
import 'package:eats_client/theme/extensions.dart';
import 'package:eats_client/localization/localization.dart';
import 'package:eats_core/widgets/bottom_sheet/utils/sheet.dart';

class OtpScreen extends ConsumerStatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<OtpScreen> createState() => _OtpViewState();
}

class _OtpViewState extends ConsumerState<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(loginScreenControllerProvider.notifier);
    return Sheet(
      footer: [
        Consumer(
          builder: (context, ref, child) {
            final isFocused = ref.watch(isFocusedOtpFieldProvider);
            return AnimatedPadding(
              duration: const Duration(milliseconds: 200),
              padding: EdgeInsets.only(bottom: isFocused ? 275.h : 40.h),
              child: CustomButton(
                width: 317.w,
                height: 50.h,
                onPressed: controller.onOtpCheckButtonPressed,
                label: "Check",
              ),
            );
          },
        )
      ],
      children: [
        SizedBox(
          height: 400.h,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 90.h,
                child: Column(
                  children: [
                    Text("Verification", style: context.textThemes.titleLarge),
                    SpacingConst.vSpacing8,
                    SizedBox(
                      width: 300.w,
                      child: Text(
                        "We have sent you an SMS code ",
                        style: context.textThemes.caption?.regular
                            .copyWith(color: AppColors.blackCoral),
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SpacingConst.hSpacing20,
                    Text(
                      '${ref.read(loginInfoProvider)?.phoneNumber}',
                      style: context.textThemes.caption?.regular,
                    ),
                    SpacingConst.vSpacing70,
                    SizedBox(
                      width: 350.w,
                      child: Form(
                        key: controller.otpCodeFormKey,
                        child: Focus(
                          onFocusChange: controller.changeOtpFieldFocus,
                          child: OTPTextField(
                            validator: controller.otpFieldValidator,
                            fieldsCount: 6,
                            onComplete: controller.onOtpCheckButtonPressed,
                            key: controller.otpTextFieldKey,
                          ),
                        ),
                      ),
                    ),
                    Consumer(builder: (context, ref, child) {
                      final isValidOtp = ref.watch(isValidOtpProvider);
                      return Visibility(
                        visible: !isValidOtp,
                        child: Text(
                          "Incorrect OTP",
                          style: context.textThemes.caption?.regular
                              .copyWith(color: AppColors.negativeRed),
                        ),
                      );
                    }),
                    SpacingConst.vSpacing6,
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SpacingConst.spacing40.w),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: controller.onResendOtpPressed,
                            child: Consumer(
                              builder: (context, ref, child) {
                                final allowResendOtp =
                                    ref.watch(allowResendOtpProvider);
                                return Text(
                                  "Code not received?",
                                  style: context.textThemes.caption?.regular
                                      .copyWith(
                                          color: allowResendOtp
                                              ? AppColors.primary
                                              : AppColors.lightGrey),
                                );
                              },
                            ),
                          ),
                          SpacingConst.hSpacing6,
                          Consumer(
                            builder: (context, ref, child) {
                              final timer = ref.watch(timerToResend);

                              return Text(timer > 0 ? timer.toString() : '',
                                  style: context.textThemes.caption?.copyWith(
                                    color: AppColors.primary,
                                  ));
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
