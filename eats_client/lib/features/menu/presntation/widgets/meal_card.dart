import 'package:flutter/material.dart';
import 'package:eats_client/features/meal/domain/meal/meal.dart';
import 'package:eats_client/features/meal/presntation/widgets/meal_info.dart';
import 'package:eats_client/features/menu/presntation/widgets/lowest_price.dart';
import 'package:eats_client/widgets/alert_box.dart';
import 'package:eats_client/widgets/rounded_squared_cached_network_image.dart';
import 'package:eats_client/constants/colors_const.dart';
import 'package:eats_client/constants/spacing_const.dart';

class MealCard extends StatelessWidget {
  const MealCard({Key? key, required this.meal}) : super(key: key);
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AlertDialogBox.showBoxDialog(
          child: MealInfo(
            meal: meal,
          ),
          contentPadding: EdgeInsets.zero,
        );
      },
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SpacingConst.spacing16.toDouble()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  meal.name,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 20),
                ),
                SpacingConst.vSpacing6,
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        meal.description ?? '',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 15,
                            color: AppColors.darkGrey.withOpacity(0.7)),
                        maxLines: 5,
                      ),
                    ),
                    SpacingConst.hSpacing6,
                    RoundedSquaredNetworkCachedImage(
                      imgUrl: meal.image,
                    )
                  ],
                ),
                LowestPrice(
                  price: meal.price,
                )
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Divider(
              color: AppColors.darkGrey.withOpacity(0.1),
              thickness: 1.5,
            ),
          )
        ],
      ),
    );
  }
}
