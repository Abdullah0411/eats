import 'package:eats_client/constants/spacing_const.dart';
import 'package:eats_client/features/menu/presntation/widgets/meal_card.dart';
import 'package:eats_client/features/menu/providers/menu_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MealsList extends ConsumerStatefulWidget {
  const MealsList({super.key, required this.category});
  final String category;

  @override
  ConsumerState<MealsList> createState() => _MealsListState();
}

class _MealsListState extends ConsumerState<MealsList> {
  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(MenuProviders.menuScreenControllerProvider);
    final meals =
        ref.watch(MenuProviders.selectedMealsCategoryProvider).toList();
    controller.onScroll();
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SpacingConst.spacing16.toDouble()),
          child: Text(
            widget.category,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        SpacingConst.vSpacing6,
        Expanded(
          child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: controller.scrollController,
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  MealCard(
                    meal: meals[index],
                  ),
                ],
              );
            },
            itemCount: meals.length,
          ),
        ),
      ],
    );
  }
}
