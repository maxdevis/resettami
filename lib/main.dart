import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:resettami_app/Screens/Home.dart';
import 'package:resettami_app/Screens/assistiti/Anamnesi/main.dart';
import 'package:resettami_app/Screens/assistiti/search.dart';
import 'package:resettami_app/Screens/Splash.dart';
import 'package:resettami_app/Screens/assistiti/searchList.dart';
import 'package:resettami_app/utils/Constants.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/localization.dart';

void main() => runApp(
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const MyApp(),
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocalJsonLocalization.delegate.directories = ['lib/i18n'];
    return MaterialApp(
      locale: DevicePreview.locale(context),
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      navigatorKey: navigatorKey,
      home: const anamnesiScreen(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      builder: EasyLoading.init(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        LocalJsonLocalization.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        if (supportedLocales.contains(locale)) {
          return locale;
        }
        if (locale?.languageCode == 'en') {
          return const Locale('en');
        }
        // default language
        return const Locale('it');
      },
      routes: routes
    );
  }

}


