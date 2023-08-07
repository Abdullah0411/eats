import 'package:geolocator/geolocator.dart';
import 'package:cloud_firestore/cloud_firestore.dart' show FieldValue;
import 'package:eats_client/features/location/domain/location.dart';
import 'package:eats_core/services/auth_services.dart';
import 'package:eats_core/services/firestore_services.dart';
import 'package:eats_core/services/location.dart';
import 'package:eats_core/utilis/logger/extensions.dart';

class LocationRepo {
  static String get uid {
    try {
      return FirebaseAuthServices.uid!;
    } catch (error) {
      error.logException();
      throw Exception("Uid is null");
    }
  }

  static Future<List<Location?>> get userLocations async {
    try {
      Map<String, dynamic> data =
          (await FirestoreCollections.users.doc(uid).get()).data()!;
      if (data.containsKey('location')) {
        return Location.fromMapToList(data['location']);
      } else {
        return [];
      }
    } catch (e) {
      e.logException();
      return Future.error(e);
    }
  }

  // static Stream<List<Location>> get stream {
  //   try {
  //     return FirestoreCollections.users.doc(uid).snapshots().map(
  //         (location) => Location.fromMapToList(location.data()!['location']));
  //   } catch (e) {
  //     e.logException();
  //     return Stream.error(e);
  //   }
  // }

  static Future<Location?> get defaultLocation async {
    try {
      Map<String, dynamic> data =
          (await FirestoreCollections.users.doc(uid).get()).data()!;
      if (data.containsKey('defaultLocation')) {
        return Location.fromJson(data['defaultLocation']);
      } else {
        return null;
      }
    } catch (e) {
      e.logException();
    }
    return null;
  }

  static Future<bool> setDefault(Location location) async {
    try {
      await FirestoreCollections.users
          .doc(uid)
          .update({'defaultLocation': location.toJson()});
      return true;
    } catch (e) {
      e.logException();
      return false;
    }
  }

  static Future<bool> addLocation(Location location) async {
    try {
      await FirestoreCollections.users.doc(uid).update({
        'location': FieldValue.arrayUnion([location.toJson()]),
        'defaultLocation': location.toJson()
      });
      return true;
    } catch (error) {
      error.logException();
      return false;
    }
  }

  static Future<bool> deleteLocation(Location location) async {
    try {
      await FirestoreCollections.users.doc(uid).update({
        'location': FieldValue.arrayRemove([location.toJson()])
      });
      return true;
    } catch (e) {
      e.logException();
      return false;
    }
  }

  static Future<bool> deleteDefaultLocation(Location location) async {
    try {
      await FirestoreCollections.users.doc(uid).update({
        'defaultLocation': FieldValue.delete(),
        'location': FieldValue.arrayRemove([location.toJson()])
      });
      return true;
    } catch (e) {
      e.logException();
      return false;
    }
  }

  static Future<Position?> get currentLocation async {
    try {
      Position currentPosition = await CurrentLocation.getPosition();
      return currentPosition;
    } catch (e) {
      e.logException();
    }
    return null;
  }
}
