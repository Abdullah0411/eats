import 'package:eats_client/features/auth/login/presentation/screens/login_screen.dart';
import 'package:eats_client/features/user/providers/eats_user_provider.dart';
import 'package:eats_core/services/easy_navigator.dart';
import 'package:eats_core/services/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eats_client/features/user/repos/eats_user_repo.dart';
import 'package:eats_core/services/auth_services.dart';

final profileScreenControllerProvider =
    StateProvider.autoDispose<ProfileController>((ref) {
  return ProfileController(ref: ref);
});

class ProfileController {
  ProfileController({required this.ref});
  Ref ref;
  late BuildContext context;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  String? emailValidator(String? email) {
    if (email != null && email.isNotEmpty) {
      if (!Validator.isValidateEmail(email)) {
        return "Incorrect email address";
      }
    }
    return null;
  }

  Future<void> updateProfile() async {
    await EatsUserRepo.update(FirebaseAuthServices.uid!,
        {'name': nameController.text, 'email': emailController.text});
    ref.refresh(eatsUserProvider.future);
  }

  void signOut() async {
    await FirebaseAuthServices().signout();
    EasyNavigator.openPage(
        context: context,
        page: const LoginScreen(),
        isCupertinoStyle: false,
        isPushReplaced: true);
  }

  void popFromDialog() {
    EasyNavigator.popPage(context);
  }
}
