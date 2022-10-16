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
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("CEP"),
            TextFormField(
              controller: controllerCEP,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CepInputFormatter(),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text("CPF"),
            TextFormField(
              controller: controllerCPF,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CpfInputFormatter(),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text("Centavos"),
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
                    child: Text("Continuar")))
          ],
        ),
      ),
    );
  }
}
