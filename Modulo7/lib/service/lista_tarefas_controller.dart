import 'package:get/get.dart';
import 'package:trilhaapp/models/tarefa.dart';

class ListaTarefasController extends GetxController {
  List<Tarefa> get tarefas => _apenasNaoConcluidos.value
      ? _tarefas.where((element) => !element.concluido).toList().obs
      : _tarefas.toList().obs;

  var _apenasNaoConcluidos = false.obs;
  bool get apenasNaoConcluidos => _apenasNaoConcluidos.value;
  void setApenasNaoconcluidos(bool value) {
    _apenasNaoConcluidos.value = value;
  }

  RxList<Tarefa> _tarefas = <Tarefa>[].obs;

  adicionar(String descricao) {
    _tarefas.add(Tarefa(descricao, false));
  }

  alterar(String id, String descricao, bool concluido) {
    var tarefa = _tarefas.firstWhere((element) => element.id == id);
    tarefa.descricao = descricao;
    tarefa.concluido = concluido;
    _tarefas.refresh();
  }

  excluir(String id) {
    _tarefas.removeWhere((element) => element.id == id);
  }
}
