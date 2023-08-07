import 'package:eats_client/features/delivery_apps/providers/delivery_apps_providers.dart';
import 'package:eats_client/features/order/order_sent/presentation/widgets/order_sent.dart';
import 'package:eats_client/features/restaurants/providers/restaurants_providers.dart';
import 'package:eats_client/utils/enums/delivery_app.dart';
import 'package:eats_client/widgets/alert_box.dart';
import 'package:eats_client/widgets/custom_button/custom_button.dart';
import 'package:eats_client/widgets/custom_button/enums/button_size.dart';
import 'package:eats_client/widgets/custom_button/enums/button_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eats_client/features/delivery_apps/presentation/widgets/selectable_delivery_apps_list.dart';
import 'package:eats_core/widgets/bottom_sheet/utils/sheet.dart';

class DeliveryAppsScreen extends ConsumerStatefulWidget {
  const DeliveryAppsScreen({super.key});

  @override
  ConsumerState<DeliveryAppsScreen> createState() => _DeliveryAppsScreenState();
}

class _DeliveryAppsScreenState extends ConsumerState<DeliveryAppsScreen> {
  DeliveryApp? selectedDeliveryApp;
  int attempts = 1;
  @override
  Widget build(BuildContext context) {
    final controller =
        ref.watch(DeliveryAppsProviders.deliveryAppsControllerProvider);
    controller.context = context;
    final deliveryApps = ref
            .read(RestaurantProviders.selectedRestaurantProvider)
            ?.deliveryAppsList ??
        [];

    return Sheet(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        title: Text(
          'Delivery apps',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      footer: [
        selectedDeliveryApp != null
            ? CustomButton(
                onPressed: () async {
                  if (attempts == 1) {
                    attempts--;
                    await controller.sendOrder(
                      selectedDeliveryApp!,
                    );
                  }

                  AlertDialogBox.showBoxDialog(
                    child: const OrderSent(),
                    contentPadding: EdgeInsets.zero,
                  );
                },
                label: 'Order',
                size: ButtonSize.large,
                style: CustomButtonStyle.primary,
              )
                .animate()
                .fade(duration: 150.ms)
                .scaleXY(duration: 150.ms, begin: 0.5)
            : const SizedBox.shrink(),
      ],
      children: [
        SelectableDeliveryAppsList(
          onChange: (selectedDeliveryApp) {
            setState(() {
              this.selectedDeliveryApp = selectedDeliveryApp;
            });
          },
          children: List.generate(
            deliveryApps.length,
            (index) => deliveryApps[index],
          ),
        ),
        Text(
          'Pleses select a delivery app that suits you ♥️',
          style: Theme.of(context).textTheme.bodySmall,
        )
            .animate()
            .fadeIn(duration: (150.ms))
            .blurXY(
              begin: 5,
              end: 0,
            )
            .scaleXY(
              begin: 10,
              curve: Curves.decelerate,
              duration: 150.ms,
            ),
      ],
    );
  }
}
