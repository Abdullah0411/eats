// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'eats_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EatsUser _$EatsUserFromJson(Map<String, dynamic> json) {
  return _EatsUser.fromJson(json);
}

/// @nodoc
mixin _$EatsUser {
  String get uid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EatsUserCopyWith<EatsUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EatsUserCopyWith<$Res> {
  factory $EatsUserCopyWith(EatsUser value, $Res Function(EatsUser) then) =
      _$EatsUserCopyWithImpl<$Res, EatsUser>;
  @useResult
  $Res call({String uid, String name, String phoneNumber, String? email});
}

/// @nodoc
class _$EatsUserCopyWithImpl<$Res, $Val extends EatsUser>
    implements $EatsUserCopyWith<$Res> {
  _$EatsUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? name = null,
    Object? phoneNumber = null,
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EatsUserCopyWith<$Res> implements $EatsUserCopyWith<$Res> {
  factory _$$_EatsUserCopyWith(
          _$_EatsUser value, $Res Function(_$_EatsUser) then) =
      __$$_EatsUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uid, String name, String phoneNumber, String? email});
}

/// @nodoc
class __$$_EatsUserCopyWithImpl<$Res>
    extends _$EatsUserCopyWithImpl<$Res, _$_EatsUser>
    implements _$$_EatsUserCopyWith<$Res> {
  __$$_EatsUserCopyWithImpl(
      _$_EatsUser _value, $Res Function(_$_EatsUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? name = null,
    Object? phoneNumber = null,
    Object? email = freezed,
  }) {
    return _then(_$_EatsUser(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EatsUser implements _EatsUser {
  const _$_EatsUser(
      {required this.uid,
      required this.name,
      required this.phoneNumber,
      this.email});

  factory _$_EatsUser.fromJson(Map<String, dynamic> json) =>
      _$$_EatsUserFromJson(json);

  @override
  final String uid;
  @override
  final String name;
  @override
  final String phoneNumber;
  @override
  final String? email;

  @override
  String toString() {
    return 'EatsUser(uid: $uid, name: $name, phoneNumber: $phoneNumber, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EatsUser &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uid, name, phoneNumber, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EatsUserCopyWith<_$_EatsUser> get copyWith =>
      __$$_EatsUserCopyWithImpl<_$_EatsUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EatsUserToJson(
      this,
    );
  }
}

abstract class _EatsUser implements EatsUser {
  const factory _EatsUser(
      {required final String uid,
      required final String name,
      required final String phoneNumber,
      final String? email}) = _$_EatsUser;

  factory _EatsUser.fromJson(Map<String, dynamic> json) = _$_EatsUser.fromJson;

  @override
  String get uid;
  @override
  String get name;
  @override
  String get phoneNumber;
  @override
  String? get email;
  @override
  @JsonKey(ignore: true)
  _$$_EatsUserCopyWith<_$_EatsUser> get copyWith =>
      throw _privateConstructorUsedError;
}
