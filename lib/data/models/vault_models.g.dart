// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vault_models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VaultEntryAdapter extends TypeAdapter<VaultEntry> {
  @override
  final int typeId = 0;

  @override
  VaultEntry read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VaultEntry(
      id: fields[0] as String,
      type: fields[1] as String,
      title: fields[2] as String,
      content: fields[3] as String,
      timestamp: fields[4] as DateTime,
      metadata: (fields[5] as Map).cast<String, dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, VaultEntry obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.content)
      ..writeByte(4)
      ..write(obj.timestamp)
      ..writeByte(5)
      ..write(obj.metadata);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VaultEntryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
