import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:eats_client/widgets/custom_button/enums/button_style.dart';
import 'package:eats_core/widgets/custom_dialog.dart';
import 'package:eats_client/features/user/providers/eats_user_provider.dart';
import 'package:eats_core/widgets/loading_container.dart';
import 'package:eats_client/constants/colors_const.dart';
import 'package:eats_client/widgets/custom_button/custom_button.dart';
import 'package:eats_client/widgets/custom_button/enums/button_size.dart';
import 'package:eats_client/features/user/presentation/controllers/profile_cntroller.dart';
import 'package:eats_client/theme/extensions.dart';
import 'package:eats_client/widgets/custom_textfield/custom_textfield.dart';
import 'package:eats_client/constants/spacing_const.dart';
import 'package:eats_core/widgets/bottom_sheet/utils/sheet.dart';
import 'package:eats_core/constants/constants.dart';
import 'package:eats_core/widgets/custom_textfield/textfield_types.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(profileScreenControllerProvider);
    final eatsUser = ref.watch(eatsUserProvider);
    controller.context = context;
    return Sheet(
      scroll: false,
      title: 'Profile',
      children: [
        SpacingConst.vSpacing60,
        Container(
          decoration: const BoxDecoration(
            borderRadius: mediumBorderRadius,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  blurRadius: 20,
                  offset: Offset(-15, -15),
                  color: Colors.white),
              BoxShadow(
                  blurRadius: 20,
                  offset: Offset(15, 15),
                  color: Color(0xffa7a9af)),
            ],
          ),
          child: SizedBox(
            height: 475.h,
            width: 355.w,
            child: eatsUser.when(
              data: ((user) {
                return Column(
                  children: [
                    SpacingConst.vSpacing20,
                    RichText(
                      text: TextSpan(
                        text: 'Hi',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(
                                fontSize: 34,
                                color: AppColors.darkBlueTerquise,
                                fontWeight: FontWeight.w400),
                        children: [
                          TextSpan(
                            text: ' ${user!.name}',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                  fontSize: 34,
                                ),
                          )
                        ],
                      ),
                    ),
                    SpacingConst.vSpacing20,
                    CustomTextField(
                      textFieldStyle: context.textThemes.bodySmall!,
                      keyboardType: TextInputType.text,
                      initialValue: user.name,
                      placeHolderText: 'Name',
                      type: TextFieldType.active,
                      controller: controller.nameController,
                      width: 300.w,
                      height: 40.h,
                    ),
                    SpacingConst.vSpacing20,
                    CustomTextField(
                      validator: controller.emailValidator,
                      textFieldStyle: context.textThemes.bodySmall!,
                      keyboardType: TextInputType.emailAddress,
                      placeHolderText: 'Email Address',
                      initialValue: user.email,
                      type: TextFieldType.active,
                      controller: controller.emailController,
                      width: 300.w,
                      height: 40.h,
                    ),
                    SpacingConst.vSpacing20,
                    Container(
                      width: 300.w,
                      height: 40.h,
                      padding: EdgeInsets.symmetric(
                          horizontal: SpacingConst.spacing16.toDouble(),
                          vertical: SpacingConst.spacing6.toDouble()),
                      decoration: const BoxDecoration(
                        borderRadius: smallBorderRadius,
                        color: AppColors.lightGrey,
                      ),
                      child: Text(
                        user.phoneNumber,
                        style: context.textThemes.bodyMedium?.regular
                            .copyWith(fontSize: 18),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SpacingConst.vSpacing40,
                    CustomButton(
                      color: AppColors.darkGreenTerquise,
                      label: 'Update',
                      onPressed: controller.updateProfile,
                      size: ButtonSize.large,
                    ),
                    SpacingConst.vSpacing16,
                    SpacingConst.vSpacing16,
                    CustomButton(
                      style: CustomButtonStyle.thirdly,
                      label: 'Log out',
                      onPressed: () async {
                        await CustomDialog(
                          title: 'Log out',
                          content: [
                            Text(
                              'Are you sure you want to logout?',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            SpacingConst.hSpacing8,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            AppColors.negativeRed),
                                  ),
                                  onPressed: controller.signOut,
                                  child: Text(
                                    'Log out',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(color: Colors.white),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            AppColors.white),
                                  ),
                                  onPressed: controller.popFromDialog,
                                  child: Text(
                                    'Cancel',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(color: AppColors.darkGreen),
                                  ),
                                )
                              ],
                            )
                          ],
                        ).showCustomDialog(context);
                      },
                      size: ButtonSize.large,
                    ),
                  ],
                );
              }),
              loading: (() {
                return Column(
                  children: [
                    SpacingConst.vSpacing20,
                    LoadingContainer(
                      width: 300.w,
                      height: 40.h,
                      borderRadius: smallBorderRadius,
                    ),
                    SpacingConst.vSpacing20,
                    LoadingContainer(
                      width: 300.w,
                      height: 40.h,
                      borderRadius: smallBorderRadius,
                    ),
                    SpacingConst.vSpacing20,
                    LoadingContainer(
                      width: 300.w,
                      height: 40.h,
                      borderRadius: smallBorderRadius,
                    ),
                    SpacingConst.vSpacing20,
                    LoadingContainer(
                      width: 300.w,
                      height: 35.h,
                      borderRadius: smallBorderRadius,
                    ),
                    SpacingConst.vSpacing60,
                    LoadingContainer(
                      width: 317.w,
                      height: 50.h,
                      borderRadius: smallBorderRadius,
                    ),
                    SpacingConst.vSpacing40,
                    LoadingContainer(
                      width: 317.w,
                      height: 50.h,
                      borderRadius: smallBorderRadius,
                    )
                  ],
                );
              }),
              error: ((error, stackTrace) {
                return Center(
                  child: Text(
                    'Somthing went wrong',
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 40, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                );
              }),
            ),
          ),
        )
            .animate()
            .fadeIn(duration: 140.ms)
            .scaleXY(
              begin: 0.3,
              duration: 1500.ms,
              curve: Sprung.overDamped,
            )
            .slide(
              begin: Offset(0.w, 1.h),
              duration: 1500.ms,
              curve: Sprung.criticallyDamped,
            ),
      ],
    );
  }
}
