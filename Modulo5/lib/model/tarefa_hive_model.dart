import 'package:hive/hive.dart';

part 'tarefa_hive_model.g.dart';

@HiveType(typeId: 1)
class TarefaHiveModel extends HiveObject {
  @HiveField(0)
  String descricao = "";

  @HiveField(1)
  bool concluido = false;

  TarefaHiveModel();

  TarefaHiveModel.criar(this.descricao, this.concluido);
}
