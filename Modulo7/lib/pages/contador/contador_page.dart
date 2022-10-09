import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trilhaapp/service/contador_service.dart';

class ContadorPage extends StatelessWidget {
  const ContadorPage({super.key});

  @override
  Widget build(BuildContext context) {
    print("build");
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Consumer<ContadorService>(builder: (_, contadorService, wiidget) {
          print("Consumer");
          return Text(
            contadorService.contador.toString(),
            style: TextStyle(fontSize: 26),
          );
        }),
        TextButton(
            onPressed: () {
              Provider.of<ContadorService>(context, listen: false)
                  .incrementar();
            },
            child: Text("Incrementar")),
      ],
    );
  }
}
