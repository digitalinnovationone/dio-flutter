import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:trilhaapp/repository/comments_repository.dart';
import 'package:trilhaapp/repository/impl/comments_dio_repository.dart';
import 'package:trilhaapp/repository/impl/posts_dio_repository.dart';
import 'package:trilhaapp/repository/jsonplaceholder_custon_dio.dart';
import 'package:trilhaapp/repository/posts_repository.dart';
import 'package:trilhaapp/service/counter_mobx_service.dart';
import 'models/lista_tarefa_store.dart';
import 'my_app.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

setupGetIt() {
  getIt.registerSingleton<CounterMobXService>(CounterMobXService());
  getIt.registerSingleton<JsonPlaceHolderCustonDio>(JsonPlaceHolderCustonDio());
  getIt.registerSingleton<PostsRepository>(
      PostsDioRepository(getIt<JsonPlaceHolderCustonDio>()));
  getIt.registerSingleton<CommentsRepository>(
      CommentsDioRepsositoy(getIt<JsonPlaceHolderCustonDio>()));
  getIt.registerSingleton<ListaTarefasStore>(ListaTarefasStore());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  setupGetIt();

  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en', 'US'), Locale('pt', 'BR')],
        path:
            'assets/translations', // <-- change the path of the translation files
        fallbackLocale: const Locale('pt', 'BR'),
        child: const MyApp()),
  );
}
