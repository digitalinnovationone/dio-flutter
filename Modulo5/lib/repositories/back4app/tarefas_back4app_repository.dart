import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:trilhaapp/model/tarefas_back4app_model.dart';

import 'back4app_custon_dio.dart';

class TarefasBack4AppRepositoy {
  final _custonDio = Back4AppCustonDio();

  TarefasBack4AppRepositoy();

  Future<TarefasBack4AppModel> obterTarefas(bool naoConcluidas) async {
    var url = "/Tarefas";
    if (naoConcluidas) {
      url = "$url?where={\"concluido\":false}";
    }
    var result = await _custonDio.dio.get(url);
    return TarefasBack4AppModel.fromJson(result.data);
  }

  Future<void> criar(TarefaBack4AppModel tarefaBack4AppModel) async {
    try {
      await _custonDio.dio
          .post("/Tarefas", data: tarefaBack4AppModel.toJsonEndpoint());
    } catch (e) {
      throw e;
    }
  }

  Future<void> atualizar(TarefaBack4AppModel tarefaBack4AppModel) async {
    try {
      var response = await _custonDio.dio.put(
          "/Tarefas/${tarefaBack4AppModel.objectId}",
          data: tarefaBack4AppModel.toJsonEndpoint());
    } catch (e) {
      throw e;
    }
  }

  Future<void> remover(String objectId) async {
    try {
      var response = await _custonDio.dio.delete(
        "/Tarefas/$objectId",
      );
    } catch (e) {
      throw e;
    }
  }
}
