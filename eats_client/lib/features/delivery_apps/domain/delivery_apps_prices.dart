import 'package:freezed_annotation/freezed_annotation.dart';

part 'delivery_apps_prices.freezed.dart';
part 'delivery_apps_prices.g.dart';

@freezed
class DeliveryAppsPrices with _$DeliveryAppsPrices {
  const factory DeliveryAppsPrices({
    double? HungerStation,
    double? Shgardi,
    double? Jahez,
    double? ToYou,
  }) = _DeliveryAppsPrices;

  factory DeliveryAppsPrices.fromJson(Map<String, dynamic> json) =>
      _$DeliveryAppsPricesFromJson(json);
}
