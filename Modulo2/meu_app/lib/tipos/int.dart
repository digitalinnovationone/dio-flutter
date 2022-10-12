void main(List<String> arguments) {
  int numero1 = 10;
  int numero2 = 11;

  print("Retorna verdadeiro se e somente se esse inteiro for par");
  print(numero1.isEven);
  print(numero2.isEven);

  print("Retorna verdadeiro se e somente se este inteiro for ímpar");
  print(numero1.isOdd);
  print(numero2.isOdd);

  print("Retorna se o número é finito");
  print(numero1.isFinite);

  print("Retorna se o número é infinito");
  print(double.infinity);

  print("Retorna se o número não é um núemro válido");
  print(numero1.isNaN);

  print("Retorna se o número é negativo");
  print((numero1 * -1).isNegative);

  print("Converte String para inteiro");
  print(int.parse("10"));
  print(int.parse("teste"));
  print(int.tryParse("teste"));
}
