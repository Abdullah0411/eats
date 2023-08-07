import 'package:eats_client/constants/colors_const.dart';
import 'package:eats_client/constants/spacing_const.dart';
import 'package:eats_client/features/menu/presntation/widgets/quantity_button.dart';
import 'package:eats_client/features/menu/providers/menu_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuantityWidget extends ConsumerWidget {
  const QuantityWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quantity = ref.watch(MenuProviders.quantityProvider);
    return Row(
      children: [
        QuantityButton(
          icon: Icons.remove,
          onPressed: () {
            if (quantity > 1) {
              ref
                  .read(MenuProviders.quantityProvider.notifier)
                  .update((state) => state - 1);
            }
          },
        ),
        SpacingConst.hSpacing6,
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.lightGrey.withOpacity(0.4),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(
              '$quantity',
              style:
                  Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 17),
            ),
          ),
        ),
        SpacingConst.hSpacing6,
        QuantityButton(
          icon: Icons.add,
          onPressed: () {
            ref
                .read(MenuProviders.quantityProvider.notifier)
                .update((state) => state + 1);
          },
        ),
      ],
    );
  }
}
