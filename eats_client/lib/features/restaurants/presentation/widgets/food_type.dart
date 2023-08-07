import 'package:eats_client/constants/spacing_const.dart';
import 'package:eats_client/features/restaurants/presentation/widgets/small_dot.dart';
import 'package:flutter/material.dart';

class FoodType extends StatelessWidget {
  const FoodType({super.key, required this.categories});
  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      ...List.generate(
        categories.length,
        (index) => Row(
          children: [
            const SmallDot(),
            Text('${categories[index]} ',
                style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      )
    ]);
  }
}
