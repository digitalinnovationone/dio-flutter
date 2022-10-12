void main(List<String> arguments) {
  print(executar(10, incrementar));
  print(executar(10, decrementar));
}

int executar(int numero, Function func) {
  return func(numero);
}

int incrementar(int numero) {
  return numero + 1;
}

int decrementar(int numero) {
  return numero - 1;
}
