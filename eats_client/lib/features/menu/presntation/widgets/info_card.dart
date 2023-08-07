import 'package:eats_client/features/menu/providers/menu_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:eats_client/constants/constants.dart';
import 'package:eats_client/constants/spacing_const.dart';
import 'package:eats_client/features/restaurants/domain/restaurant/restaurant.dart';
import 'package:eats_client/features/delivery_apps/presentation/widgets/delivery_apps_row.dart';
import 'package:eats_client/features/restaurants/presentation/widgets/food_type.dart';
import 'package:eats_core/constants/constants.dart';

class InfoCard extends ConsumerStatefulWidget {
  const InfoCard({super.key, required this.restaurant});
  final Restaurant restaurant;

  @override
  ConsumerState<InfoCard> createState() => _InfoCardState();
}

class _InfoCardState extends ConsumerState<InfoCard> {
  @override
  Widget build(BuildContext context) {
    final scrollPosition = ref.watch(MenuProviders.scrollHeightProvider);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      width: 310.w,
      height: (scrollPosition <= 40) ? 105.h : 70.h,
      decoration: BoxDecoration(
        boxShadow: [
          ShadowConst.blackShadow,
        ],
        borderRadius: smallBorderRadius,
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SpacingConst.spacing16.toDouble()),
            child: Text(
              widget.restaurant.name,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: AppColors.darkGreen),
            ),
          ),
          SpacingConst.vSpacing6,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SpacingConst.spacing6.toDouble()),
                child: FoodType(
                  categories: widget.restaurant.categories,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(AssetsConst.rating,
                          color: AppColors.darkGreenTerquise),
                      Text('${widget.restaurant.rating?.toStringAsFixed(1)}'),
                      SpacingConst.hSpacing8,
                    ],
                  ),
                ],
              ),
            ],
          ),
          Visibility(
            visible: scrollPosition <= 40,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 150),
              opacity: (scrollPosition > 0.5) ? 0 : 1,
              child: Column(
                children: [
                  SpacingConst.vSpacing8,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      DeliveryAppsRow(
                          deliveryApps: widget.restaurant.deliveryAppsList),
                    ],
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
