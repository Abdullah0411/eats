import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eats_client/constants/colors_const.dart';
import 'package:eats_client/constants/spacing_const.dart';
import 'package:eats_client/features/meal/domain/quantity_meal/quantity_meal.dart';
import 'package:eats_client/widgets/rounded_squared_cached_network_image.dart';
import 'package:eats_core/constants/constants.dart';
import 'package:eats_core/widgets/bottom_sheet/utils/sheet.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.meal, required this.onPress});

  final QuantityMeal meal;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SpacingConst.vSpacing6,
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SpacingConst.spacing6.toDouble()),
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: SpacingConst.spacing6.toDouble(),
                horizontal: SpacingConst.spacing6.toDouble()),
            decoration: BoxDecoration(
              color: AppColors.white,
              boxShadow: [ShadowsConstants.blackShadow],
              borderRadius: smallBorderRadius,
            ),
            child: Row(
              children: [
                RoundedSquaredNetworkCachedImage(imgUrl: meal.imageUrl),
                SpacingConst.hSpacing16,
                ConstrainedBox(
                  constraints: BoxConstraints.tight(
                    Size(100.w, 40.h),
                  ),
                  child: Center(
                    child: Text(
                      meal.name,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ),
                Text(
                  'x${meal.quantity}',
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.start,
                ),
                const Spacer(),
                Text(
                  '${meal.price} SAR',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 16.sp),
                ),
                SpacingConst.hSpacing16,
                Consumer(
                  builder: (context, ref, _) => GestureDetector(
                    onTap: onPress,
                    child: const Icon(
                      Icons.remove_circle,
                      color: AppColors.negativeRed,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SpacingConst.vSpacing16
      ],
    )
        .animate()
        .fadeIn(duration: (150.ms))
        .blurXY(
          begin: 5,
          end: 0,
        )
        .slideY(
          begin: 10,
          curve: Curves.decelerate,
          duration: 150.ms,
        );
  }
}
