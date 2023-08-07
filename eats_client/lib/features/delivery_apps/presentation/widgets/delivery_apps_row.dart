import 'package:eats_client/features/delivery_apps/presentation/widgets/delivery_app_img.dart';
import 'package:flutter/material.dart';
import 'package:eats_client/utils/enums/delivery_app.dart';

class DeliveryAppsRow extends StatelessWidget {
  const DeliveryAppsRow({super.key, required this.deliveryApps});
  final List<DeliveryApp> deliveryApps;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          deliveryApps.length,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: DeliveryAppsImg(imgAssetName: deliveryApps[index].logo),
          ),
        ),
      ],
    );
  }
}
