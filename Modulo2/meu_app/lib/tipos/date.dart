void main(List<String> arguments) {
  DateTime data1 = DateTime.now();
  data1 = DateTime.parse("2022-02-01 00:00:00");

  // Partes da data
  print(data1);
  print(data1.day);
  print(data1.month);
  print(data1.year);
  print(data1.hour);
  print(data1.microsecond);
  print(data1.second);

  // Dia da semana
  print(data1.weekday);

  // Obtem o tamanho da String
  print(data1.add(Duration(days: 1)));
  print(data1);
  print(data1.subtract(Duration(hours: 1)));
  print(data1);

  var data2 = DateTime.parse("2022-02-01 00:00:00");
  print(data1.isAfter(data2));
  print(data1.isBefore(data2));
  print(data1.compareTo(data2));
}
