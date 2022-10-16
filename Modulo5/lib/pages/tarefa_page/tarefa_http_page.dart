import 'package:flutter/material.dart';
import 'package:trilhaapp/model/tarefa.dart';
import 'package:trilhaapp/model/tarefa_hive_model.dart';
import 'package:trilhaapp/model/tarefa_sqlite_model.dart';
import 'package:trilhaapp/repositories/back4app/tarefas_back4app_repository.dart';
import 'package:trilhaapp/repositories/sqlite/tarefa_sqllite_repository.dart';
import 'package:trilhaapp/repositories/tarefa_hive_repository.dart';
import 'package:trilhaapp/repositories/tarefa_repository.dart';

import '../../model/tarefas_back4app_model.dart';

class TarefaHttpPage extends StatefulWidget {
  const TarefaHttpPage({Key? key}) : super(key: key);

  @override
  State<TarefaHttpPage> createState() => _TarefaHttpPageState();
}

class _TarefaHttpPageState extends State<TarefaHttpPage> {
  TarefasBack4AppRepositoy tarefaRepository = TarefasBack4AppRepositoy();
  var _tarefasBack4App = TarefasBack4AppModel([]);
  var descricaoContoller = TextEditingController();
  var apenasNaoConcluidos = false;
  var carregando = false;

  @override
  void initState() {
    super.initState();
    obterTarefas();
  }

  void obterTarefas() async {
    setState(() {
      carregando = true;
    });
    _tarefasBack4App = await tarefaRepository.obterTarefas(apenasNaoConcluidos);
    setState(() {
      carregando = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Tarefas HTTP"),
        ),
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
                            await tarefaRepository.criar(
                                TarefaBack4AppModel.criar(
                                    descricaoContoller.text, false));
                            Navigator.pop(context);
                            obterTarefas();
                            setState(() {});
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
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Apenas não concluídos",
                      style: TextStyle(fontSize: 18),
                    ),
                    Switch(
                        value: apenasNaoConcluidos,
                        onChanged: (bool value) {
                          apenasNaoConcluidos = value;
                          obterTarefas();
                        })
                  ],
                ),
              ),
              carregando
                  ? CircularProgressIndicator()
                  : Expanded(
                      child: ListView.builder(
                          itemCount: _tarefasBack4App.tarefas.length,
                          itemBuilder: (BuildContext bc, int index) {
                            var tarefa = _tarefasBack4App.tarefas[index];
                            return Dismissible(
                              onDismissed:
                                  (DismissDirection dismissDirection) async {
                                await tarefaRepository.remover(tarefa.objectId);
                                obterTarefas();
                              },
                              key: Key(tarefa.descricao),
                              child: ListTile(
                                title: Text(tarefa.descricao),
                                trailing: Switch(
                                  onChanged: (bool value) async {
                                    tarefa.concluido = value;
                                    await tarefaRepository.atualizar(tarefa);
                                    obterTarefas();
                                  },
                                  value: tarefa.concluido,
                                ),
                              ),
                            );
                          }),
                    ),
            ],
          ),
        ));
  }
}
