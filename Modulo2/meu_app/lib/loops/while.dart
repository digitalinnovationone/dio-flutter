import 'dart:convert';
import 'dart:io';

void main(List<String> arguments) {
  var contador = 0;
  var total = 10;
  while (contador < total) {
    contador = contador + 1;
    print(contador);
  }

  print("Digite um número ou 'S' para sair");
  var line = stdin.readLineSync(encoding: utf8);
  double acumulador = 0;
  while (line != "S") {
    var numero = double.parse(line ?? "");
    acumulador = acumulador + numero;
    print("Digite um número ou 'S' para sair");
    line = stdin.readLineSync(encoding: utf8);
  }
  print(acumulador);
}
