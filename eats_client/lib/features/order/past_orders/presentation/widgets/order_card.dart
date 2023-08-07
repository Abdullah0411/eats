import 'package:animated_box_decoration/src/smooth_animated_container.dart';
import 'package:eats_client/constants/assets_const.dart';
import 'package:eats_client/features/cart/providers/cart_providers.dart';
import 'package:eats_client/features/delivery_apps/providers/delivery_apps_providers.dart';
import 'package:eats_client/features/order/domain/order.dart';
import 'package:eats_client/features/order/past_orders/presentation/widgets/order_info_widget.dart';
import 'package:eats_client/utils/color_utils.dart';
import 'package:eats_client/utils/extensions/iterable_extensions.dart';
import 'package:eats_client/utils/images/svg_image.dart';
import 'package:eats_client/widgets/alert_box.dart';
import 'package:eats_client/widgets/dotted_line.dart';
import 'package:eats_client/widgets/rounded_cached_network_image.dart';
import 'package:eats_core/constants/core_colors.dart';
import 'package:eats_core/widgets/conditionary_widget/widgets/conditionary_widget.dart';
import 'package:flutter/src/cupertino/icons.dart';
import 'package:flutter/src/material/colors.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/gesture_detector.dart';
import 'package:flutter/src/widgets/icon.dart';
import 'package:flutter/src/widgets/text.dart';
import 'package:flutter_animate/animate.dart';
import 'package:flutter_animate/effects/blur_effect.dart';
import 'package:flutter_animate/effects/fade_effect.dart';
import 'package:flutter_animate/effects/scale_effect.dart';
import 'package:flutter_animate/effects/slide_effect.dart';
import 'package:flutter_animate/effects/then_effect.dart';
import 'package:flutter_animate/extensions/animation_controller_loop_extensions.dart';
import 'package:flutter_animate/extensions/num_duration_extensions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:intl/src/intl/date_format.dart';
import 'package:sprung/sprung.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
    required this.order,
  });

  final Order order;

  @override
  Widget build(BuildContext context) {
    final meals = order.cart?.orderedMeals;

    return GestureDetector(
      onTap: () => AlertDialogBox.showBoxDialog(
        child: OrderInfoWidget(order: order),
        contentPadding: EdgeInsets.zero,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 300.h,
            child: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                ConditionaryWidget(
                  condition: (meals?.length ?? -1) > 0,
                  trueWidget: Positioned(
                    left: meals?.length == 1 ? -80.w : 50.w,
                    child: RoundedCachedNetworkImage(
                            size: 140,
                            imageUrl: meals?.safeElementAt(0)?.image ?? '')
                        .animate()
                        .fadeIn(delay: 140.ms)
                        .blurXY(
                          begin: 20,
                          end: 0,
                        )
                        .scaleXY(
                          begin: 0.3,
                          duration: 1500.ms,
                          curve: Sprung.overDamped,
                        )
                        .slide(
                          begin: Offset(-1.w, -1.h),
                          duration: 1500.ms,
                          curve: Sprung.criticallyDamped,
                        )
                        .animate(
                          onPlay: (controller) => controller.loop(),
                        )
                        .slideX(
                            begin: 0.1,
                            duration: 2.2.seconds,
                            curve: Curves.easeInOut)
                        .then()
                        .slideX(
                            end: 0.1,
                            duration: 2.8.seconds,
                            curve: Curves.easeInOut),
                  ),
                ),
                ConditionaryWidget(
                  condition: (meals?.length ?? -1) > 1,
                  trueWidget: Positioned(
                    left: 115.w,
                    top: 170.h,
                    child: RoundedCachedNetworkImage(
                            size: 140,
                            imageUrl: meals?.safeElementAt(2)?.image ?? '')
                        .animate()
                        .fadeIn(delay: 140.ms)
                        .blurXY(
                          begin: 20,
                          end: 0,
                        )
                        .scaleXY(
                          begin: 0.3,
                          duration: 1500.ms,
                          curve: Sprung.overDamped,
                        )
                        .slide(
                          begin: Offset(1.w, 1.h),
                          duration: 1500.ms,
                          curve: Sprung.criticallyDamped,
                        )
                        .animate(
                          onPlay: (controller) => controller.loop(),
                        )
                        .slideY(
                            end: 0.1,
                            duration: 2.seconds,
                            curve: Curves.easeInOut)
                        .then()
                        .slideY(
                            begin: 0.1,
                            duration: 3.seconds,
                            curve: Curves.easeInOut),
                  ),
                ),
                ConditionaryWidget(
                  condition: (meals?.length ?? -1) > 1,
                  trueWidget: Positioned(
                    left: 180.w,
                    child: RoundedCachedNetworkImage(
                            size: 140,
                            imageUrl: meals?.safeElementAt(1)?.image ?? '')
                        .animate()
                        .fadeIn(delay: 140.ms)
                        .blurXY(
                          begin: 20,
                          end: 0,
                        )
                        .scaleXY(
                          begin: 0.3,
                          duration: 1500.ms,
                          curve: Sprung.overDamped,
                        )
                        .slide(
                          begin: Offset(1.w, -1.h),
                          duration: 1500.ms,
                          curve: Sprung.criticallyDamped,
                        )
                        .animate(
                          onPlay: (controller) => controller.loop(),
                        )
                        .slideX(
                            end: 0.1,
                            duration: 2.5.seconds,
                            curve: Curves.easeInOut)
                        .then()
                        .slideX(
                            begin: 0.1,
                            duration: 2.8.seconds,
                            curve: Curves.easeInOut),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: (meals?.length ?? -1) >= 3 ? 50.h : 0.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 45.w),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(13.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.07),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 5), // changes position of shadow
                  ),
                ],
              ),
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundedCachedNetworkImage(
                            size: 22,
                            imageUrl: order.cart?.restaurant?.logo ?? '',
                            shadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.07),
                                spreadRadius: 1,
                                blurRadius: 10,
                                offset: const Offset(
                                    0, 5), // changes position of shadow
                              ),
                            ],
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            order.cart?.restaurant?.name ?? '',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                              order.cart?.restaurant?.categories.length ?? 0,
                              (index) {
                            return SmoothAnimatedContainer(
                              margin: EdgeInsets.symmetric(horizontal: 5.w),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 5.h),
                              decoration: BoxDecoration(
                                color: ColorUtils.randomColor.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              duration: 10.minutes,
                              child: Text(
                                order.cart?.restaurant?.categories[index] ?? '',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            );
                          })),
                      SizedBox(height: 10.h),
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
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      const DottedLine(
                        dashColor: CoreColors.lightGrey,
                        lineThickness: 1.4,
                        dashGapLength: 6,
                        dashLength: 6,
                      ),
                      const SizedBox(height: 10),
                      Consumer(
                        builder: (context, ref, _) {
                          return Text(
                            '${ref.read(DeliveryAppsProviders.deliveryAppsControllerProvider).getTotalPriceForDelievrApp(order, order.deliveryApp)} SR',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  Positioned(
                    left: 0,
                    bottom: 20.h,
                    child: const SvgImage(
                      imagePath: AssetsConst.polygonRight,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 20.h,
                    child: const SvgImage(
                      imagePath: AssetsConst.polygonLeft,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
