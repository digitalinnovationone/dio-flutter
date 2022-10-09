import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:trilhaapp/pages/home_page.dart';
import 'package:trilhaapp/pages/splash_screen/splash_screen_delay_page.dart';
import 'package:trilhaapp/pages/splash_screen/splash_screen_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:trilhaapp/repository/tarefa_repository.dart';
import 'package:trilhaapp/service/contador_service.dart';
import 'package:trilhaapp/service/dark_mode_service.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DarkModeService>(
            create: (_) => DarkModeService()),
        ChangeNotifierProvider<ContadorService>(
            create: (_) => ContadorService()),
        ChangeNotifierProvider<TarefaRepository>(
            create: (_) => TarefaRepository())
      ],
      child: Consumer<DarkModeService>(builder: (_, darkModeService, widget) {
        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          theme:
              darkModeService.darkMode ? ThemeData.dark() : ThemeData.light(),
          home: const SplashScreenDelayPage(),
        );
      }),
    );
  }
}
