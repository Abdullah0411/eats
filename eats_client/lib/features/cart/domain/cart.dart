import 'package:eats_client/features/restaurants/domain/restaurant/restaurant.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:eats_client/features/meal/domain/meal/meal.dart';

part 'cart.freezed.dart';
part 'cart.g.dart';

@freezed

class Cart with _$Cart {
  const factory Cart({
    Restaurant? restaurant,
    required List<Meal> orderedMeals,
    double? totalPrice,
  }) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}
