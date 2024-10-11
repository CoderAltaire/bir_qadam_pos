// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 0;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel()
      .._sId = fields[0] as String?
      .._phoneNumber = fields[1] as String?
      .._balance = fields[2] as num?
      .._firstName = fields[3] as String?
      .._lastName = fields[4] as String?
      .._birthDate = fields[5] as String?
      .._gender = fields[6] as String?
      .._password = fields[7] as String?
      .._accessToken = fields[8] as String?
      .._fireaseToken = fields[9] as String?
      .._fullName = fields[10] as String?
      .._uiLanguage = fields[11] as UiLanguage?
      .._isActive = fields[12] as bool?
      .._timezone = fields[13] as String?
      .._token = fields[15] as String?
      .._email = fields[16] as String?
      .._image = fields[17] as String?;
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj._sId)
      ..writeByte(1)
      ..write(obj._phoneNumber)
      ..writeByte(2)
      ..write(obj._balance)
      ..writeByte(3)
      ..write(obj._firstName)
      ..writeByte(4)
      ..write(obj._lastName)
      ..writeByte(5)
      ..write(obj._birthDate)
      ..writeByte(6)
      ..write(obj._gender)
      ..writeByte(7)
      ..write(obj._password)
      ..writeByte(8)
      ..write(obj._accessToken)
      ..writeByte(9)
      ..write(obj._fireaseToken)
      ..writeByte(10)
      ..write(obj._fullName)
      ..writeByte(11)
      ..write(obj._uiLanguage)
      ..writeByte(12)
      ..write(obj._isActive)
      ..writeByte(13)
      ..write(obj._timezone)
      ..writeByte(15)
      ..write(obj._token)
      ..writeByte(16)
      ..write(obj._email)
      ..writeByte(17)
      ..write(obj._image);
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

class UiLanguageAdapter extends TypeAdapter<UiLanguage> {
  @override
  final int typeId = 5;

  @override
  UiLanguage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UiLanguage()
      .._text = fields[0] as String?
      .._value = fields[1] as String?;
  }

  @override
  void write(BinaryWriter writer, UiLanguage obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj._text)
      ..writeByte(1)
      ..write(obj._value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UiLanguageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
