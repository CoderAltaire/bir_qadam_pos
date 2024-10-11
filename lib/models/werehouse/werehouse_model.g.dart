// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'werehouse_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WerehouseModelAdapter extends TypeAdapter<WerehouseModel> {
  @override
  final int typeId = 2;

  @override
  WerehouseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WerehouseModel(
      id: fields[0] as int?,
      createdAt: fields[37] as String?,
      updatedAt: fields[1] as String?,
      name: fields[2] as String?,
      nameUz: fields[3] as String?,
      nameEn: fields[4] as String?,
      nameRu: fields[5] as String?,
      isActive: fields[6] as bool?,
      isMain: fields[7] as bool?,
      type: fields[8] as String?,
      address: fields[9] as String?,
      phone: fields[10] as String?,
      availableShipment: fields[11] as bool?,
      mobileSelling: fields[12] as bool?,
      latitude: fields[13] as double?,
      longitude: fields[14] as double?,
      radius: fields[15] as double?,
      deliveryShortestTime: fields[16] as int?,
      minPercentage: fields[17] as int?,
      maxPercentage: fields[18] as int?,
      monOpenTime: fields[19] as String?,
      monCloseTime: fields[20] as String?,
      tueOpenTime: fields[21] as String?,
      tueCloseTime: fields[22] as String?,
      wedOpenTime: fields[23] as String?,
      wedCloseTime: fields[24] as String?,
      thuOpenTime: fields[25] as String?,
      thuCloseTime: fields[26] as String?,
      friOpenTime: fields[27] as String?,
      friCloseTime: fields[28] as String?,
      satOpenTime: fields[29] as String?,
      satCloseTime: fields[30] as String?,
      sunOpenTime: fields[31] as String?,
      sunCloseTime: fields[32] as String?,
      cCreatedBy: fields[33] as CreatedByModel?,
      cModifiedBy: fields[34] as CreatedByModel?,
      branch: fields[35] as BranchModel?,
      typeDisplay: fields[36] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, WerehouseModel obj) {
    writer
      ..writeByte(38)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.updatedAt)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.nameUz)
      ..writeByte(4)
      ..write(obj.nameEn)
      ..writeByte(5)
      ..write(obj.nameRu)
      ..writeByte(6)
      ..write(obj.isActive)
      ..writeByte(7)
      ..write(obj.isMain)
      ..writeByte(8)
      ..write(obj.type)
      ..writeByte(9)
      ..write(obj.address)
      ..writeByte(10)
      ..write(obj.phone)
      ..writeByte(11)
      ..write(obj.availableShipment)
      ..writeByte(12)
      ..write(obj.mobileSelling)
      ..writeByte(13)
      ..write(obj.latitude)
      ..writeByte(14)
      ..write(obj.longitude)
      ..writeByte(15)
      ..write(obj.radius)
      ..writeByte(16)
      ..write(obj.deliveryShortestTime)
      ..writeByte(17)
      ..write(obj.minPercentage)
      ..writeByte(18)
      ..write(obj.maxPercentage)
      ..writeByte(19)
      ..write(obj.monOpenTime)
      ..writeByte(20)
      ..write(obj.monCloseTime)
      ..writeByte(21)
      ..write(obj.tueOpenTime)
      ..writeByte(22)
      ..write(obj.tueCloseTime)
      ..writeByte(23)
      ..write(obj.wedOpenTime)
      ..writeByte(24)
      ..write(obj.wedCloseTime)
      ..writeByte(25)
      ..write(obj.thuOpenTime)
      ..writeByte(26)
      ..write(obj.thuCloseTime)
      ..writeByte(27)
      ..write(obj.friOpenTime)
      ..writeByte(28)
      ..write(obj.friCloseTime)
      ..writeByte(29)
      ..write(obj.satOpenTime)
      ..writeByte(30)
      ..write(obj.satCloseTime)
      ..writeByte(31)
      ..write(obj.sunOpenTime)
      ..writeByte(32)
      ..write(obj.sunCloseTime)
      ..writeByte(33)
      ..write(obj.cCreatedBy)
      ..writeByte(34)
      ..write(obj.cModifiedBy)
      ..writeByte(35)
      ..write(obj.branch)
      ..writeByte(36)
      ..write(obj.typeDisplay)
      ..writeByte(37)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WerehouseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
