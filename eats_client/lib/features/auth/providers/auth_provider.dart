import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eats_core/services/auth_services.dart';

/// This provider is responsible for the authentication state of the user.
final authChangesStreamProvider =
    StreamProvider((ref) => FirebaseAuthServices.authChange);
