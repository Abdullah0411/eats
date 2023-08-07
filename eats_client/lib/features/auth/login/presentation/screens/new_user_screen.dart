import 'package:flutter/material.dart';
import 'package:eats_client/features/auth/login/presentation/controllers/login_controller.dart';
import 'package:eats_client/widgets/custom_button/custom_button.dart';
import 'package:eats_client/widgets/custom_textfield/custom_textfield.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eats_client/constants/constants.dart';
import 'package:eats_client/constants/spacing_const.dart';
import 'package:eats_client/theme/extensions.dart';
import 'package:eats_client/localization/localization.dart';
import 'package:eats_core/services/easy_navigator.dart';
import 'package:eats_core/widgets/bottom_sheet/utils/sheet.dart';
import 'package:eats_core/widgets/custom_textfield/textfield_types.dart';

class NewUserScreen extends ConsumerStatefulWidget {
  const NewUserScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<NewUserScreen> createState() => _NewUserScreenState();
}

class _NewUserScreenState extends ConsumerState<NewUserScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(loginScreenControllerProvider.notifier);
    return Sheet(
      children: [
        SizedBox(
          height: 400.h,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 60.h,
                child: Column(
                  children: [
                    Text("Welcome",
                        style: context.textThemes.titleLarge
                            ?.copyWith(color: AppColors.primary)),
                    SpacingConst.vSpacing16,
                    Text("Tell us your name",
                        style: context.textThemes.bodyMedium),
                    SpacingConst.vSpacing20,
                    CustomTextField(
                      textFieldStyle: context.textThemes.bodySmall!,
                      type: TextFieldType.normal,
                      width: 320.w,
                      height: 40.h,
                      keyboardType: TextInputType.name,
                      controller: controller.nameController,
                      placeHolderText: "Your name",
                    ),
                    SpacingConst.vSpacing60,
                    CustomButton(
                      width: 317.w,
                      height: 50.h,
                      onPressed: () async {
                        controller.updateUserName();
                        EasyNavigator.popPage(context);
                      },
                      label: "Continue",
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
