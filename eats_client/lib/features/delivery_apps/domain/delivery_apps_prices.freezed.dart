// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery_apps_prices.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DeliveryAppsPrices _$DeliveryAppsPricesFromJson(Map<String, dynamic> json) {
  return _DeliveryAppsPrices.fromJson(json);
}

/// @nodoc
mixin _$DeliveryAppsPrices {
  double? get HungerStation => throw _privateConstructorUsedError;
  double? get Shgardi => throw _privateConstructorUsedError;
  double? get Jahez => throw _privateConstructorUsedError;
  double? get ToYou => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeliveryAppsPricesCopyWith<DeliveryAppsPrices> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryAppsPricesCopyWith<$Res> {
  factory $DeliveryAppsPricesCopyWith(
          DeliveryAppsPrices value, $Res Function(DeliveryAppsPrices) then) =
      _$DeliveryAppsPricesCopyWithImpl<$Res, DeliveryAppsPrices>;
  @useResult
  $Res call(
      {double? HungerStation, double? Shgardi, double? Jahez, double? ToYou});
}

/// @nodoc
class _$DeliveryAppsPricesCopyWithImpl<$Res, $Val extends DeliveryAppsPrices>
    implements $DeliveryAppsPricesCopyWith<$Res> {
  _$DeliveryAppsPricesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? HungerStation = freezed,
    Object? Shgardi = freezed,
    Object? Jahez = freezed,
    Object? ToYou = freezed,
  }) {
    return _then(_value.copyWith(
      HungerStation: freezed == HungerStation
          ? _value.HungerStation
          : HungerStation // ignore: cast_nullable_to_non_nullable
              as double?,
      Shgardi: freezed == Shgardi
          ? _value.Shgardi
          : Shgardi // ignore: cast_nullable_to_non_nullable
              as double?,
      Jahez: freezed == Jahez
          ? _value.Jahez
          : Jahez // ignore: cast_nullable_to_non_nullable
              as double?,
      ToYou: freezed == ToYou
          ? _value.ToYou
          : ToYou // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeliveryAppsPricesCopyWith<$Res>
    implements $DeliveryAppsPricesCopyWith<$Res> {
  factory _$$_DeliveryAppsPricesCopyWith(_$_DeliveryAppsPrices value,
          $Res Function(_$_DeliveryAppsPrices) then) =
      __$$_DeliveryAppsPricesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double? HungerStation, double? Shgardi, double? Jahez, double? ToYou});
}

/// @nodoc
class __$$_DeliveryAppsPricesCopyWithImpl<$Res>
    extends _$DeliveryAppsPricesCopyWithImpl<$Res, _$_DeliveryAppsPrices>
    implements _$$_DeliveryAppsPricesCopyWith<$Res> {
  __$$_DeliveryAppsPricesCopyWithImpl(
      _$_DeliveryAppsPrices _value, $Res Function(_$_DeliveryAppsPrices) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? HungerStation = freezed,
    Object? Shgardi = freezed,
    Object? Jahez = freezed,
    Object? ToYou = freezed,
  }) {
    return _then(_$_DeliveryAppsPrices(
      HungerStation: freezed == HungerStation
          ? _value.HungerStation
          : HungerStation // ignore: cast_nullable_to_non_nullable
              as double?,
      Shgardi: freezed == Shgardi
          ? _value.Shgardi
          : Shgardi // ignore: cast_nullable_to_non_nullable
              as double?,
      Jahez: freezed == Jahez
          ? _value.Jahez
          : Jahez // ignore: cast_nullable_to_non_nullable
              as double?,
      ToYou: freezed == ToYou
          ? _value.ToYou
          : ToYou // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DeliveryAppsPrices implements _DeliveryAppsPrices {
  const _$_DeliveryAppsPrices(
      {this.HungerStation, this.Shgardi, this.Jahez, this.ToYou});

  factory _$_DeliveryAppsPrices.fromJson(Map<String, dynamic> json) =>
      _$$_DeliveryAppsPricesFromJson(json);

  @override
  final double? HungerStation;
  @override
  final double? Shgardi;
  @override
  final double? Jahez;
  @override
  final double? ToYou;

  @override
  String toString() {
    return 'DeliveryAppsPrices(HungerStation: $HungerStation, Shgardi: $Shgardi, Jahez: $Jahez, ToYou: $ToYou)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeliveryAppsPrices &&
            (identical(other.HungerStation, HungerStation) ||
                other.HungerStation == HungerStation) &&
            (identical(other.Shgardi, Shgardi) || other.Shgardi == Shgardi) &&
            (identical(other.Jahez, Jahez) || other.Jahez == Jahez) &&
            (identical(other.ToYou, ToYou) || other.ToYou == ToYou));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, HungerStation, Shgardi, Jahez, ToYou);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeliveryAppsPricesCopyWith<_$_DeliveryAppsPrices> get copyWith =>
      __$$_DeliveryAppsPricesCopyWithImpl<_$_DeliveryAppsPrices>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeliveryAppsPricesToJson(
      this,
    );
  }
}

abstract class _DeliveryAppsPrices implements DeliveryAppsPrices {
  const factory _DeliveryAppsPrices(
      {final double? HungerStation,
      final double? Shgardi,
      final double? Jahez,
      final double? ToYou}) = _$_DeliveryAppsPrices;

  factory _DeliveryAppsPrices.fromJson(Map<String, dynamic> json) =
      _$_DeliveryAppsPrices.fromJson;

  @override
  double? get HungerStation;
  @override
  double? get Shgardi;
  @override
  double? get Jahez;
  @override
  double? get ToYou;
  @override
  @JsonKey(ignore: true)
  _$$_DeliveryAppsPricesCopyWith<_$_DeliveryAppsPrices> get copyWith =>
      throw _privateConstructorUsedError;
}
