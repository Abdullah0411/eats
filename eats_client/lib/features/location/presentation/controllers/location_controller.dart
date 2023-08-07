import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:eats_client/features/location/providers/current_location_provider.dart';
import 'package:eats_client/features/home/presentation/controllers/home_controller.dart';
import 'package:eats_client/environments/environments.dart';
import 'package:eats_client/features/location/domain/location.dart';
import 'package:eats_client/features/location/repos/location_repo.dart';
import 'package:eats_core/utilis/logger/extensions.dart';
import 'package:eats_core/services/random_generator.dart';
import 'package:eats_core/services/easy_navigator.dart';
import 'package:eats_core/services/validator.dart';
import 'package:eats_core/services/google_geocode_api/google_geocode_services.dart';

class LocationController {
  LocationController({required this.ref});
  TextEditingController locationNameController = TextEditingController();
  TextEditingController locationDescriptionController = TextEditingController();
  Ref ref;
  late BuildContext context;
  late GoogleMapController mapController;

  String? nameValidator(String? name) {
    if (!Validator.safeIsNotEmpty(name)) {
      return "Please enter a name";
    }
    return null;
  }

  void getAddrees() async {
    try {
      LatLng location = await pinLocation;
      final address = await GoogleGeocodeServices.findLocationInformation(
          location.latitude,
          location.longitude,
          Environment.instance.apiKeys!.googleMaps,
          'en');
      ref.read(LocationProviders.addressStateProvider.notifier).state = address;
    } catch (e) {
      e.logException();
    }
  }

  void addLocation() async {
    String locationName = locationNameController.text;
    String locationDescription = locationDescriptionController.text;
    LatLng location = await pinLocation;
    if (locationName.isNotEmpty) {
      await LocationRepo.addLocation(
        Location(
            latitude: location.latitude,
            longitude: location.longitude,
            title: locationName,
            description: locationDescription,
            id: generateRandomString(20)),
      );
      ref.refresh(LocationProviders.locationChoicesProvider);
      EasyNavigator.popPage(context);
    }
  }

  void deleteLocation(Location location) async {
    Location? defaultLocation = await LocationRepo.defaultLocation;

    Location? selectedLocation = ref.watch(selectedLocationProvider);
    defaultLocation?.id != location.id
        ? await LocationRepo.deleteLocation(location)
        : await LocationRepo.deleteDefaultLocation(location);
    List<Location?> locations = await LocationRepo.userLocations;
    if (locations.isNotEmpty) {
      await LocationRepo.setDefault(locations[0]!);
    }
    ref.refresh(LocationProviders.locationChoicesProvider.future);

    if (selectedLocation != null) {
      if (selectedLocation.id == location.id) {
        ref.refresh(selectedLocationProvider.notifier).state;
      }
    }
  }

  Future<LatLng> get pinLocation => mapController
      .getLatLng(ScreenCoordinate(x: 187.w.toInt(), y: 410.h.toInt()));
}
