import 'package:meu_app_testes/classes/viacep.dart';
import 'package:meu_app_testes/meu_app_testes.dart' as app;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'meu_app_testes_test.mocks.dart';

@GenerateMocks([MockViaCEP])
void main() {
  test('Calcula o valor do produto com desconto sem porcentagem', () {
    expect(app.calcularDesconto(1000, 150, false), equals(850));
  });

  test(
      'Calcula o valor do produto com desconto sem porcentagem passando valor do produto zerado',
      () {
    expect(() => app.calcularDesconto(0, 150, false),
        throwsA(TypeMatcher<ArgumentError>()));
  });

  test('Calcula o valor do produto com desconto por porcentagem', () {
    expect(app.calcularDesconto(1000, 15, true), equals(850));
  });

  test(
      'Calcula o valor do produto com desconto com porcentagem passando valor do produto zerado',
      () {
    expect(() => app.calcularDesconto(0, 150, false),
        throwsA(TypeMatcher<ArgumentError>()));
  });

  group("Calcula o valor do produto com desconto:", () {
    var valuesToTest = {
      {'valor': 1000, 'desconto': 150, 'percentual': false}: 850,
      {'valor': 1000, 'desconto': 15, 'percentual': true}: 850,
    };
    valuesToTest.forEach((values, expected) {
      test('Entrada: $values Esperado:$expected', () {
        expect(
            app.calcularDesconto(
                double.parse(values["valor"].toString()),
                double.parse(values["desconto"].toString()),
                values["percentual"] == true),
            equals(expected));
      });
    });
  });

  group(
      "Calcula o valor do produto informando valores zerados, deve gerar erro ",
      () {
    var valuesToTest = {
      {'valor': 0, 'desconto': 150, 'percentual': false},
      {'valor': 1000, 'desconto': 0, 'percentual': true},
    };
    for (var values in valuesToTest) {
      test('Entrada: $values', () {
        expect(
            () => app.calcularDesconto(
                double.parse(values["valor"].toString()),
                double.parse(values["desconto"].toString()),
                values["percentual"] == true),
            throwsA(TypeMatcher<ArgumentError>()));
      });
    }
  });

  test('Testar conversão para uppercase', () {
    expect(app.convertToUpper("dio"), equals("DIO"));
  });

  test('Testar conversão para uppercase teste 2', () {
    expect(app.convertToUpper("dio"), equalsIgnoringCase("dio"));
  });

  test('Valor maior que 50', () {
    expect(app.retornaValor(50), greaterThanOrEqualTo(50));
  });

  test('Começa com', () {
    expect(app.convertToUpper("dio"), startsWith("D"));
  });

  test('Valor diferente', () {
    expect(app.retornaValor(50), isNot(equals(49)));
  });

  test('Retornar CEP', () async {
    MockMockViaCEP mockMockViaCEP = MockMockViaCEP();
    when(mockMockViaCEP.retornarCEP("01001000"))
        .thenAnswer((realInvocation) => Future.value({
              "cep": "01001-000",
              "logradouro": "Praça da Sé",
              "complemento": "lado ímpar",
              "bairro": "Sé",
              "localidade": "São Paulo",
              "uf": "SP",
              "ibge": "3550308",
              "gia": "1004",
              "ddd": "11",
              "siafi": "7107"
            }));

    var body = await mockMockViaCEP.retornarCEP("01001000");
    expect(body["bairro"], equals("Sé"));
    expect(body["logradouro"], equals("Praça da Sé"));
  });
}

class MockViaCEP extends Mock implements ViaCEP {}
