import 'package:eats_client/constants/assets_const.dart';
import 'package:eats_client/constants/spacing_const.dart';
import 'package:eats_client/features/delivery_apps/providers/delivery_apps_providers.dart';
import 'package:eats_client/features/order/order_sent/presentation/widgets/rounded_image.dart';
import 'package:eats_client/widgets/custom_button/custom_button.dart';
import 'package:eats_client/widgets/custom_button/enums/button_size.dart';
import 'package:eats_client/widgets/custom_button/enums/button_style.dart';
import 'package:flutter/material.dart';
import 'package:eats_core/widgets/bottom_sheet/utils/sheet.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderSent extends StatelessWidget {
  const OrderSent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: SpacingConst.spacing16.toDouble()),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 295.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SpacingConst.vSpacing16,
            const RoundedImage(
              size: 120,
              imgUrl: AssetsConst.delivreyGuyNoBackgoround,
            )
                .animate()
                .fadeIn(delay: 140.ms)
                .blurXY(
                  begin: 10,
                  end: 0,
                )
                .scaleXY(
                  begin: 0.3,
                  duration: 1500.ms,
                  curve: Sprung.overDamped,
                )
                .animate(
                  onPlay: (controller) => controller.loop(),
                )
                .slideX(
                  end: 0.5,
                  duration: 2.5.seconds,
                  curve: Curves.easeInOut,
                )
                .then()
                .slideX(
                  end: -0.5,
                  duration: 2.5.seconds,
                  curve: Curves.easeInOut,
                ),
            SpacingConst.vSpacing16,
            Text(
              'Your order has been sent successfully',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              'Thank you for using Eats! ♥️',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SpacingConst.vSpacing16,
            Consumer(
              builder: (context, ref, child) => CustomButton(
                onPressed: ref
                    .read(DeliveryAppsProviders.deliveryAppsControllerProvider)
                    .popToFirst,
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
