import 'package:eats_client/features/delivery_apps/presentation/screens/delivery_apps_screen.dart';
import 'package:eats_client/features/delivery_apps/providers/delivery_apps_providers.dart';
import 'package:eats_client/features/meal/domain/meal/meal.dart';
import 'package:eats_core/services/easy_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartController {
  CartController({required this.ref});
  late Ref ref;
  late BuildContext context;

  void init(BuildContext context) {
    this.context = context;
  }

  double getTotalPrice(List<Meal> orderedMeals) {
    double total = 0.0;
    orderedMeals.forEach((meal) {
      total += ref
              .read(DeliveryAppsProviders.deliveryAppsControllerProvider)
              .getLowestPrice(meal.price)
              ?.toDouble() ??
          0.0;
    });
    return total;
  }

  void onCheckout() {
    EasyNavigator.openPage(
      isCupertinoStyle: false,
      context: context,
      isAnimated: true,
      page: const DeliveryAppsScreen(),
    );
  }
}
