import 'package:eats_client/constants/constants.dart';
import 'package:eats_client/constants/spacing_const.dart';
import 'package:eats_client/features/home/presentation/controllers/home_controller.dart';
import 'package:eats_client/features/order/order_sent/presentation/widgets/rounded_image.dart';
import 'package:eats_client/widgets/custom_button/custom_button.dart';
import 'package:eats_client/widgets/custom_button/enums/button_size.dart';
import 'package:eats_client/widgets/custom_button/enums/button_style.dart';
import 'package:eats_core/widgets/bottom_sheet/utils/sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocationAlert extends StatelessWidget {
  const LocationAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: SpacingConst.spacing6.toDouble()),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 295.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SpacingConst.vSpacing16,
            const RoundedImage(size: 150, imgUrl: AssetsConst.noAddress)
                .animate()
                .fadeIn(delay: 140.ms)
                .blurXY(
                  begin: 20,
                  end: 0,
                )
                .scaleXY(
                  begin: 0.3,
                  duration: 1500.ms,
                  curve: Sprung.overDamped,
                )
                .slide(
                  begin: Offset(-1.w, -1.h),
                  duration: 1500.ms,
                  curve: Sprung.criticallyDamped,
                )
                .animate(
                  onPlay: (controller) => controller.loop(),
                )
                .slideX(
                    begin: 0.1, duration: 2.2.seconds, curve: Curves.easeInOut)
                .then()
                .slideX(
                    end: 0.1, duration: 2.8.seconds, curve: Curves.easeInOut),
            Text(
              'Please Select a location',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SpacingConst.vSpacing16,
            Consumer(
              builder: (context, ref, _) => CustomButton(
                onPressed: ref.read(homeScreenControllerProvider).pop,
                label: 'Done',
                size: ButtonSize.medium,
                style: CustomButtonStyle.primary,
              ),
            ),
            SpacingConst.vSpacing16,
          ],
        ),
      ),
    );
  }
}
