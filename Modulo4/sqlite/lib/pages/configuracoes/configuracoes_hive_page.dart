import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trilhaapp/model/configuracoes_moel.dart';
import 'package:trilhaapp/repositories/configuracoes_repository.dart';
import 'package:trilhaapp/services/app_storage_service.dart';

class ConfiguracoesHivePage extends StatefulWidget {
  const ConfiguracoesHivePage({Key? key}) : super(key: key);

  @override
  State<ConfiguracoesHivePage> createState() => _ConfiguracoesHivePageState();
}

class _ConfiguracoesHivePageState extends State<ConfiguracoesHivePage> {
  late ConfiguracoesRepository configuracoesRepository;
  var configuracoesModel = ConfiguracoesModel.vazio();

  TextEditingController nomeUsuarioController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    configuracoesRepository = await ConfiguracoesRepository.carregar();
    configuracoesModel = configuracoesRepository.obterDados();
    nomeUsuarioController.text = configuracoesModel.nomeUsuario;
    alturaController.text = configuracoesModel.altura.toString();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(title: Text("Configurações Hive")),
            body: Container(
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      decoration: InputDecoration(hintText: "Nome usuário"),
                      controller: nomeUsuarioController,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(hintText: "Altura"),
                      controller: alturaController,
                    ),
                  ),
                  SwitchListTile(
                    title: Text("Receber notificações"),
                    onChanged: (bool value) {
                      setState(() {
                        configuracoesModel.receberNotificacoes = value;
                      });
                    },
                    value: configuracoesModel.receberNotificacoes,
                  ),
                  SwitchListTile(
                      title: Text("Tema escuro"),
                      value: configuracoesModel.temaEscuro,
                      onChanged: (bool value) {
                        setState(() {
                          configuracoesModel.temaEscuro = value;
                        });
                      }),
                  TextButton(
                      onPressed: () async {
                        FocusManager.instance.primaryFocus?.unfocus();
                        try {
                          configuracoesModel.altura =
                              double.parse(alturaController.text);
                        } catch (e) {
                          showDialog(
                              context: context,
                              builder: (_) {
                                return AlertDialog(
                                  title: Text("Meu App"),
                                  content:
                                      Text("Favor informar uma altura válida!"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Ok"))
                                  ],
                                );
                              });
                          return;
                        }
                        configuracoesModel.nomeUsuario =
                            nomeUsuarioController.text;
                        configuracoesRepository.salvar(configuracoesModel);
                        Navigator.pop(context);
                      },
                      child: Text("Salvar"))
                ],
              ),
            )));
  }
}
