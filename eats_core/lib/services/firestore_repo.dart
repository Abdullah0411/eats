import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firestoreRepoProvider = Provider<FirestoreRepo>(
  (ref) => FirestoreRepo(),
);

class FirestoreRepo {
  final techniciansCollection = firestore.collection('Technicians');
  final servicesCollection = firestore.collection('ServicesConstants');
  final carOwnersCollection = firestore.collection('CarOwners');
  final carsCollection = firestore.collection('CarsConstants');
  final colorsCollection = firestore.collection('CarColorsConstants');
  final timeslotsCollection = firestore.collection('Timeslots');
  final timeslotRepeatsCollection = firestore.collection('TimeslotsRepeats');
  final banksCollection = firestore.collection('BanksConstants');
  final citiesCollection = firestore.collection('CitesConstants');
  final neighborhoodsCollection = firestore.collection('NeighborhoodsConstants');
  final ordersCollection = firestore.collection('Orders');
  final serviceProvidersCollection = firestore.collection('ServiceProviders');
  final userCarCollection = firestore.collection('UsersCars');
  final couponsCollection = firestore.collection('Coupons');
  final walletsCollection = firestore.collection('Wallets');
  final technicianLiveLocationsCollection = firestore.collection('TechnicianLiveLocations');

  static final firestore = FirebaseFirestore.instance;
}
