import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eats_client/features/meal/domain/meal_price/meal_price.dart';
import 'package:eats_client/features/delivery_apps/providers/delivery_apps_providers.dart';

class LowestPrice extends ConsumerWidget {
  const LowestPrice({super.key, required this.price, this.style});
  final MealPrice price;
  final TextStyle? style;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      '${ref.read(DeliveryAppsProviders.deliveryAppsControllerProvider).getLowestPrice(price)} SAR',
      style: style ??
          Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 17),
    );
  }
}
