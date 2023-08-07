import 'package:freezed_annotation/freezed_annotation.dart';

part 'eats_user.freezed.dart';
part 'eats_user.g.dart';

@freezed
class EatsUser with _$EatsUser {
  const factory EatsUser({
    required String uid,
    required String name,
    required String phoneNumber,
    String? email,
  }) = _EatsUser;

    factory EatsUser.fromJson(Map<String, dynamic> json) => _$EatsUserFromJson(json);


}
