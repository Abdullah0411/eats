import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreCollections {
  static final users = firestore.collection('users');
  static final restaurants = firestore.collection('restaurant');
  static final meal = firestore.collection('meals');
  static final cart = firestore.collection('carts');
  static final order = firestore.collection('orders');
  static final menu = firestore.collection('menu');
  static final firestore = FirebaseFirestore.instance;
}
