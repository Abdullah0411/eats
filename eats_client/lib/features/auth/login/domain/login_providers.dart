import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eats_client/features/auth/login/domain/login_info.dart';
// import 'package:eats_client/features/login/presentation/models/login_view_model.dart';

class LoginInfoNotifier extends StateNotifier<LoginInfo?> {
  final Ref ref;
  LoginInfoNotifier(
    LoginInfo? state,
    this.ref,
  ) : super(state);

  void updatePhoneNumber(String phoneNumber) {
    state = state?.copyWith(phoneNumber: phoneNumber);
  }

  void updateOtp(String otpCode) {
    state = state?.copyWith(otpCode: otpCode);
  }

  void updateLoginToken(String loginToken) {
    state = state?.copyWith(loginToken: loginToken);
  }

  void updateNewUserName(String newUserName) {
    state = state?.copyWith(newUserName: newUserName);
  }

  void addUserId(String userId) {
    state = state?.copyWith(userId: userId);
  }
}

final loginInfoProvider =
    StateNotifierProvider.autoDispose<LoginInfoNotifier, LoginInfo?>((ref) {
  return LoginInfoNotifier(LoginInfo(phoneNumber: ""), ref);
});

final timerToResend = StateProvider.autoDispose<int>(
  (ref) => 59,
);

final allowResendOtpProvider = StateProvider.autoDispose<bool>(
  (ref) => false,
);

final isFocusedOtpFieldProvider = StateProvider.autoDispose<bool>(
  (ref) => false,
);

final isValidOtpProvider = StateProvider.autoDispose<bool>(
  (ref) => true,
);
