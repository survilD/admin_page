// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ModelAdapter extends TypeAdapter<Model> {
  @override
  final int typeId = 0;

  @override
  Model read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Model()
      ..name = fields[0] as String
      ..position = fields[1] as String
      ..type = fields[2] as String
      ..gender = fields[3] as String
      ..postedDate = fields[4] as DateTime?
      ..lastDateApply = fields[5] as DateTime
      ..closeDate = fields[6] as DateTime
      ..active = fields[7] as bool;
  }

  @override
  void write(BinaryWriter writer, Model obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.position)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.gender)
      ..writeByte(4)
      ..write(obj.postedDate)
      ..writeByte(5)
      ..write(obj.lastDateApply)
      ..writeByte(6)
      ..write(obj.closeDate)
      ..writeByte(7)
      ..write(obj.active);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is ModelAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
