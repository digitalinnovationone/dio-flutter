import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../models/lista_tarefa_store.dart';

class TarefaMobXPage extends StatelessWidget {
  var descricaoContoller = TextEditingController();
  var listaTarefasStore = ListaTarefasStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            descricaoContoller.text = "";
            showDialog(
                context: context,
                builder: (BuildContext bc) {
                  return AlertDialog(
                    title: const Text("Adicionar tarefa"),
                    content: TextField(
                      controller: descricaoContoller,
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cancelar")),
                      TextButton(
                          onPressed: () async {
                            listaTarefasStore
                                .adicionar(descricaoContoller.text);
                            Navigator.pop(context);
                          },
                          child: const Text("Salvar"))
                    ],
                  );
                });
          },
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              const Text(
                "Tarefas MobX Store",
                style: TextStyle(fontSize: 26),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Apenas não concluídos",
                      style: TextStyle(fontSize: 18),
                    ),
                    Observer(builder: (_) {
                      return Switch(
                          value: listaTarefasStore.apenasNaoConluidos,
                          onChanged: listaTarefasStore.setNaoConcluidos);
                    })
                  ],
                ),
              ),
              Expanded(
                child: Observer(builder: (_) {
                  return ListView.builder(
                      itemCount: listaTarefasStore.tarefas.length,
                      itemBuilder: (BuildContext bc, int index) {
                        var tarefa = listaTarefasStore.tarefas[index];

                        print(tarefa);
                        return Observer(builder: (_) {
                          return Dismissible(
                            onDismissed:
                                (DismissDirection dismissDirection) async {
                              listaTarefasStore.excluir(tarefa.id);
                            },
                            key: Key(tarefa.descricao),
                            child: ListTile(
                              title: Text(tarefa.descricao),
                              trailing: Switch(
                                onChanged: (bool value) async {
                                  //tarefa.concluido = value;
                                  listaTarefasStore.alterar(
                                      tarefa.id, tarefa.descricao, value);
                                },
                                value: tarefa.concluido,
                              ),
                            ),
                          );
                        });
                      });
                }),
              ),
            ],
          ),
        ));
  }
}
