import 'package:eats_client/constants/shadow_const.dart';
import 'package:eats_core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:eats_client/features/restaurants/domain/restaurant/restaurant.dart';
import 'package:eats_client/features/restaurants/presentation/widgets/food_type.dart';
import 'package:eats_client/features/restaurants/presentation/widgets/restaurant_info.dart';
import 'package:eats_client/constants/colors_const.dart';
import 'package:eats_client/constants/spacing_const.dart';
import 'package:eats_client/features/restaurants/presentation/widgets/image_card.dart';

class RestaurantsContainer extends StatelessWidget {
  const RestaurantsContainer(
      {Key? key, required this.restaurant, required this.onPress})
      : super(key: key);

  final Function() onPress;
  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: SpacingConst.spacing16.toDouble()),
        child: AnimatedContainer(
          curve: Curves.linear,
          duration: const Duration(milliseconds: 100),
          decoration: const BoxDecoration(
            borderRadius: smallBorderRadius,
            color: Colors.white,
            boxShadow: [
              ShadowConst.outerLightShadow,
              ShadowConst.outerDarkShadow,
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageCard(imgUrl: restaurant.logo),
              SpacingConst.vSpacing6,
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SpacingConst.spacing6.toDouble()),
                child: Text(
                  restaurant.name,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: AppColors.darkGreen),
                ),
              ),
              FoodType(
                categories: restaurant.categories,
              ),
              RestaurantInfo(
                rating: restaurant.rating,
                deliveryTime: '25 Min',
                deliveryApps: restaurant.deliveryAppsList,
              ),
              SpacingConst.vSpacing6
            ],
          ),
        ),
      ),
    );
  }
}
