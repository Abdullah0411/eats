import 'package:eats_client/features/user/repos/eats_user_repo.dart';
import 'package:eats_core/models/eats_user/eats_user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final eatsUserProvider = FutureProvider.autoDispose<EatsUser?>((ref) async {
  return await EatsUserRepo.user;
});
