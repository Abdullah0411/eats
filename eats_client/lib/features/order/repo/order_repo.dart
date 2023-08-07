import 'dart:developer';

import 'package:eats_client/features/order/domain/order.dart';
import 'package:eats_core/services/firestore_services.dart';
import 'package:eats_core/utilis/logger/g_logger.dart';

class OrderRepo {
  static Future<bool> setOrder(Order order) async {
    try {
      await FirestoreCollections.order.doc(order.id).set(order.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<List<Order>> getOrdersByUid(String uid) async {
    // try {
    final data =
        (await FirestoreCollections.order.where('uid', isEqualTo: uid).get());
    final List<Order> orders =
        data.docs.map((order) => Order.fromJson(order.data())).toList();

    return orders;
    // } catch (e) {
    //   e.logException();
    //   return [];
    // }
  }
}
