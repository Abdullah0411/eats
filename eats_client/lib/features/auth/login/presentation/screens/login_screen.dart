import 'package:eats_client/features/auth/login/presentation/widgets/custom_clip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eats_client/constants/constants.dart';
import 'package:eats_client/constants/spacing_const.dart';
import 'package:eats_client/features/auth/login/domain/login_providers.dart';
import 'package:eats_client/features/auth/login/presentation/controllers/login_controller.dart';
import 'package:eats_client/widgets/custom_button/custom_button.dart';
import 'package:eats_client/widgets/custom_phone_text_field.dart';
import 'package:eats_client/widgets/locale_positioned.dart';
import 'package:eats_client/theme/extensions.dart';
import 'package:eats_client/localization/localization.dart';
import 'package:eats_core/widgets/bottom_sheet/utils/sheet.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(loginScreenControllerProvider.notifier);
    controller.context = context;
    return Sheet(
      scroll: false,
      footer: [
        CustomButton(
          width: 317.w,
          height: 50.h,
          onPressed: controller.onContinuePressed,
          label: 'Continue',
        ),
      ],
      children: [
        SizedBox(
          height: 330.h,
          child: Stack(
            children: [
              ClipPath(
                clipper: CustomClip(),
                child: Container(
                  height: 200.h,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.topRight,
                          colors: [
                        AppColors.lightGreen,
                        AppColors.darkGreenTerquise
                      ])),
                ),
              ),
              LocalePositioned(
                localeSide: 100.w,
                top: 212.h,
                child: Text("Welcome",
                    style: context.textThemes.titleLarge
                        ?.copyWith(color: AppColors.primary)),
              ),
              LocalePositioned(
                localeSide: 160.w,
                top: 245.h,
                child: Text("To Eats",
                    style: context.textThemes.titleLarge?.copyWith(
                      color: AppColors.primary,
                    )),
              ),
            ],
          ),
        ),
        Text("Let's sign you in", style: context.textThemes.bodyMedium),
        SpacingConst.vSpacing20,
        Form(
          key: controller.phoneNumberFormKey,
          child: CustomPhoneTextField(
            onChange: ref.watch(loginInfoProvider.notifier).updatePhoneNumber,
            validator: controller.phoneNumberValidator,
          ),
        ),
      ],
    );
  }
}
