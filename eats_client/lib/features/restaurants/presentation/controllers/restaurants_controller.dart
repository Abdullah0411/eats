import 'dart:math';
import 'package:eats_client/features/location/providers/current_location_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eats_client/features/menu/presntation/screens/menu_screen.dart';
import 'package:eats_client/features/restaurants/providers/restaurants_providers.dart';
import 'package:eats_client/features/restaurants/domain/restaurant/restaurant.dart';
import 'package:eats_core/services/easy_navigator.dart';

class RestaurantController {
  RestaurantController({required this.ref});
  late BuildContext context;
  Ref ref;

  void onRestaurantClick(Restaurant restaurant) {
    EasyNavigator.openPage(
      context: context,
      page: MenuScreen(
        restaurant: restaurant,
      ),
      isCupertinoStyle: false,
      isAnimated: true,
    );
    ref
        .read(RestaurantProviders.selectedRestaurantProvider.notifier)
        .update((state) => restaurant);
  }

  double haversineDistance(double lat1, double lon1, double lat2, double lon2) {
    const double R = 6371.0; // Radius of the Earth in km
    double dLat = _toRadians(lat2 - lat1);
    double dLon = _toRadians(lon2 - lon1);
    lat1 = _toRadians(lat1);
    lat2 = _toRadians(lat2);

    double a = sin(dLat / 2) * sin(dLat / 2) +
        sin(dLon / 2) * sin(dLon / 2) * cos(lat1) * cos(lat2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return R * c;
  }

  double _toRadians(double degree) {
    return degree * pi / 180;
  }

  Future<List<Restaurant>> sortRestaurantsByDistance(
      List<Restaurant> restaurants) async {
    final userLocation =
        await ref.read(LocationProviders.currentLocationProvider.future);
    List<Restaurant> sortedRestaurants =[...restaurants]..sort((a, b) {
      double distanceA = haversineDistance(userLocation['latitude'] ?? 0,
          userLocation['longitude'] ?? 0, a.latitude, a.longitude);
      double distanceB = haversineDistance(userLocation['latitude'] ?? 0,
          userLocation['longitude'] ?? 0, b.latitude, b.longitude);
      return distanceA.compareTo(distanceB);
    });
    return sortedRestaurants;
  }
}
