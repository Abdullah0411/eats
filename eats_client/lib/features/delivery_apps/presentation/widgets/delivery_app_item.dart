import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eats_client/constants/constants.dart';
import 'package:eats_client/constants/spacing_const.dart';
import 'package:eats_client/features/cart/providers/cart_providers.dart';
import 'package:eats_client/features/delivery_apps/presentation/widgets/delivery_app_img.dart';
import 'package:eats_client/features/delivery_apps/providers/delivery_apps_providers.dart';
import 'package:eats_client/features/restaurants/providers/restaurants_providers.dart';
import 'package:eats_client/utils/enums/delivery_app.dart';
import 'package:eats_core/constants/constants.dart';
import 'package:eats_core/widgets/bottom_sheet/utils/sheet.dart';

class DeliveryAppItem extends ConsumerStatefulWidget {
  DeliveryAppItem(
      {super.key, this.isSelected = false, required this.deliveryApp});
  bool isSelected = false;
  final DeliveryApp deliveryApp;

  @override
  ConsumerState<DeliveryAppItem> createState() => _DeliveryAppItemState();
}

class _DeliveryAppItemState extends ConsumerState<DeliveryAppItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: 200.ms,
    );
    _scaleAnimation = Tween<double>(
      begin: 1,
      end: 0.95,
    ).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn));
    super.initState();
  }

  @override
  void didUpdateWidget(DeliveryAppItem oldWidget) {
    if (oldWidget.isSelected != widget.isSelected) {
      if (widget.isSelected) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final orderedMeals = ref.watch(CartProviders.cartProvider).orderedMeals;
    final restauarnt = ref.read(RestaurantProviders.selectedRestaurantProvider);
    final totalPrice = ref
        .read(CartProviders.cartScreenControllerProvider)
        .getTotalPrice(ref.read(CartProviders.cartProvider).orderedMeals);
    final deliveryAppPrice = ref
        .read(DeliveryAppsProviders.deliveryAppsControllerProvider)
        .getDeliveryAppPrice(
            widget.deliveryApp, restauarnt?.deliveryAppsPrices);
    return ScaleTransition(
      scale: _scaleAnimation,
      child: Column(
        children: [
          SpacingConst.vSpacing6,
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SpacingConst.spacing6.toDouble()),
            child: AnimatedContainer(
              duration: 200.ms,
              padding: EdgeInsets.symmetric(
                  vertical: SpacingConst.spacing6.toDouble(),
                  horizontal: SpacingConst.spacing6.toDouble()),
              decoration: BoxDecoration(
                border: Border.all(
                  color: widget.isSelected
                      ? AppColors.darkGreenTerquise.withOpacity(0.7)
                      : AppColors.transparent,
                ),
                color: AppColors.white,
                boxShadow: [ShadowsConstants.blackShadow],
                borderRadius: smallBorderRadius,
              ),
              child: Row(
                children: [
                  DeliveryAppsImg(
                    imgAssetName: widget.deliveryApp.logo,
                    width: 70.w,
                    height: 70.h,
                  ),
                  SpacingConst.hSpacing16,
                  Text(
                    widget.deliveryApp.name,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const Spacer(),
                  Text(
                    '${totalPrice + deliveryAppPrice} SAR',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SpacingConst.hSpacing16,
                ],
              ),
            ),
          ),
          SpacingConst.vSpacing16
        ],
      )
          .animate()
          .fadeIn(duration: (150.ms))
          .blurXY(
            begin: 5,
            end: 0,
          )
          .slideY(
            begin: 10,
            curve: Curves.decelerate,
            duration: 150.ms,
          ),
    );
  }
}
