import 'dart:math';

String generateRandomString(int len) {
  const letters = 'abcdefghijklmnopqrstuvwxyz';
  final upperLetters = letters.toUpperCase();
  const numbers = '1234567890';
  final allChar = letters + upperLetters + numbers;
  String randString = '';
  for (int i = 0; i < len; i++) {
    final randomNumber = Random().nextInt(allChar.length - 1);
    randString += allChar[randomNumber];
  }
  return randString;
}
/// It generates a random string of length len by picking random characters from the string allChar
String generateRandomPassword(int len) {
  const letters = 'abcdefghijklmnopqrstuvwxyz';
  const numbers = '1234567890';
  const allChar = letters + numbers;
  String randString = '';
  for (int i = 0; i < len; i++) {
    final randomNumber = Random().nextInt(allChar.length - 1);
    randString += allChar[randomNumber];
  }
  return randString;
}
