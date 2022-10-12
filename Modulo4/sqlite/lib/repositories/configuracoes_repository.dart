import 'package:hive/hive.dart';
import 'package:trilhaapp/model/configuracoes_moel.dart';

class ConfiguracoesRepository {
  static late Box _box;

  ConfiguracoesRepository._criar();

  static Future<ConfiguracoesRepository> carregar() async {
    if (Hive.isBoxOpen('configuracoes')) {
      _box = Hive.box('configuracoes');
    } else {
      _box = await Hive.openBox('configuracoes');
    }
    return ConfiguracoesRepository._criar();
  }

  void salvar(ConfiguracoesModel configuracoesModel) {
    _box.put('configuracoesModel', {
      'nomeUsuario': configuracoesModel.nomeUsuario,
      'altura': configuracoesModel.altura,
      'receberNotificacoes': configuracoesModel.receberNotificacoes,
      'temaEscuro': configuracoesModel.temaEscuro
    });
  }

  ConfiguracoesModel obterDados() {
    var configuracoes = _box.get('configuracoesModel');
    if (configuracoes == null) {
      return ConfiguracoesModel.vazio();
    }
    return ConfiguracoesModel(
        configuracoes["nomeUsuario"],
        configuracoes["altura"],
        configuracoes["receberNotificacoes"],
        configuracoes["temaEscuro"]);
  }
}
