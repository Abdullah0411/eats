// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Order _$$_OrderFromJson(Map<String, dynamic> json) => _$_Order(
      id: json['id'] as String,
      uid: json['uid'] as String,
      restaurantId: json['restaurantId'] as String?,
      cart: json['cart'] == null
          ? null
          : Cart.fromJson(json['cart'] as Map<String, dynamic>),
      orderDate: DateTime.parse(json['orderDate'] as String),
      note: json['note'] as String?,
      status: $enumDecode(_$OrderStatusEnumMap, json['status']),
      deliveryApp: $enumDecode(_$DeliveryAppEnumMap, json['deliveryApp']),
    );

Map<String, dynamic> _$$_OrderToJson(_$_Order instance) => <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'restaurantId': instance.restaurantId,
      'cart': instance.cart?.toJson(),
      'orderDate': instance.orderDate.toIso8601String(),
      'note': instance.note,
      'status': _$OrderStatusEnumMap[instance.status]!,
      'deliveryApp': _$DeliveryAppEnumMap[instance.deliveryApp]!,
    };

const _$OrderStatusEnumMap = {
  OrderStatus.underProcessing: 'under_processing',
  OrderStatus.accepted: 'accepted',
  OrderStatus.completed: 'completed',
  OrderStatus.rejected: 'rejected',
  OrderStatus.cancelled: 'cancelled',
  OrderStatus.deleted: 'deleted',
};

const _$DeliveryAppEnumMap = {
  DeliveryApp.jahez: 'Jahez',
  DeliveryApp.hungerStation: 'HungerStation',
  DeliveryApp.toYou: 'ToYou',
  DeliveryApp.shgardi: 'Shgardi',
};
