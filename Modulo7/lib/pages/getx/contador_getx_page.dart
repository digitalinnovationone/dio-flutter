import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trilhaapp/service/contador_get_controller.dart';

class ContadorGetXPage extends StatelessWidget {
  ContadorGetXPage({super.key});
  var contadorGetXService = ContadorGetController();

  @override
  Widget build(BuildContext context) {
    print("build");
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Contador GetX",
          style: TextStyle(fontSize: 26),
        ),
        Obx(() {
          return Text(
            "${contadorGetXService.contador}",
            style: TextStyle(fontSize: 26),
          );
        }),
        TextButton(
            onPressed: () {
              contadorGetXService.incrementar();
            },
            child: Text("Incrementar")),
      ],
    );
  }
}
