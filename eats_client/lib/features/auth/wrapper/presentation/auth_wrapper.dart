import 'package:eats_client/widgets/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:eats_client/features/user/repos/eats_user_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eats_client/features/auth/login/presentation/screens/login_screen.dart';

class AuthWrapper extends ConsumerWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = EatsUserRepo.stream;

    return user != null ? const BaseScreen() : const LoginScreen();
  }
}
