import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:trilhaapp/service/count_mobx_store.dart';

import '../../service/counter_mobx_service.dart';

class ContadorMobXStorePage extends StatelessWidget {
  ContadorMobXStorePage({super.key});
  CounterMobXSore contadorMobXStore = CounterMobXSore();

  @override
  Widget build(BuildContext context) {
    print("build");
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Contador MobX Store",
          style: TextStyle(fontSize: 26),
        ),
        Observer(builder: (context) {
          return Text(
            "${contadorMobXStore.contador}",
            style: TextStyle(fontSize: 26),
          );
        }),
        TextButton(
            onPressed: () {
              contadorMobXStore.incrementar();
            },
            child: Text("Incrementar")),
      ],
    );
  }
}
