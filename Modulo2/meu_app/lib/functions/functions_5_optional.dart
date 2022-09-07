void main(List<String> arguments) {
  printName("Danilo");
  printName("José", sobrenome: "Silva");
}

void printName(String name, {String? sobrenome}) {
  print("My name is: $name");
  if (sobrenome != null) {
    print("My lastname is: $sobrenome");
  }
}
