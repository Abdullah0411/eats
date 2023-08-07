import 'package:eats_client/features/delivery_apps/presentation/controllers/delivery_app_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DeliveryAppsProviders{
  static final  deliveryAppsControllerProvider = StateProvider<DeliveryAppsController>((ref) {
    return DeliveryAppsController(ref: ref);
  });
}