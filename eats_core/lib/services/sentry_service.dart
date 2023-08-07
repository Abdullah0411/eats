// import 'package:sentry_flutter/sentry_flutter.dart';

import 'package:eats_core/utilis/logger/g_logger.dart';

class SentryService {
  static Future<void> captureException(
    dynamic exception, {
    dynamic stackTrace,
  }) async {
    GLogger.warning("Sentry is disabled");
    // await Sentry.captureException(
    //   exception,
    //   stackTrace: stackTrace,
    // );
  }
}
