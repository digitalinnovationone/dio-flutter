import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:trilhaapp/models/tarefa_mobx.dart';

part 'lista_tarefa_store.g.dart';

// This is the class used by rest of your codebase
class ListaTarefasStore = _ListaTarefasStore with _$ListaTarefasStore;

abstract class _ListaTarefasStore with Store {
  ObservableList<TarefaStore> _tarefas = <TarefaStore>[].asObservable();

  @computed
  List<TarefaStore> get tarefas => apenasNaoConluidos
      ? _tarefas.where((element) => !element.concluido).toList()
      : _tarefas.toList();

  @observable
  var _apenasNaoConluidos = Observable(false);

  bool get apenasNaoConluidos => _apenasNaoConluidos.value;

  @action
  void setNaoConcluidos(bool value) {
    _apenasNaoConluidos.value = value;
  }

  @action
  void adicionar(String descricao) {
    _tarefas.add(TarefaStore(descricao, false));
  }

  @action
  void alterar(String id, String descricao, bool concluido) {
    var tarefa = _tarefas.firstWhere((element) => element.id == id);
    tarefa.alterar(descricao, concluido);
  }

  @action
  void excluir(String id) {
    _tarefas.removeWhere((element) => element.id == id);
  }
}
