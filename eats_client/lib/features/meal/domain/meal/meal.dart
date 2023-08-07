import 'package:eats_client/features/meal/domain/meal_price/meal_price.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'meal.freezed.dart';
part 'meal.g.dart';

@freezed
class Meal with _$Meal {
  const factory Meal({
    required String id,
    required String name,
    required MealPrice price,
    required String image,
    String? category,
    required bool isAvailable,
    String? description,
    String? skuNumber,
  }) = _Meal;

  factory Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);
}
