import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BrasilFieldsPage extends StatefulWidget {
  const BrasilFieldsPage({super.key});

  @override
  State<BrasilFieldsPage> createState() => _BrasilFieldsPageState();
}

class _BrasilFieldsPageState extends State<BrasilFieldsPage> {
  var controllerCEP = TextEditingController();
  var controllerCPF = TextEditingController();
  var controllerCentavos = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Brasil mask")),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("CEP"),
              TextFormField(
                controller: controllerCEP,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CepInputFormatter(),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("CPF"),
              TextFormField(
                controller: controllerCPF,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CpfInputFormatter(),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("Centavos"),
              TextFormField(
                controller: controllerCentavos,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CentavosInputFormatter(moeda: true),
                ],
              ),
              Center(
                  child: TextButton(
                      onPressed: () {
                        print(CPFValidator.isValid(controllerCPF.text));
                        print(CPFValidator.isValid(CPFValidator.generate()));
                      },
                      child: const Text("Continuar")))
            ],
          ),
        ),
      ),
    );
  }
}
