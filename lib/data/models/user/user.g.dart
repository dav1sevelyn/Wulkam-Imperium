// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 1;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      balance: fields[0] as int?,
      availableBoosters: (fields[1] as List?)?.cast<String>(),
      availableClickers: (fields[2] as List?)?.cast<String>(),
      activeClicker: fields[3] as String?,
    )..lastUpdate = fields[4] as DateTime?;
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.balance)
      ..writeByte(1)
      ..write(obj.availableBoosters)
      ..writeByte(2)
      ..write(obj.availableClickers)
      ..writeByte(3)
      ..write(obj.activeClicker)
      ..writeByte(4)
      ..write(obj.lastUpdate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
