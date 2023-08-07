import 'package:eats_client/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:eats_client/features/delivery_apps/presentation/widgets/delivery_apps_row.dart';
import 'package:eats_client/utils/enums/delivery_app.dart';
import 'package:eats_client/constants/colors_const.dart';
import 'package:eats_client/constants/spacing_const.dart';

class RestaurantInfo extends StatelessWidget {
  const RestaurantInfo({
    super.key,
    required this.rating,
    required this.deliveryTime,
    required this.deliveryApps,
  });
  final double? rating;
  final String? deliveryTime;
  final List<DeliveryApp> deliveryApps;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(AssetsConst.rating,
                color: AppColors.darkGreenTerquise),
            SpacingConst.hSpacing6,
            Text('${rating?.toStringAsFixed(1)}',
                style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
        Row(
          children: [
            DeliveryAppsRow(deliveryApps: deliveryApps),
            SpacingConst.hSpacing6,
          ],
        ),
      ],
    );
  }
}
