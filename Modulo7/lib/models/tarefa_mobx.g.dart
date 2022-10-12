// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tarefa_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TarefaStore on _TarefaStore, Store {
  late final _$descricaoAtom =
      Atom(name: '_TarefaStore.descricao', context: context);

  @override
  String get descricao {
    _$descricaoAtom.reportRead();
    return super.descricao;
  }

  @override
  set descricao(String value) {
    _$descricaoAtom.reportWrite(value, super.descricao, () {
      super.descricao = value;
    });
  }

  late final _$concluidoAtom =
      Atom(name: '_TarefaStore.concluido', context: context);

  @override
  bool get concluido {
    _$concluidoAtom.reportRead();
    return super.concluido;
  }

  @override
  set concluido(bool value) {
    _$concluidoAtom.reportWrite(value, super.concluido, () {
      super.concluido = value;
    });
  }

  late final _$_TarefaStoreActionController =
      ActionController(name: '_TarefaStore', context: context);

  @override
  dynamic alterar(String pDescricao, bool pConcluido) {
    final _$actionInfo = _$_TarefaStoreActionController.startAction(
        name: '_TarefaStore.alterar');
    try {
      return super.alterar(pDescricao, pConcluido);
    } finally {
      _$_TarefaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
descricao: ${descricao},
concluido: ${concluido}
    ''';
  }
}
