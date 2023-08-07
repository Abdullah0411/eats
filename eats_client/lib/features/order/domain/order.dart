import 'package:eats_client/features/cart/domain/cart.dart';
import 'package:eats_client/utils/enums/delivery_app.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:eats_core/enums/order_status.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
class Order with _$Order {
  const factory Order({
    required String id,
    required String uid,
    required String? restaurantId,
    Cart? cart,
    required DateTime orderDate,
    String? note,
    required OrderStatus status,
    required DeliveryApp deliveryApp,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}
