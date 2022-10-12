import 'package:mobx/mobx.dart';

// Include generated file
part 'count_mobx_store.g.dart';

// This is the class used by rest of your codebase
class CounterMobXSore = _CounterMobXSore with _$CounterMobXSore;

// The store-class
abstract class _CounterMobXSore with Store {
  @observable
  int contador = 0;

  @action
  void incrementar() {
    contador++;
  }
}
