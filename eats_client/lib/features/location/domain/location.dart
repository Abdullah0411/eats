import 'package:freezed_annotation/freezed_annotation.dart';

part 'location.freezed.dart';
part 'location.g.dart';

@freezed
class Location with _$Location {
  const factory Location({
    required double latitude,
    required double longitude,
    required String title,
    required String id,
    String? description,
  }) = _Location;

  static List<Location> fromMapToList(locationMap) {
    List<Location> userLocations = [];
    locationMap.forEach(
      (json) => userLocations.add(
        Location(
          id: json['id'],
          latitude: json['latitude'],
          longitude: json['longitude'],
          title: json['title'],
          description: json['description'],
        ),
      ),
    );

    return userLocations;
  }

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}
