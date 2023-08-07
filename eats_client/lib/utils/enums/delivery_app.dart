import 'package:eats_client/constants/constants.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'name')
enum DeliveryApp {
  jahez('Jahez', AssetsConst.jahezLogo),
  hungerStation('HungerStation', AssetsConst.hungerStationLogo),
  toYou('ToYou', AssetsConst.toYouLogo),
  shgardi('Shgardi', AssetsConst.shagardiLogo);

  const DeliveryApp(this.name, this.logo);
  final String name;
  final String logo;
}
