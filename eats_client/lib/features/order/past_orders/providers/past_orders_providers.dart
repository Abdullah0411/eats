import 'dart:developer';

import 'package:eats_client/features/order/domain/order.dart';
import 'package:eats_client/features/order/past_orders/repos/past_orders_repo.dart';
import 'package:eats_client/features/order/repo/order_repo.dart';
import 'package:eats_core/services/auth_services.dart';
import 'package:eats_core/utilis/logger/g_logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PastOrdersProviders {
  static final currentPageIndexProvider = StateProvider.autoDispose<int>((ref) {
    return 0;
  });

  static final ordersListProvider =
      FutureProvider.autoDispose<List<Order>>((ref) async {
    try {
      final orders = await OrderRepo.getOrdersByUid(
          FirebaseAuthServices.uid ?? ''); //TODO: Replace with Firestore get

      if (orders.isEmpty) {
        throw Exception('No orders found!'); //Provider will handle it
      } else {
        return orders;
      }
    } catch (e) {
      GLogger.error(e.toString());
      rethrow;
    }
  });
}
