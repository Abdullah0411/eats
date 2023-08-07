import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eats_client/environments/services/environment_services.dart';
import 'package:eats_client/splash_screen/views/splash_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:eats_client/theme/theme_manager.dart';

import 'localization/app_localization.dart';
import 'localization/constants.dart';

class App extends ConsumerStatefulWidget {
  const App({Key? key}) : super(key: key);

  static Locale currentLocale = window.locale;
  static String get lang => currentLocale.languageCode;
  static String get langAlt => currentLocale.languageCode == 'en' ? 'ar' : 'en';
  static String get localeCode =>
      currentLocale.languageCode == 'ar' ? 'ar_SA' : 'en';

  static late GlobalKey<NavigatorState>? navigatorKey;

  static void setLocale(BuildContext context) {
    _AppState? state = context.findAncestorStateOfType<_AppState>();
    state?.setLocale(currentLocale);
  }

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  Locale _locale = App.currentLocale;
  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void initState() {
    super.initState();
    App.navigatorKey = GlobalKey<NavigatorState>();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        designSize: const Size(375, 812),
        builder: (context, child) {
          return GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: MaterialApp(
              theme: ref.watch(ThemeManager.themeProvider),
              locale: _locale,
              navigatorKey: App.navigatorKey,
              supportedLocales: appSupportedLocales,
              debugShowCheckedModeBanner: false,
              localizationsDelegates: const [
                AppLocalization.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              home: const SplashScreen(),
            ),
          );
        });
  }
}
