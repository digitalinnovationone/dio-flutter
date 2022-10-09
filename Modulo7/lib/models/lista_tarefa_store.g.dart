// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lista_tarefa_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ListaTarefasStore on _ListaTarefasStore, Store {
  Computed<List<TarefaStore>>? _$tarefasComputed;

  @override
  List<TarefaStore> get tarefas =>
      (_$tarefasComputed ??= Computed<List<TarefaStore>>(() => super.tarefas,
              name: '_ListaTarefasStore.tarefas'))
          .value;

  late final _$_apenasNaoConluidosAtom =
      Atom(name: '_ListaTarefasStore._apenasNaoConluidos', context: context);

  @override
  Observable<bool> get _apenasNaoConluidos {
    _$_apenasNaoConluidosAtom.reportRead();
    return super._apenasNaoConluidos;
  }

  @override
  set _apenasNaoConluidos(Observable<bool> value) {
    _$_apenasNaoConluidosAtom.reportWrite(value, super._apenasNaoConluidos, () {
      super._apenasNaoConluidos = value;
    });
  }

  late final _$_ListaTarefasStoreActionController =
      ActionController(name: '_ListaTarefasStore', context: context);

  @override
  void setNaoConcluidos(bool value) {
    final _$actionInfo = _$_ListaTarefasStoreActionController.startAction(
        name: '_ListaTarefasStore.setNaoConcluidos');
    try {
      return super.setNaoConcluidos(value);
    } finally {
      _$_ListaTarefasStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void adicionar(String descricao) {
    final _$actionInfo = _$_ListaTarefasStoreActionController.startAction(
        name: '_ListaTarefasStore.adicionar');
    try {
      return super.adicionar(descricao);
    } finally {
      _$_ListaTarefasStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void alterar(String id, String descricao, bool concluido) {
    final _$actionInfo = _$_ListaTarefasStoreActionController.startAction(
        name: '_ListaTarefasStore.alterar');
    try {
      return super.alterar(id, descricao, concluido);
    } finally {
      _$_ListaTarefasStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void excluir(String id) {
    final _$actionInfo = _$_ListaTarefasStoreActionController.startAction(
        name: '_ListaTarefasStore.excluir');
    try {
      return super.excluir(id);
    } finally {
      _$_ListaTarefasStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tarefas: ${tarefas}
    ''';
  }
}
