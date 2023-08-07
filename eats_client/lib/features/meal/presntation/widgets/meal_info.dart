import 'package:eats_client/constants/constants.dart';
import 'package:eats_client/constants/spacing_const.dart';
import 'package:eats_client/features/meal/domain/meal/meal.dart';
import 'package:eats_client/features/menu/presntation/widgets/lowest_price.dart';
import 'package:eats_client/features/menu/presntation/widgets/quantity_widget.dart';
import 'package:eats_client/features/menu/providers/menu_providers.dart';
import 'package:eats_client/widgets/custom_button/custom_button.dart';
import 'package:eats_client/widgets/custom_button/enums/button_size.dart';
import 'package:eats_client/widgets/custom_button/enums/button_style.dart';
import 'package:eats_client/widgets/rounded_squared_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MealInfo extends StatelessWidget {
  const MealInfo({super.key, required this.meal});
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: SpacingConst.spacing16.toDouble()),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 250.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SpacingConst.vSpacing16,
            Row(
              children: [
                RoundedSquaredNetworkCachedImage(imgUrl: meal.image),
                SpacingConst.hSpacing8,
                ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 160.w,
                    ),
                    child: Text(meal.name,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontSize: 14.sp))),
                const Spacer(),
                LowestPrice(
                  price: meal.price,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            SpacingConst.vSpacing16,
            Expanded(
              child: Text(
                meal.description ?? '',
                maxLines: 4,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 15, color: AppColors.darkGrey.withOpacity(0.7)),
              ),
            ),
            const Spacer(),
            Row(
              children: [
                const QuantityWidget(),
                const Spacer(),
                Consumer(
                  builder: (context, ref, _) => CustomButton(
                    style: CustomButtonStyle.primary,
                    onPressed: () {
                      ref
                          .read(MenuProviders.menuScreenControllerProvider)
                          .addMealToCart(meal);
                    },
                    label: 'Add to cart',
                    size: ButtonSize.small,
                  ),
                )
              ],
            ),
            SpacingConst.vSpacing16,
          ],
        ),
      ),
    );
  }
}
