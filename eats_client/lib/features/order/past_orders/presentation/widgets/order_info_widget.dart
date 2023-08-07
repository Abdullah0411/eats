import 'package:eats_client/constants/assets_const.dart';
import 'package:eats_client/features/delivery_apps/providers/delivery_apps_providers.dart';
import 'package:eats_client/features/meal/domain/meal/meal.dart';
import 'package:eats_client/features/meal/domain/meal_price/meal_price.dart';
import 'package:eats_client/features/meal/domain/quantity_meal/quantity_meal.dart';
import 'package:eats_client/features/order/domain/order.dart';
import 'package:eats_client/features/order/past_orders/repos/past_orders_repo.dart';
import 'package:eats_client/utils/images/svg_image.dart';
import 'package:eats_client/widgets/dotted_line.dart';
import 'package:eats_client/widgets/rounded_cached_network_image.dart';
import 'package:eats_core/constants/constants.dart';
import 'package:eats_core/widgets/bottom_sheet/utils/sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class OrderInfoWidget extends ConsumerStatefulWidget {
  const OrderInfoWidget({super.key, required this.order});

  final Order order;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OrderInfoWidgetState();
}

class _OrderInfoWidgetState extends ConsumerState<OrderInfoWidget> {
  @override
  Widget build(BuildContext context) {
    final order = widget.order;
    final List<Meal?> sortedMeals = [...order.cart?.orderedMeals ?? []]
      ..sort((a, b) => b?.name.compareTo(a?.name ?? '') ?? 0);

    final Map<String, QuantityMeal> uniqueMeals = {};
    for (final meal in sortedMeals) {
      final mealId = meal?.id;

      if (uniqueMeals[mealId] == null) {
        uniqueMeals[mealId ?? ''] = QuantityMeal.fromJson({
          'id': mealId,
          'name': meal?.name ?? '',
          'imageUrl': meal?.image ?? '',
          'quantity': 1,
          'price': ref
              .read(DeliveryAppsProviders.deliveryAppsControllerProvider)
              .getMealPrice(meal?.price ?? const MealPrice(), order.deliveryApp),
        });
      } else {
        uniqueMeals[mealId]?.quantity += 1;
      }
    }
    final sortedMealsWithCount = uniqueMeals.values.toList();

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 22.h),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  order.cart?.restaurant?.name ?? '',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 15.w,
                      height: 25.h,
                      child: Stack(
                        alignment: Alignment.center,
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            left: -8.w,
                            child: RoundedCachedNetworkImage(
                              size: 25,
                              imageUrl: PastOrdersRepo.getDeliverAppIconURL(
                                  order.deliveryApp),
                              shadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 5,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            )
                                .animate()
                                .scaleXY(
                                  delay: 200.ms,
                                )
                                .blurXY(
                                  begin: 5,
                                  end: 0,
                                )
                                .slideX(
                                  begin: -1.5.w,
                                  curve: Sprung.criticallyDamped,
                                  duration: 1200.ms,
                                ),
                          ),
                          Positioned(
                            left: 8.w,
                            child: RoundedCachedNetworkImage(
                              size: 25,
                              imageUrl: order.cart?.restaurant?.logo ?? '',
                              shadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 5,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            )
                                .animate()
                                .scaleXY(
                                  delay: 200.ms,
                                )
                                .blurXY(
                                  begin: 5,
                                  end: 0,
                                )
                                .slideX(
                                  begin: 1.5.w,
                                  curve: Sprung.criticallyDamped,
                                  duration: 1200.ms,
                                ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      CupertinoIcons.calendar,
                      color: CoreColors.lightGrey,
                      size: 16.r,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      DateFormat('EEEE, d MMM').format(order.orderDate),
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Icon(
                      CupertinoIcons.clock,
                      color: CoreColors.lightGrey,
                      size: 16.r,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      DateFormat('hh:mm a').format(order.orderDate),
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(sortedMealsWithCount.length, (index) {
                    final meal = sortedMealsWithCount[index];
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            RoundedCachedNetworkImage(
                                size: 18, imageUrl: meal.imageUrl.toString()),
                            SizedBox(width: 5.w),
                            Text(
                              meal.name,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              ' x${meal.quantity}',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 10.w),
                        Row(
                          children: [
                            Text(
                              '${meal.price}',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(width: 1.w),
                            Text(
                              'SAR',
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  }),
                ),
                SizedBox(height: 10.h),
                const DottedLine(
                  dashColor: CoreColors.lightGrey,
                  lineThickness: 1.4,
                  dashGapLength: 6,
                  dashLength: 6,
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      CupertinoIcons.creditcard,
                      color: CoreColors.lightGrey,
                      size: 16.r,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      '${ref.read(DeliveryAppsProviders.deliveryAppsControllerProvider).getTotalPriceForDelievrApp(order, order.deliveryApp)} SAR',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ]
                  .animate(
                    interval: 70.ms,
                  )
                  .fadeIn()
                  .slideY(
                    curve: Sprung.overDamped,
                    duration: 1300.ms,
                  ),
            ),
            Positioned(
              left: 0,
              bottom: 25.h,
              child: const SvgImage(
                imagePath: AssetsConst.polygonRight,
              ),
            ),
            Positioned(
              right: 0,
              bottom: 25.h,
              child: const SvgImage(
                imagePath: AssetsConst.polygonLeft,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
