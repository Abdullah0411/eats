import 'package:uuid/uuid.dart' as package;

class Uuid {
  static String get generate {
    return const package.Uuid().v4();
  }
}
