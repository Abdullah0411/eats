class LoginInfo {
  LoginInfo({
    this.phoneNumber,
    this.otpCode,
    this.loginToken,
    this.otpResendTimer,
    this.newUserName,
    this.userId,
  });

  final String? phoneNumber;
  final String? otpCode;
  final String? loginToken;
  final int? otpResendTimer;
  final String? newUserName;
  final String? userId;

  LoginInfo copyWith(
      {String? phoneNumber,
      String? otpCode,
      String? loginToken,
      String? newUserName,
      String? userId}) {
    return LoginInfo(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      otpCode: otpCode ?? this.otpCode,
      loginToken: loginToken ?? this.loginToken,
      newUserName: newUserName ?? this.newUserName,
      userId: userId ?? this.userId,
    );
  }
}
