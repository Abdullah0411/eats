import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eats_core/services/firestore_services.dart';
import 'package:eats_core/utilis/logger/extensions.dart';
import 'package:eats_client/features/menu/domain/menu.dart';

class MenuRepo {
  static Future<Menu?> getMenuById(id) async {
    try {
      QuerySnapshot<Map<String, dynamic>> data =
          (await FirestoreCollections.menu.where('id', isEqualTo: id).get());
      final Menu menu = Menu.fromJson(data.docs.first.data());
      return menu;
    } catch (e) {
      e.logException();
      return null;
    }
  }
}
