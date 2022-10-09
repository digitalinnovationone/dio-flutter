import 'package:flutter/cupertino.dart';
import 'package:trilhaapp/models/tarefa.dart';

class TarefaRepository extends ChangeNotifier {
  final _tarefas = <Tarefa>[];
  var _apenasNaoConcluidos = false;

  set apenasNaoConcluidos(bool value) {
    _apenasNaoConcluidos = value;
    notifyListeners();
  }

  bool get apenasNaoConcluidos => _apenasNaoConcluidos;

  get tarefas => _apenasNaoConcluidos
      ? _tarefas.where((element) => !element.concluido).toList()
      : _tarefas;

  adicionar(Tarefa tarefa) {
    _tarefas.add(tarefa);
    notifyListeners();
  }

  alterar(String id, bool concluido) {
    _tarefas.where((element) => element.id == id).first.concluido = concluido;
    notifyListeners();
  }

  remover(String id) {
    _tarefas.remove(_tarefas.where((element) => element.id == id).first);
    notifyListeners();
  }
}
