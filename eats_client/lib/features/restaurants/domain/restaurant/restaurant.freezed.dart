// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'restaurant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Restaurant _$RestaurantFromJson(Map<String, dynamic> json) {
  return _Restaurant.fromJson(json);
}

/// @nodoc
mixin _$Restaurant {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get logo => throw _privateConstructorUsedError;
  DeliveryAppsPrices get deliveryAppsPrices =>
      throw _privateConstructorUsedError;
  List<String> get categories => throw _privateConstructorUsedError;
  List<DeliveryApp> get deliveryAppsList => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  String get deliveryAppRestaurantId => throw _privateConstructorUsedError;
  double? get rating => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RestaurantCopyWith<Restaurant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantCopyWith<$Res> {
  factory $RestaurantCopyWith(
          Restaurant value, $Res Function(Restaurant) then) =
      _$RestaurantCopyWithImpl<$Res, Restaurant>;
  @useResult
  $Res call(
      {String id,
      String name,
      String logo,
      DeliveryAppsPrices deliveryAppsPrices,
      List<String> categories,
      List<DeliveryApp> deliveryAppsList,
      double longitude,
      double latitude,
      String deliveryAppRestaurantId,
      double? rating});

  $DeliveryAppsPricesCopyWith<$Res> get deliveryAppsPrices;
}

/// @nodoc
class _$RestaurantCopyWithImpl<$Res, $Val extends Restaurant>
    implements $RestaurantCopyWith<$Res> {
  _$RestaurantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? logo = null,
    Object? deliveryAppsPrices = null,
    Object? categories = null,
    Object? deliveryAppsList = null,
    Object? longitude = null,
    Object? latitude = null,
    Object? deliveryAppRestaurantId = null,
    Object? rating = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      logo: null == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryAppsPrices: null == deliveryAppsPrices
          ? _value.deliveryAppsPrices
          : deliveryAppsPrices // ignore: cast_nullable_to_non_nullable
              as DeliveryAppsPrices,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      deliveryAppsList: null == deliveryAppsList
          ? _value.deliveryAppsList
          : deliveryAppsList // ignore: cast_nullable_to_non_nullable
              as List<DeliveryApp>,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryAppRestaurantId: null == deliveryAppRestaurantId
          ? _value.deliveryAppRestaurantId
          : deliveryAppRestaurantId // ignore: cast_nullable_to_non_nullable
              as String,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DeliveryAppsPricesCopyWith<$Res> get deliveryAppsPrices {
    return $DeliveryAppsPricesCopyWith<$Res>(_value.deliveryAppsPrices,
        (value) {
      return _then(_value.copyWith(deliveryAppsPrices: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_RestaurantCopyWith<$Res>
    implements $RestaurantCopyWith<$Res> {
  factory _$$_RestaurantCopyWith(
          _$_Restaurant value, $Res Function(_$_Restaurant) then) =
      __$$_RestaurantCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String logo,
      DeliveryAppsPrices deliveryAppsPrices,
      List<String> categories,
      List<DeliveryApp> deliveryAppsList,
      double longitude,
      double latitude,
      String deliveryAppRestaurantId,
      double? rating});

  @override
  $DeliveryAppsPricesCopyWith<$Res> get deliveryAppsPrices;
}

/// @nodoc
class __$$_RestaurantCopyWithImpl<$Res>
    extends _$RestaurantCopyWithImpl<$Res, _$_Restaurant>
    implements _$$_RestaurantCopyWith<$Res> {
  __$$_RestaurantCopyWithImpl(
      _$_Restaurant _value, $Res Function(_$_Restaurant) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? logo = null,
    Object? deliveryAppsPrices = null,
    Object? categories = null,
    Object? deliveryAppsList = null,
    Object? longitude = null,
    Object? latitude = null,
    Object? deliveryAppRestaurantId = null,
    Object? rating = freezed,
  }) {
    return _then(_$_Restaurant(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      logo: null == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryAppsPrices: null == deliveryAppsPrices
          ? _value.deliveryAppsPrices
          : deliveryAppsPrices // ignore: cast_nullable_to_non_nullable
              as DeliveryAppsPrices,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      deliveryAppsList: null == deliveryAppsList
          ? _value._deliveryAppsList
          : deliveryAppsList // ignore: cast_nullable_to_non_nullable
              as List<DeliveryApp>,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryAppRestaurantId: null == deliveryAppRestaurantId
          ? _value.deliveryAppRestaurantId
          : deliveryAppRestaurantId // ignore: cast_nullable_to_non_nullable
              as String,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Restaurant implements _Restaurant {
  const _$_Restaurant(
      {required this.id,
      required this.name,
      required this.logo,
      required this.deliveryAppsPrices,
      required final List<String> categories,
      required final List<DeliveryApp> deliveryAppsList,
      required this.longitude,
      required this.latitude,
      required this.deliveryAppRestaurantId,
      this.rating})
      : _categories = categories,
        _deliveryAppsList = deliveryAppsList;

  factory _$_Restaurant.fromJson(Map<String, dynamic> json) =>
      _$$_RestaurantFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String logo;
  @override
  final DeliveryAppsPrices deliveryAppsPrices;
  final List<String> _categories;
  @override
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<DeliveryApp> _deliveryAppsList;
  @override
  List<DeliveryApp> get deliveryAppsList {
    if (_deliveryAppsList is EqualUnmodifiableListView)
      return _deliveryAppsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_deliveryAppsList);
  }

  @override
  final double longitude;
  @override
  final double latitude;
  @override
  final String deliveryAppRestaurantId;
  @override
  final double? rating;

  @override
  String toString() {
    return 'Restaurant(id: $id, name: $name, logo: $logo, deliveryAppsPrices: $deliveryAppsPrices, categories: $categories, deliveryAppsList: $deliveryAppsList, longitude: $longitude, latitude: $latitude, deliveryAppRestaurantId: $deliveryAppRestaurantId, rating: $rating)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Restaurant &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.deliveryAppsPrices, deliveryAppsPrices) ||
                other.deliveryAppsPrices == deliveryAppsPrices) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality()
                .equals(other._deliveryAppsList, _deliveryAppsList) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(
                    other.deliveryAppRestaurantId, deliveryAppRestaurantId) ||
                other.deliveryAppRestaurantId == deliveryAppRestaurantId) &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      logo,
      deliveryAppsPrices,
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_deliveryAppsList),
      longitude,
      latitude,
      deliveryAppRestaurantId,
      rating);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RestaurantCopyWith<_$_Restaurant> get copyWith =>
      __$$_RestaurantCopyWithImpl<_$_Restaurant>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RestaurantToJson(
      this,
    );
  }
}

abstract class _Restaurant implements Restaurant {
  const factory _Restaurant(
      {required final String id,
      required final String name,
      required final String logo,
      required final DeliveryAppsPrices deliveryAppsPrices,
      required final List<String> categories,
      required final List<DeliveryApp> deliveryAppsList,
      required final double longitude,
      required final double latitude,
      required final String deliveryAppRestaurantId,
      final double? rating}) = _$_Restaurant;

  factory _Restaurant.fromJson(Map<String, dynamic> json) =
      _$_Restaurant.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get logo;
  @override
  DeliveryAppsPrices get deliveryAppsPrices;
  @override
  List<String> get categories;
  @override
  List<DeliveryApp> get deliveryAppsList;
  @override
  double get longitude;
  @override
  double get latitude;
  @override
  String get deliveryAppRestaurantId;
  @override
  double? get rating;
  @override
  @JsonKey(ignore: true)
  _$$_RestaurantCopyWith<_$_Restaurant> get copyWith =>
      throw _privateConstructorUsedError;
}
