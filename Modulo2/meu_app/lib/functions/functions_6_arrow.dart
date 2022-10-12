void main(List<String> arguments) {
  printData("Meu texto");
  printData(soma(1, 2).toString());
}

void printData(String texto) => print(texto);

int soma(int numero1, int numero2) => numero1 + numero2;
