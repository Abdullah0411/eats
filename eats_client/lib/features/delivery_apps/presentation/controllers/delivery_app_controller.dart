import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eats_client/features/cart/providers/cart_providers.dart';
import 'package:eats_client/features/delivery_apps/domain/delivery_apps_prices.dart';
import 'package:eats_client/features/order/domain/order.dart';
import 'package:eats_client/features/restaurants/providers/restaurants_providers.dart';
import 'package:eats_client/features/order/repo/order_repo.dart';
import 'package:eats_core/enums/order_status.dart';
import 'package:eats_core/services/auth_services.dart';
import 'package:eats_core/services/easy_navigator.dart';
import 'package:eats_core/services/random_generator.dart';
import 'package:eats_client/features/meal/domain/meal/meal.dart';
import 'package:eats_client/features/meal/domain/meal_price/meal_price.dart';
import 'package:eats_client/utils/enums/delivery_app.dart';

class DeliveryAppsController {
  DeliveryAppsController({required this.ref});
  Ref ref;
  late BuildContext context;

  Future<void> sendOrder(DeliveryApp deliveryApp) async {
    Order order = Order(
      id: generateRandomString(20),
      uid: FirebaseAuthServices.uid ?? '',
      restaurantId:
          ref.read(RestaurantProviders.selectedRestaurantProvider)?.id ?? '',
      orderDate: DateTime.now(),
      status: OrderStatus.underProcessing,
      deliveryApp: deliveryApp,
      cart: ref.read(CartProviders.cartProvider),
    );

    await OrderRepo.setOrder(order);
  }

  void popToFirst() {
    EasyNavigator.popToFirstView(context);
  }

  double? getLowestPrice(MealPrice mealPrice) {
    double? minPrice;
    for (DeliveryApp deliveryApp in DeliveryApp.values) {
      double? currentPrice;
      switch (deliveryApp) {
        case DeliveryApp.hungerStation:
          currentPrice = mealPrice.HungerStation;
          break;
        case DeliveryApp.jahez:
          currentPrice = mealPrice.Jahez;
          break;
        case DeliveryApp.toYou:
          currentPrice = mealPrice.ToYou;
          break;
        case DeliveryApp.shgardi:
          currentPrice = mealPrice.Shgardi;
          break;
      }
      if (minPrice == null ||
          (currentPrice != null && currentPrice < minPrice)) {
        minPrice = currentPrice;
      }
    }
    return minPrice;
  }

  double getTotalPrice(List<Meal> meals, DeliveryApp deliveryApp) {
    double totalShgardi = 0;
    double totalJahez = 0;
    double totalToYou = 0;
    for (Meal meal in meals) {
      totalShgardi += meal.price.Shgardi ?? 0;
      totalJahez += meal.price.Jahez ?? 0;
      totalToYou += meal.price.ToYou ?? 0;
    }

    double? totalPrice;
    switch (deliveryApp) {
      case DeliveryApp.hungerStation:
        totalPrice = totalShgardi;
        break;
      case DeliveryApp.jahez:
        totalPrice = totalJahez;
        break;
      case DeliveryApp.toYou:
        totalPrice = totalToYou;
        break;
      case DeliveryApp.shgardi:
        totalPrice = totalShgardi;
        break;
    }
    return totalPrice;
  }

  double getDeliveryAppPrice(
      DeliveryApp deliveryApp, DeliveryAppsPrices? deliveryAppPrices) {
    double? deliveryAppPrice;
    switch (deliveryApp) {
      case DeliveryApp.hungerStation:
        deliveryAppPrice = deliveryAppPrices?.HungerStation;
        break;
      case DeliveryApp.jahez:
        deliveryAppPrice = deliveryAppPrices?.Jahez;
        break;
      case DeliveryApp.toYou:
        deliveryAppPrice = deliveryAppPrices?.ToYou;
        break;
      case DeliveryApp.shgardi:
        deliveryAppPrice = deliveryAppPrices?.Shgardi;
        break;
    }

    return deliveryAppPrice ?? 0;
  }

  double getMealPrice(MealPrice price, DeliveryApp deliveryApp) {
    double? mealPrice;
    switch (deliveryApp) {
      case DeliveryApp.hungerStation:
        mealPrice = price.HungerStation;
        break;
      case DeliveryApp.jahez:
        mealPrice = price.Jahez;
        break;
      case DeliveryApp.toYou:
        mealPrice = price.ToYou;
        break;
      case DeliveryApp.shgardi:
        mealPrice = price.Shgardi;
        break;
    }
    return mealPrice ?? 0;
  }

  double getTotalPriceForDelievrApp(Order order, DeliveryApp deliveryApp) {
    double totalPrice = 0;
    for (Meal meal in order.cart?.orderedMeals ?? []) {
      totalPrice += getMealPrice(meal.price, deliveryApp);
    }
    return totalPrice +
        getDeliveryAppPrice(
            deliveryApp, order.cart?.restaurant?.deliveryAppsPrices);
  }
}
