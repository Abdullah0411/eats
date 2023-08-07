import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:eats_client/constants/constants.dart';
import 'package:eats_client/constants/spacing_const.dart';
import 'package:eats_client/features/restaurants/domain/restaurant/restaurant.dart';
import 'package:eats_client/features/menu/presntation/widgets/food_category.dart';
import 'package:eats_client/features/menu/presntation/widgets/selectable_list.dart';
import 'package:eats_client/widgets/custom_button/custom_button.dart';
import 'package:eats_client/widgets/custom_button/enums/button_size.dart';
import 'package:eats_client/widgets/custom_button/enums/button_style.dart';
import 'package:eats_client/features/menu/presntation/widgets/info_card.dart';
import 'package:eats_client/features/cart/providers/cart_providers.dart';
import 'package:eats_core/constants/constants.dart';
import 'package:eats_core/widgets/bottom_sheet/utils/sheet.dart';
import 'package:eats_core/widgets/loading_container.dart';
import 'package:eats_client/features/menu/providers/menu_providers.dart';

class MenuScreen extends ConsumerStatefulWidget {
  const MenuScreen({super.key, required this.restaurant});
  final Restaurant restaurant;

  @override
  ConsumerState<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends ConsumerState<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(MenuProviders.menuScreenControllerProvider);
    final scrollPosition = ref.watch(MenuProviders.scrollHeightProvider);
    final menu = ref.watch(MenuProviders.menuProvider(widget.restaurant.id));
    final cart = ref.watch(CartProviders.cartProvider);
    controller.context = context;
    return Sheet(
      scroll: false,
      footer: [
        cart.orderedMeals.isNotEmpty
            ? Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SpacingConst.spacing6.toDouble(),
                        vertical: SpacingConst.spacing6.toDouble()),
                    child: CustomButton(
                      style: CustomButtonStyle.primary,
                      size: ButtonSize.large,
                      label: 'Check out',
                      onPressed: () {
                        if (cart.orderedMeals.isNotEmpty) {
                          ref
                              .read(MenuProviders.menuScreenControllerProvider)
                              .viewCart();
                        }
                      },
                    ),
                  ),
                  Positioned(
                    child: Container(
                      height: 25.r,
                      width: 25.r,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.yellow.shade500),
                      child: Center(
                        child: Text(
                          '${cart.orderedMeals.length}',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: AppColors.white),
                        ),
                      ),
                    ),
                  ).animate().fadeIn()
                ],
              )
                .animate()
                .fade(duration: 150.ms)
                .scaleXY(duration: 150.ms, begin: 0.5)
            : const SizedBox.shrink()
      ],
      child: Column(
        children: [
          AnimatedContainer(
            duration: 150.ms,
            height: (scrollPosition > 0) ? 140.h : 240.h,
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: 150.ms,
                  top: (scrollPosition > 0) ? -190.h : 0.h,
                  left: 0.w,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 180.h,
                    child: AnimatedOpacity(
                      duration: 150.ms,
                      opacity: (scrollPosition > 0) ? 0 : 1,
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: widget.restaurant.logo,
                        placeholder: (context, url) => LoadingContainer(
                          borderRadius: smallBorderRadius,
                          height: 200.h,
                          width: 345.w,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 10.w,
                  top: 45.h,
                  child: AnimatedContainer(
                    duration: 150.ms,
                    child: GestureDetector(
                      onTap: controller.pop,
                      child: Icon(
                        Icons.arrow_back,
                        color: (scrollPosition > 0)
                            ? AppColors.darkGreenTerquise
                            : AppColors.black,
                        size: 30.sp,
                      ),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: 150.ms,
                  left: 30.w,
                  top: (scrollPosition > 0) ? 65.h : 120.h,
                  child: InfoCard(
                    restaurant: widget.restaurant,
                  ),
                ),
              ],
            ),
          ),
          menu.when(
            data: (menu) {
              if (menu != null &&
                  menu.categories != null &&
                  menu.categories!.isNotEmpty) {
                Set<String> categoryTitlesWithMeals =
                    menu.meals.map((meal) => meal.category ?? '').toSet();

                // Filter categories that are not in the set of category titles with meals
                List<String> categoriesWithMeals = menu.categories!
                    .where((category) =>
                        categoryTitlesWithMeals.contains(category))
                    .toList();

                return Flexible(
                  child: SelectableAnimatedList(
                    menu: menu,
                    children: [
                      ...categoriesWithMeals.map((e) => FoodCategory(title: e)),
                    ],
                  ),
                );
              } else {
                return const Text(
                    'No categories available.'); // Display a message when there are no categories
              }
            },
            error: (error, stackTrace) => const SizedBox.shrink(),
            loading: () => const SizedBox.shrink(),
          )
        ],
      ),
    );
  }
}
