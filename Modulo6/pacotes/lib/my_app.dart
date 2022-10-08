import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trilhaapp/pages/home_page.dart';
import 'package:trilhaapp/pages/splash_screen/splash_screen_delay_page.dart';
import 'package:trilhaapp/pages/splash_screen/splash_screen_page.dart';
import 'package:easy_localization/easy_localization.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      home: SplashScreenDelayPage(),
    );
  }
}
