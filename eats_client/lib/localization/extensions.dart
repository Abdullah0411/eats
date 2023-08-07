import 'package:eats_client/app.dart';
import 'package:eats_core/models/translatable.dart';
import 'package:eats_core/utilis/logger/g_logger.dart';

import 'controllers.dart' as controller;

extension StringTranslation on String {
  String translate({List<String> arguments = const [], String? parent}) {
    return parent != null
        ? controller.translate('$parent.$this', arguments: arguments)
        : controller.translate(this, arguments: arguments);
  }
}

extension TranslateTranslatable on Translatable {
  String get translated {
    try {
      final translatedText = App.currentLocale.languageCode == 'ar' ? ar : en;

      return translatedText;
    } catch (e) {
      GLogger.error('$e');

      GLogger.warning("Couldn't translate $this, will return empty string");

      return '';
    }
  }
}
