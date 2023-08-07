import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eats_client/features/cart/providers/cart_providers.dart';
import 'package:eats_client/features/meal/domain/meal/meal.dart';
import 'package:eats_core/services/easy_navigator.dart';
import 'package:eats_client/features/cart/presntation/screens/cart_screen.dart';
import 'package:eats_client/features/menu/providers/menu_providers.dart';

class MenuController {
  MenuController({required this.ref});
  late BuildContext context;
  Ref ref;
  ScrollController scrollController = ScrollController();

  void onScroll() {
    scrollController.addListener(() {
      ref
          .read(MenuProviders.scrollHeightProvider.notifier)
          .update((state) => scrollController.position.pixels.h);
    });
  }

  void onCategoryClick(String category) {
    final meals = ref.read(MenuProviders.mealsProvider);

    ref.read(MenuProviders.selectedMealsCategoryProvider.notifier).update(
        (state) => meals
            .where((element) =>
                element.category!.toLowerCase() == category.toLowerCase())
            .toList());
  }

  List<String> getCategoriesWithMeals(
      List<String> categories, List<Meal> meals) {
    // Create a set of category titles from the meals list
    Set<String> categoryTitlesWithMeals =
        meals.map((meal) => meal.category ?? '').toSet();

    // Filter categories that are not in the set of category titles with meals
    List<String> categoriesWithMeals = categories
        .where((category) => categoryTitlesWithMeals.contains(category))
        .toList();

    // Return the list of categories without meals
    return categoriesWithMeals;
  }

  void viewCart() {
    EasyNavigator.openPage(
      isCupertinoStyle: false,
      context: context,
      page: const CartScreen(),
      isAnimated: true,
    );
  }

  void addMealToCart(Meal meal) {
    final quantity = ref.read(MenuProviders.quantityProvider);

    final cart = ref.read(CartProviders.cartProvider);
    ref.read(CartProviders.cartProvider.notifier).update((state) => cart
            .copyWith(orderedMeals: [
          ...cart.orderedMeals,
          ...List.generate(quantity, (index) => meal)
        ]));

    EasyNavigator.popPage(context);
  }

  void removeMealFromCart(String id) {
    final cart = ref.read(CartProviders.cartProvider);
    ref.read(CartProviders.cartProvider.notifier).update((state) {
      final meals = cart.orderedMeals;
      final newList = meals.where((element) => element.id != id).toList();

      return cart.copyWith(orderedMeals: newList);
    });
  }

  void pop() {
    EasyNavigator.popPage(context);
  }
}
