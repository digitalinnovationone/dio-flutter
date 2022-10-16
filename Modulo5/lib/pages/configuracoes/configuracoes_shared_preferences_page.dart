import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trilhaapp/services/app_storage_service.dart';

class ConfiguracoesSharedPreferencesPage extends StatefulWidget {
  const ConfiguracoesSharedPreferencesPage({Key? key}) : super(key: key);

  @override
  State<ConfiguracoesSharedPreferencesPage> createState() =>
      _ConfiguracoesSharedPreferencesPageState();
}

class _ConfiguracoesSharedPreferencesPageState
    extends State<ConfiguracoesSharedPreferencesPage> {
  AppStorageService storage = AppStorageService();

  TextEditingController nomeUsuarioController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  String? nomeUsuario;
  double? altura;
  bool receberNotificacoes = false;
  bool temaEscuro = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    nomeUsuarioController.text = await storage.getConfiguracoesNomeUsuario();
    alturaController.text =
        (await (storage.getConfiguracoesAltura())).toString();
    receberNotificacoes = await storage.getConfiguracoesReceberNotificacao();
    temaEscuro = await storage.getConfiguracoesTemaEscuro();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(title: Text("Configurações")),
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
                        receberNotificacoes = value;
                      });
                    },
                    value: receberNotificacoes,
                  ),
                  SwitchListTile(
                      title: Text("Tema escuro"),
                      value: temaEscuro,
                      onChanged: (bool value) {
                        setState(() {
                          temaEscuro = value;
                        });
                      }),
                  TextButton(
                      onPressed: () async {
                        FocusManager.instance.primaryFocus?.unfocus();
                        try {
                          await storage.setConfiguracoesAltura(
                              double.parse(alturaController.text));
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
                        await storage.setConfiguracoesNomeUsuario(
                            nomeUsuarioController.text);
                        await storage.setConfiguracoesReceberNotificacao(
                            receberNotificacoes);
                        await storage.setConfiguracoesTemaEscuro(temaEscuro);
                        Navigator.pop(context);
                      },
                      child: Text("Salvar"))
                ],
              ),
            )));
  }
}
