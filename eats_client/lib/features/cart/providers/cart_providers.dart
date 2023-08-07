import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eats_client/features/restaurants/providers/restaurants_providers.dart';
import 'package:eats_client/features/cart/domain/cart.dart';
import 'package:eats_client/features/cart/presntation/controller/cart_controller.dart';

class CartProviders {
  static final cartProvider = StateProvider.autoDispose<Cart>((ref) {
    return Cart(
        orderedMeals: [],
        restaurant: ref.read(RestaurantProviders.selectedRestaurantProvider));
  });

  static final cartScreenControllerProvider =
      StateProvider<CartController>((ref) {
    return CartController(ref: ref);
  });
}
