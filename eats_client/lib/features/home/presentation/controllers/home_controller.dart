import 'dart:math';

import 'package:eats_client/features/restaurants/providers/restaurants_providers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eats_client/features/menu/presntation/screens/menu_screen.dart';
import 'package:eats_client/features/restaurants/domain/restaurant/restaurant.dart';
import 'package:eats_client/features/restaurants/repos/restaurants_repo.dart';
import 'package:eats_core/services/easy_navigator.dart';
import 'package:eats_core/utilis/logger/extensions.dart';
import 'package:eats_client/features/location/domain/location.dart';
import 'package:eats_client/features/location/repos/location_repo.dart';
import 'package:eats_client/features/restaurants/presentation/screens/restaurants_screen.dart';

final selectedLocationProvider = StateProvider<Location?>((ref) {
  return null;
});

final searchedRestaurantsProvider = StateProvider<List<Restaurant?>?>((ref) {
  return null;
});

final selectedCategoryProvider = StateProvider<List<Restaurant?>?>((ref) {
  return null;
});

final homeScreenControllerProvider =
    StateProvider.autoDispose<HomeController>((ref) {
  return HomeController(ref: ref);
});

class HomeController {
  HomeController({required this.ref});
  TextEditingController searchedRestaurant = TextEditingController();
  late BuildContext context;
  Ref ref;

  void selectLocation(Location choice) {
    ref.read(selectedLocationProvider.notifier).update((state) => choice);
    LocationRepo.setDefault(choice);
  }

  void clearSearchField() {
    searchedRestaurant.clear();
    ref.read(searchedRestaurantsProvider.notifier).update((state) => null);
  }

  void onCategoryClick(String category) async {
    try {
      final restaurants = await ref.watch(restaurantsProvider.future);
      final filteredRestaurants = restaurants.where((restaurant) {
        return restaurant.categories
            .where((element) => element.toLowerCase() == category.toLowerCase())
            .toList()
            .isNotEmpty;
      }).toList();

      final r = restaurants
          .getRange(Random().nextInt(25), Random().nextInt(25) + 25)
          .toList();
      ref.read(selectedCategoryProvider.notifier).update((state) => r);
    } catch (e) {
      e.logException();
    }
    EasyNavigator.openPage(
      isCupertinoStyle: false,
      context: context,
      page: const RestaurantsScreen(),
      isAnimated: true,
    );
  }

  void onAllRestaurantsClick() async {
    try {
      EasyNavigator.openPage(
        isCupertinoStyle: false,
        context: context,
        page: const RestaurantsScreen(),
        isAnimated: true,
      );
      final restaurants = await ref.watch(restaurantsProvider.future);
      final sortedRestaurants = await ref
          .read(RestaurantProviders.restaurantScreenControllerProvider)
          .sortRestaurantsByDistance(restaurants);
      ref
          .read(selectedCategoryProvider.notifier)
          .update((state) => restaurants);
    } catch (e) {
      e.logException();
    }
  }

  void searchForRestauarnt(String restuarantName) async {
    if (searchedRestaurant.text.isNotEmpty) {
      final restaurants = await ref.watch(restaurantsProvider.future);
      List<Restaurant?> searchedRestaurant = restaurants.where((restaurant) {
        return (restaurant.name)
            .toLowerCase()
            .contains(restuarantName.toLowerCase());
      }).toList();
      final sortedRestaurants = await ref
          .read(RestaurantProviders.restaurantScreenControllerProvider)
          .sortRestaurantsByDistance(searchedRestaurant as List<Restaurant>);
      ref
          .read(searchedRestaurantsProvider.notifier)
          .update((state) => sortedRestaurants);
    } else {
      ref.read(searchedRestaurantsProvider.notifier).update((state) => null);
    }
  }

  void onRestaurantClick(Restaurant restaurant) {
    EasyNavigator.openPage(
      context: context,
      page: MenuScreen(restaurant: restaurant),
      isCupertinoStyle: false,
      isAnimated: true,
    );
  }

  void pop() {
    EasyNavigator.popPage(context);
  }
}
