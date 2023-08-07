import 'package:eats_client/features/location/presentation/controllers/location_controller.dart';
import 'package:eats_client/features/location/presentation/widgets/location_dropdown.dart';
import 'package:eats_core/services/google_geocode_api/address_information.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:eats_client/features/location/repos/location_repo.dart';

class LocationProviders {
  static final currentLocationProvider =
      FutureProvider.autoDispose<Map<String, double>>((ref) async {
    Position? currentPosition = await LocationRepo.currentLocation;
    return {
      'latitude': currentPosition!.latitude,
      'longitude': currentPosition.longitude
    };
  });

  static final locationChoicesProvider =
      FutureProvider.autoDispose<List<CustomChoice>>((ref) async {
    final locations = await LocationRepo.userLocations;

    List<CustomChoice> locationsChoices = [];
    locations.forEach((location) {
      locationsChoices.add(CustomChoice(
        location: location!,
        value: location,
      ));
    });
    return locationsChoices;
  });

  static final addressStateProvider =
      StateProvider.autoDispose<AddressInformation?>((ref) => null);

  static final locationScreenProvider =
      StateProvider.autoDispose<LocationController>((ref) {
    return LocationController(
      ref: ref,
    );
  });
}
