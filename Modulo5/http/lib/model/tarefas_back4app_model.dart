class TarefasBack4AppModel {
  List<TarefaBack4AppModel> tarefas = [];

  TarefasBack4AppModel(this.tarefas);

  TarefasBack4AppModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      tarefas = <TarefaBack4AppModel>[];
      json['results'].forEach((v) {
        tarefas.add(TarefaBack4AppModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['results'] = tarefas.map((v) => v.toJson()).toList();
    return data;
  }
}

class TarefaBack4AppModel {
  String objectId = "";
  String descricao = "";
  bool concluido = false;
  String createdAt = "";
  String updatedAt = "";

  TarefaBack4AppModel(this.objectId, this.descricao, this.concluido,
      this.createdAt, this.updatedAt);

  TarefaBack4AppModel.criar(this.descricao, this.concluido);

  TarefaBack4AppModel.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    descricao = json['descricao'];
    concluido = json['concluido'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = objectId;
    data['descricao'] = descricao;
    data['concluido'] = concluido;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }

  Map<String, dynamic> toJsonEndpoint() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['descricao'] = descricao;
    data['concluido'] = concluido;
    return data;
  }
}
