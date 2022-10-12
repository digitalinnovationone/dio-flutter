import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'tarefa_mobx.g.dart';

class TarefaStore = _TarefaStore with _$TarefaStore;

abstract class _TarefaStore with Store {
  final String id = UniqueKey().toString();

  @observable
  String descricao = "";

  @observable
  bool concluido = false;

  _TarefaStore(this.descricao, this.concluido);

  @action
  alterar(String pDescricao, bool pConcluido) {
    descricao = pDescricao;
    concluido = pConcluido;
  }
}
