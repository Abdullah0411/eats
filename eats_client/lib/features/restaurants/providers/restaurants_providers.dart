import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eats_client/features/restaurants/domain/restaurant/restaurant.dart';
import 'package:eats_client/features/restaurants/presentation/controllers/restaurants_controller.dart';

class RestaurantProviders {
  static final restaurantScreenControllerProvider =
      StateProvider.autoDispose<RestaurantController>((ref) {
    return RestaurantController(ref: ref);
  });

  static final selectedRestaurantProvider = StateProvider<Restaurant?>((ref) {
    return null;
  });
}
