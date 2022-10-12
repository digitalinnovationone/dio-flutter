import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../service/gerador_numero_aleatorio_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var numeroGerado = 0;
  var quantidadeCliques = 0;

  @override
  Widget build(BuildContext context) {
    debugPrint("chamando método build");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Meu App",
          style: GoogleFonts.roboto(),
        ),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 200,
              height: 200,
              color: Colors.cyan,
              child: Text(
                "Ações do usuário",
                style: GoogleFonts.acme(fontSize: 20),
              ),
            ),
            SizedBox(
              width: 100,
              height: 100,
              child: Container(
                color: Colors.orange,
                child: Text(
                  "Foi clicado $quantidadeCliques vezes",
                  style: GoogleFonts.acme(fontSize: 20),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.indigo,
              child: Text(
                "O número gerado foi: $numeroGerado",
                style: GoogleFonts.acme(fontSize: 20),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.grey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.red,
                        child: Text(
                          "Nome:",
                          style: GoogleFonts.acme(fontSize: 20),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        color: Colors.blue,
                        child: Text(
                          "Danilo Perez",
                          style: GoogleFonts.acme(fontSize: 20),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.green,
                        child: Text(
                          "30",
                          style: GoogleFonts.acme(fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_box),
          onPressed: () {
            setState(() {
              quantidadeCliques = quantidadeCliques + 1;
              numeroGerado =
                  GeradorNumeroAleatorioService.gerarNumeroAleatorio(1000);
            });
          }),
    );
  }
}
