import 'package:freezed_annotation/freezed_annotation.dart';

part 'meal_price.freezed.dart';
part 'meal_price.g.dart';

@freezed
class MealPrice with _$MealPrice {
  const factory MealPrice({
    double? HungerStation,
    double? Shgardi,
    double? Jahez,
    double? ToYou,
  }) = _MealPrice;

  factory MealPrice.fromJson(Map<String, dynamic> json) =>
      _$MealPriceFromJson(json);
}
