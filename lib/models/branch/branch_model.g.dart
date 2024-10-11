// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BranchModelAdapter extends TypeAdapter<BranchModel> {
  @override
  final int typeId = 1;

  @override
  BranchModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BranchModel(
      id: fields[0] as int?,
      createdAt: fields[1] as String?,
      updatedAt: fields[2] as String?,
      name: fields[3] as String?,
      nameUz: fields[4] as String?,
      nameEn: fields[5] as String?,
      nameRu: fields[6] as String?,
      description: fields[7] as String?,
      descriptionUz: fields[8] as String?,
      descriptionEn: fields[9] as String?,
      descriptionRu: fields[10] as String?,
      phone: fields[11] as String?,
      address: fields[12] as String?,
      isActive: fields[13] as bool?,
      monOpenTime: fields[14] as String?,
      monCloseTime: fields[15] as String?,
      tueOpenTime: fields[16] as String?,
      tueCloseTime: fields[17] as String?,
      wedOpenTime: fields[18] as String?,
      wedCloseTime: fields[19] as String?,
      thuOpenTime: fields[20] as String?,
      thuCloseTime: fields[21] as String?,
      friOpenTime: fields[22] as String?,
      friCloseTime: fields[23] as String?,
      satOpenTime: fields[24] as String?,
      satCloseTime: fields[25] as String?,
      sunOpenTime: fields[26] as String?,
      sunCloseTime: fields[27] as String?,
      cCreatedBy: fields[28] as CreatedByModel?,
      cModifiedBy: fields[29] as CreatedByModel?,
      mainWarehouse: fields[30] as MainWarehouseModel?,
    );
  }

  @override
  void write(BinaryWriter writer, BranchModel obj) {
    writer
      ..writeByte(31)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.createdAt)
      ..writeByte(2)
      ..write(obj.updatedAt)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.nameUz)
      ..writeByte(5)
      ..write(obj.nameEn)
      ..writeByte(6)
      ..write(obj.nameRu)
      ..writeByte(7)
      ..write(obj.description)
      ..writeByte(8)
      ..write(obj.descriptionUz)
      ..writeByte(9)
      ..write(obj.descriptionEn)
      ..writeByte(10)
      ..write(obj.descriptionRu)
      ..writeByte(11)
      ..write(obj.phone)
      ..writeByte(12)
      ..write(obj.address)
      ..writeByte(13)
      ..write(obj.isActive)
      ..writeByte(14)
      ..write(obj.monOpenTime)
      ..writeByte(15)
      ..write(obj.monCloseTime)
      ..writeByte(16)
      ..write(obj.tueOpenTime)
      ..writeByte(17)
      ..write(obj.tueCloseTime)
      ..writeByte(18)
      ..write(obj.wedOpenTime)
      ..writeByte(19)
      ..write(obj.wedCloseTime)
      ..writeByte(20)
      ..write(obj.thuOpenTime)
      ..writeByte(21)
      ..write(obj.thuCloseTime)
      ..writeByte(22)
      ..write(obj.friOpenTime)
      ..writeByte(23)
      ..write(obj.friCloseTime)
      ..writeByte(24)
      ..write(obj.satOpenTime)
      ..writeByte(25)
      ..write(obj.satCloseTime)
      ..writeByte(26)
      ..write(obj.sunOpenTime)
      ..writeByte(27)
      ..write(obj.sunCloseTime)
      ..writeByte(28)
      ..write(obj.cCreatedBy)
      ..writeByte(29)
      ..write(obj.cModifiedBy)
      ..writeByte(30)
      ..write(obj.mainWarehouse);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BranchModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CreatedByModelAdapter extends TypeAdapter<CreatedByModel> {
  @override
  final int typeId = 8;

  @override
  CreatedByModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CreatedByModel(
      id: fields[0] as int?,
      fullName: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CreatedByModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.fullName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreatedByModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MainWarehouseModelAdapter extends TypeAdapter<MainWarehouseModel> {
  @override
  final int typeId = 9;

  @override
  MainWarehouseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MainWarehouseModel(
      id: fields[0] as int?,
      name: fields[1] as String?,
      nameUz: fields[2] as String?,
      nameRu: fields[3] as String?,
      nameEn: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MainWarehouseModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.nameUz)
      ..writeByte(3)
      ..write(obj.nameRu)
      ..writeByte(4)
      ..write(obj.nameEn);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MainWarehouseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
