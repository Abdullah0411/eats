import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart' show QuerySnapshot;
import 'package:eats_client/features/restaurants/domain/restaurant/restaurant.dart';
import 'package:eats_core/services/firestore_services.dart';
import 'package:eats_core/utilis/logger/g_logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final restaurantsProvider = FutureProvider<List<Restaurant>>((ref) async {
  final restaurants = await RestaurantRepo.getAllRestaurant();
 if (restaurants.isNotEmpty) {
    return restaurants;
  } else {
    return [];
  }
});

class RestaurantRepo {
  static Future<void> getRestaurant(String name) async {
    try {
      QuerySnapshot<Map<String, dynamic>> restaurantData =
          (await FirestoreCollections.restaurants
              .where('name', isEqualTo: name)
              .get());
      List<Map<String, dynamic>> search =
          restaurantData.docs.map((e) => e.data()).toList();
    } catch (e) {
      e.logException();
    }
  }

  static Future<List<Restaurant>> getAllRestaurant() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> restaurantsData =
          (await FirestoreCollections.restaurants.get());
      if (restaurantsData.docs.isNotEmpty) {
        final restaurants = restaurantsData.docs
            .map((restaurant) => Restaurant.fromJson(restaurant.data()))
            .toList();
        return restaurants;
      } else {
        return [];
      }
    } catch (e) {
      e.logException();

      return [];
    }
  }
}
