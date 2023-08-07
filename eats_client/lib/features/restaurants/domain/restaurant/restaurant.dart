import 'package:eats_client/features/delivery_apps/domain/delivery_apps_prices.dart';
import 'package:eats_client/utils/enums/delivery_app.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurant.freezed.dart';
part 'restaurant.g.dart';

@freezed

class Restaurant with _$Restaurant {
  const factory Restaurant({
    required String id,
    required String name,
    required String logo,
    required DeliveryAppsPrices deliveryAppsPrices,
    required List<String> categories,
    required List<DeliveryApp> deliveryAppsList,
    required double longitude,
    required double latitude,
    required String deliveryAppRestaurantId,
    double? rating,
  }) = _Restaurant;

  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);
}
