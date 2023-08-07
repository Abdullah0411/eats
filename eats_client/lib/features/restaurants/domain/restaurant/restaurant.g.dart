// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Restaurant _$$_RestaurantFromJson(Map<String, dynamic> json) =>
    _$_Restaurant(
      id: json['id'] as String,
      name: json['name'] as String,
      logo: json['logo'] as String,
      deliveryAppsPrices: DeliveryAppsPrices.fromJson(
          json['deliveryAppsPrices'] as Map<String, dynamic>),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      deliveryAppsList: (json['deliveryAppsList'] as List<dynamic>)
          .map((e) => $enumDecode(_$DeliveryAppEnumMap, e))
          .toList(),
      longitude: (json['longitude'] as num).toDouble(),
      latitude: (json['latitude'] as num).toDouble(),
      deliveryAppRestaurantId: json['deliveryAppRestaurantId'] as String,
      rating: (json['rating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_RestaurantToJson(_$_Restaurant instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
      'deliveryAppsPrices': instance.deliveryAppsPrices.toJson(),
      'categories': instance.categories,
      'deliveryAppsList': instance.deliveryAppsList
          .map((e) => _$DeliveryAppEnumMap[e]!)
          .toList(),
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'deliveryAppRestaurantId': instance.deliveryAppRestaurantId,
      'rating': instance.rating,
    };

const _$DeliveryAppEnumMap = {
  DeliveryApp.jahez: 'Jahez',
  DeliveryApp.hungerStation: 'HungerStation',
  DeliveryApp.toYou: 'ToYou',
  DeliveryApp.shgardi: 'Shgardi',
};
