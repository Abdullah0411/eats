import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eats_core/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

final authRepo = Provider<FirebaseAuthServices>(
  (ref) => FirebaseAuthServices(),
);

final currentUserStreamProvider = StreamProvider<User?>(
  (ref) => FirebaseAuthServices.authChange,
);
