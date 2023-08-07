import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eats_core/widgets/bottom_sheet/utils/sheet.dart';
import 'package:eats_client/constants/constants.dart';
import 'package:eats_client/features/delivery_apps/providers/delivery_apps_providers.dart';
import 'package:eats_client/constants/spacing_const.dart';
import 'package:eats_client/features/cart/presntation/controller/cart_controller.dart';
import 'package:eats_client/features/cart/presntation/widgets/animated_cart_list.dart';
import 'package:eats_client/features/cart/providers/cart_providers.dart';
import 'package:eats_client/features/home/presentation/controllers/home_controller.dart';
import 'package:eats_client/features/meal/domain/quantity_meal/quantity_meal.dart';
import 'package:eats_client/widgets/custom_button/custom_button.dart';
import 'package:eats_client/widgets/custom_button/enums/button_size.dart';
import 'package:eats_client/widgets/custom_button/enums/button_style.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  late CartController controller;

  @override
  void didChangeDependencies() {
    controller = ref.watch(CartProviders.cartScreenControllerProvider);
    controller.init(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final location = ref.watch(selectedLocationProvider);
    final cart = ref.watch(CartProviders.cartProvider);

    final Map<String, QuantityMeal> uniqueMeals = {};
    for (final meal in cart.orderedMeals) {
      final mealId = meal.id;

      if (uniqueMeals[mealId] == null) {
        uniqueMeals[mealId] = QuantityMeal.fromJson({
          'id': mealId,
          'name': meal.name,
          'imageUrl': meal.image,
          'quantity': 1,
          'price': ref
              .read(DeliveryAppsProviders.deliveryAppsControllerProvider)
              .getLowestPrice(meal.price),
        });
      } else {
        uniqueMeals[mealId]?.quantity += 1;
      }
    }
    final sortedMealsWithCount = uniqueMeals.values.toList();
    return Sheet(
      scroll: false,
      footer: [
        CustomButton(
          onPressed: () {
            if (cart.orderedMeals.isNotEmpty) {
              ref.read(CartProviders.cartScreenControllerProvider).onCheckout();
            }
          },
          label:
              'Checkout | ${ref.read(CartProviders.cartScreenControllerProvider).getTotalPrice(cart.orderedMeals)}',
          style: CustomButtonStyle.primary,
          size: ButtonSize.large,
        )
      ],
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        title: location?.title == null
            ? Text(
                'Checkout',
                style: Theme.of(context).textTheme.titleMedium,
              )
            : Column(
                children: [
                  Text(
                    'Delivery To',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: AppColors.darkGreen, fontSize: 23),
                  ),
                  Text(
                    location?.title ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 18),
                  ),
                ],
              ),
      ),
      children: [
        SpacingConst.vSpacing16,
        Flexible(
            child: AnimatedCartList(
          meals: sortedMealsWithCount,
        )),
      ],
    );
  }
}
