import 'package:flutter/material.dart';

class DadosCadastraisPage extends StatelessWidget {
  final String texto;
  final List<String> dados;
  const DadosCadastraisPage(
      {Key? key, required this.texto, required this.dados})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(texto)),
      body: Center(
        child: Text(dados.length.toString()),
      ),
    );
  }
}
