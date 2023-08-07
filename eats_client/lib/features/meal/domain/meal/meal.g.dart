// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Meal _$$_MealFromJson(Map<String, dynamic> json) => _$_Meal(
      id: json['id'] as String,
      name: json['name'] as String,
      price: MealPrice.fromJson(json['price'] as Map<String, dynamic>),
      image: json['image'] as String,
      category: json['category'] as String?,
      isAvailable: json['isAvailable'] as bool,
      description: json['description'] as String?,
      skuNumber: json['skuNumber'] as String?,
    );

Map<String, dynamic> _$$_MealToJson(_$_Meal instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price.toJson(),
      'image': instance.image,
      'category': instance.category,
      'isAvailable': instance.isAvailable,
      'description': instance.description,
      'skuNumber': instance.skuNumber,
    };
