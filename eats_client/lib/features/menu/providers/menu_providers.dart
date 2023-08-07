import 'package:eats_client/features/menu/repo/menu_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eats_client/features/meal/domain/meal/meal.dart';
import 'package:eats_client/features/menu/domain/menu.dart';
import 'package:eats_client/features/menu/presntation/controllers/menu_controller.dart';

class MenuProviders {
  static final menuScreenControllerProvider =
      StateProvider.autoDispose<MenuController>((ref) {
    return MenuController(ref: ref);
  });

  static final quantityProvider = StateProvider.autoDispose<int>((ref) {
    return 1;
  });

  static final menuProvider =
      FutureProvider.family.autoDispose<Menu?, String>((ref, id) async {
    final menu = await MenuRepo.getMenuById(id);

    ref.read(mealsProvider.notifier).update((state) => menu!.meals);

    return await MenuRepo.getMenuById(id);
  });

  static final scrollHeightProvider = StateProvider.autoDispose<double>((ref) {
    return 0;
  });

  static final mealsProvider = StateProvider<List<Meal>>((ref) {
    return [];
  });

  static final selectedMealsCategoryProvider = StateProvider<List<Meal>>((ref) {
    return [];
  });
}
