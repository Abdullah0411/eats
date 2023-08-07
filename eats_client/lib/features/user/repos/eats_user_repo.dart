import 'package:eats_core/models/eats_user/eats_user.dart';
import 'package:eats_core/services/auth_services.dart';
import 'package:eats_core/services/firestore_services.dart';
import 'package:eats_core/utilis/logger/g_logger.dart';

class EatsUserRepo {
  static String get uid {
    try {
      return FirebaseAuthServices.uid!;
    } catch (error) {
      error.logException();
      throw Exception("Uid is null");
    }
  }

  static Stream<EatsUser>? get stream {
    try {
      return FirestoreCollections.users
          .doc(uid)
          .snapshots()
          .map((user) => EatsUser.fromJson(user.data()!));
    } catch (error) {
      error.logException();
      return null;
    }
  }

  static Future<EatsUser?> get user async {
    try {
      return EatsUser.fromJson(
          (await FirestoreCollections.users.doc(uid).get()).data()!);
    } catch (error) {
      error.logException();
      return Future.value(null);
    }
  }

  static Future<EatsUser?> getUserWhere(
      {required String felid, required String value}) async {
    try {
      final user =
          (await (FirestoreCollections.users.where(felid, isEqualTo: value))
                  .get())
              .docs
              .first;

      return EatsUser.fromJson(user.data());
    } catch (error) {
      error.logException();
      return Future.value(null);
    }
  }

  static Future<bool> create(EatsUser user) async {
    try {
      final isUserExistsWithSamePhone =
          await getUserWhere(felid: 'phoneNumber', value: user.phoneNumber);

      if (isUserExistsWithSamePhone != null) {
        throw Exception("User with same phone number exists");
      }

      await FirestoreCollections.users.doc(user.uid).set(user.toJson());

      return true;
    } catch (error) {
      error.logException();
      return false;
    }
  }

  static Future<bool> update(String uid,Map<String,dynamic> updatedField) async {
    try {
      await FirestoreCollections.users.doc(uid).update(updatedField);

      return true;
    } catch (error) {
      error.logException();
      return false;
    }
  }
}
