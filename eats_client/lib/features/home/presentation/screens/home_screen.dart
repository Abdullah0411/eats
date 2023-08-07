import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eats_client/features/home/presentation/widgets/location_alert.dart';
import 'package:eats_client/widgets/alert_box.dart';
import 'package:eats_client/features/location/providers/current_location_provider.dart';
import 'package:eats_client/features/home/presentation/widgets/not_found.dart';
import 'package:eats_client/features/restaurants/presentation/widgets/restaurant_container.dart';
import 'package:eats_client/features/home/presentation/controllers/home_controller.dart';
import 'package:eats_client/widgets/loading_widget.dart';
import 'package:eats_client/features/home/presentation/widgets/categories_widget.dart';
import 'package:eats_client/constants/constants.dart';
import 'package:eats_client/features/location/presentation/widgets/location_dropdown.dart';
import 'package:eats_client/features/home/presentation/widgets/custom_search_field.dart';
import 'package:eats_client/features/home/presentation/widgets/category_container.dart';
import 'package:eats_client/constants/spacing_const.dart';
import 'package:eats_core/widgets/bottom_sheet/utils/sheet.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({Key? key}) : super(key: key);

  final List<String> categories = [
    'Fast food',
    'Breakfast',
    'Coffee',
    'Seafood'
  ];
  final List<String> images = [
    AssetsConst.fastFood,
    AssetsConst.breakfast,
    AssetsConst.cafe,
    AssetsConst.seaFood
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(homeScreenControllerProvider);
    final selectedLocation = ref.watch(selectedLocationProvider);
    final userLocations = ref.watch(LocationProviders.locationChoicesProvider);
    final restaurants = ref.watch(searchedRestaurantsProvider);
    controller.context = context;
    return Sheet(
      scroll: false,
      appBar: AppBar(
          title: (selectedLocation != null)
              ? Column(
                  children: [
                    Text(
                      'Delivery To',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: AppColors.darkGreen, fontSize: 23),
                    ),
                    Text(
                      selectedLocation.title,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 18),
                    ),
                  ],
                )
              : Text('Welcome',
                  style: Theme.of(context).textTheme.titleMedium!),
          actions: [
            userLocations.when(
                data: ((locations) {
                  return LocationDropDown(
                      text: locations.isEmpty ? 'Add location' : 'Change',
                      onChange: controller.selectLocation);
                }),
                error: (Object error, StackTrace stackTrace) {
                  return const SizedBox.shrink();
                },
                loading: () => const LoadingWidget())
          ]),
      children: [
        SpacingConst.vSpacing6,
        CustomSearchField(
          onPressed: controller.clearSearchField,
          controller: controller.searchedRestaurant,
          onChange: controller.searchForRestauarnt,
        ),
        SpacingConst.vSpacing20,
        restaurants == null
            ? Expanded(
                child: Column(
                  children: [
                    CategoriesWidget(
                      label: 'All Restaurants',
                      onPressed: () {
                        if (selectedLocation != null) {
                          controller.onAllRestaurantsClick();
                        } else {
                          AlertDialogBox.showBoxDialog(
                            child: const LocationAlert(),
                            contentPadding: EdgeInsets.zero,
                          );
                        }
                      },
                    )
                        .animate()
                        .fadeIn(
                          duration: 240.ms,
                          curve: Sprung.criticallyDamped,
                        )
                        .scaleXY(
                          curve: Sprung.criticallyDamped,
                          begin: 0.3,
                          duration: 1000.ms,
                        )
                        .slide(
                          curve: Sprung.criticallyDamped,
                          begin: Offset(0.w, 1.h),
                        ),
                    SpacingConst.vSpacing20,
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: SpacingConst.spacing8.toDouble()),
                        child: GridView.builder(
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 4,
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio: 1.11,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20),
                          itemBuilder: ((context, index) {
                            return CategoryContainer(
                              onPressed: () {
                                if (selectedLocation != null) {
                                  controller.onCategoryClick(categories[index]);
                                } else {
                                  AlertDialogBox.showBoxDialog(
                                    child: const LocationAlert(),
                                    contentPadding: EdgeInsets.zero,
                                  );
                                }
                              },
                              label: categories[index],
                              imgUrl: images[index],
                            )
                                .animate()
                                .fadeIn(
                                  duration: 240.ms,
                                  curve: Sprung.criticallyDamped,
                                )
                                .scaleXY(
                                  curve: Sprung.criticallyDamped,
                                  begin: 0.3,
                                  duration: 1500.ms,
                                )
                                .slide(
                                  curve: Sprung.criticallyDamped,
                                  begin: Offset(0.w, 1.h),
                                );
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : restaurants.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemBuilder: ((context, index) {
                        return Column(
                          children: [
                            RestaurantsContainer(
                              restaurant: restaurants[index]!,
                              onPress: () {
                                if (selectedLocation != null) {
                                  controller
                                      .onRestaurantClick(restaurants[index]!);
                                } else {
                                  AlertDialogBox.showBoxDialog(
                                    child: const LocationAlert(),
                                    contentPadding: EdgeInsets.zero,
                                  );
                                }
                              },
                            ).animate().fadeIn(duration: 140.ms).slideY(
                                curve: Curves.easeInOut,
                                begin: 1,
                                duration: 140.ms),
                            SpacingConst.vSpacing16,
                          ],
                        );
                      }),
                      itemCount: restaurants.length,
                    ),
                  )
                : const NotFound()
      ],
    );
  }
}
