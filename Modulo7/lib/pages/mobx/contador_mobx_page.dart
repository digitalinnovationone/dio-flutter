import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../service/counter_mobx_service.dart';

class ContadorMobXPage extends StatelessWidget {
  ContadorMobXPage({super.key});
  CounterMobXService contadorMobXService = CounterMobXService();

  @override
  Widget build(BuildContext context) {
    print("build");
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Contador MobX",
          style: TextStyle(fontSize: 26),
        ),
        Observer(builder: (context) {
          return Text(
            "${contadorMobXService.contador}",
            style: TextStyle(fontSize: 26),
          );
        }),
        TextButton(
            onPressed: () {
              contadorMobXService.incrementar();
            },
            child: Text("Incrementar")),
      ],
    );
  }
}
