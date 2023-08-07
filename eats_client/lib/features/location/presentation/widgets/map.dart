import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:eats_client/features/location/providers/current_location_provider.dart';

class Map extends ConsumerWidget {
  const Map({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final location = ref.watch(LocationProviders.currentLocationProvider);
    final controller = ref.watch(LocationProviders.locationScreenProvider);
    controller.context = context;
    return location.when(
      data: ((currentLocation) {
        return GoogleMap(
          padding: const EdgeInsets.symmetric(vertical: 325),
          myLocationEnabled: true,
          onCameraIdle: () async => controller.getAddrees(),
          initialCameraPosition: CameraPosition(
              target: LatLng(
                  currentLocation['latitude']!, currentLocation['longitude']!),
              zoom: 15),
          onMapCreated: (GoogleMapController mapController) {
            controller.mapController = mapController;
          },
        );
      }),
      error: ((error, stackTrace) {
        return const Text('error');
      }),
      loading: (() {
        return const SizedBox.shrink();
      }),
    );
  }
}
