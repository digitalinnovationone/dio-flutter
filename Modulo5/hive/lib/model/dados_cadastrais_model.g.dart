// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dados_cadastrais_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DadosCadastraisModelAdapter extends TypeAdapter<DadosCadastraisModel> {
  @override
  final int typeId = 0;

  @override
  DadosCadastraisModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DadosCadastraisModel()
      ..nome = fields[0] as String?
      ..dataNascimento = fields[1] as DateTime?
      ..nivelExperiencia = fields[2] as String?
      ..linguagens = (fields[3] as List).cast<String>()
      ..tempoExperiencia = fields[4] as int?
      ..salario = fields[5] as double?;
  }

  @override
  void write(BinaryWriter writer, DadosCadastraisModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.nome)
      ..writeByte(1)
      ..write(obj.dataNascimento)
      ..writeByte(2)
      ..write(obj.nivelExperiencia)
      ..writeByte(3)
      ..write(obj.linguagens)
      ..writeByte(4)
      ..write(obj.tempoExperiencia)
      ..writeByte(5)
      ..write(obj.salario);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DadosCadastraisModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
