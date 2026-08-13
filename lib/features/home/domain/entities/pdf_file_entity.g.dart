// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pdf_file_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PdfFileEntityAdapter extends TypeAdapter<PdfFileEntity> {
  @override
  final int typeId = 0;

  @override
  PdfFileEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PdfFileEntity(
      id: fields[0] as String,
      name: fields[1] as String,
      numOfPages: fields[2] as int,
      thumbnailPath: fields[3] as String,
      size: fields[4] as String,
      createdAt: fields[5] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, PdfFileEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.numOfPages)
      ..writeByte(3)
      ..write(obj.thumbnailPath)
      ..writeByte(4)
      ..write(obj.size)
      ..writeByte(5)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PdfFileEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
