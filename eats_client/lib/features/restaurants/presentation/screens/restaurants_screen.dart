import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eats_client/features/restaurants/presentation/widgets/restaurant_loading.dart';
import 'package:eats_client/features/restaurants/providers/restaurants_providers.dart';
import 'package:eats_client/features/home/presentation/controllers/home_controller.dart';
import 'package:eats_client/constants/spacing_const.dart';
import 'package:eats_client/features/restaurants/presentation/widgets/restaurant_container.dart';
import 'package:eats_core/widgets/bottom_sheet/utils/sheet.dart';

class RestaurantsScreen extends ConsumerWidget {
  const RestaurantsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(RestaurantProviders.restaurantScreenControllerProvider);
    final restaurants = ref.watch(selectedCategoryProvider);
    controller.context = context;
    return Sheet(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        title: Text(
          'Category',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      children: [
        SpacingConst.vSpacing8,
        restaurants == null
            ? Flexible(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: 4,
                  itemBuilder: ((context, index) {
                    return Column(
                      children: [
                        const RestaurantLoading()
                            .animate()
                            .fadeIn(
                              duration: 150.ms,
                            )
                            .scaleY(
                              begin: 0.3,
                              duration: 250.ms,
                              curve: Curves.easeIn,
                            )
                            .slide(
                              begin: Offset(0.w, 1.h),
                              duration: 250.ms,
                              curve: Curves.easeIn,
                            ),
                        SpacingConst.vSpacing16,
                      ],
                    );
                  }),
                ),
              )
            : Flexible(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: restaurants.length,
                  itemBuilder: ((context, index) {
                    return Column(
                      children: [
                        RestaurantsContainer(
                          restaurant: restaurants[index]!,
                          onPress: (() {
                            ref
                                .read(RestaurantProviders.restaurantScreenControllerProvider)
                                .onRestaurantClick(restaurants[index]!);
                          }),
                        ),
                        SpacingConst.vSpacing16,
                      ],
                    );
                  }),
                ),
              ),
        SpacingConst.vSpacing120
      ],
    );
  }
}
