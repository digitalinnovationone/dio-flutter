import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trilhaapp/service/contador_service.dart';

class ContadorProviderPage extends StatelessWidget {
  const ContadorProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    print("build");
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Contador Provider",
          style: TextStyle(fontSize: 26),
        ),
        Consumer<ContadorProviderService>(
            builder: (_, contadorService, wiidget) {
          print("Consumer");
          return Text(
            contadorService.contador.toString(),
            style: TextStyle(fontSize: 26),
          );
        }),
        TextButton(
            onPressed: () {
              Provider.of<ContadorProviderService>(context, listen: false)
                  .incrementar();
            },
            child: Text("Incrementar")),
      ],
    );
  }
}
