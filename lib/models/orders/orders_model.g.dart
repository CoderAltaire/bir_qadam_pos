// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderModelAdapter extends TypeAdapter<OrderModel> {
  @override
  final int typeId = 3;

  @override
  OrderModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderModel(
      id: fields[0] as int?,
      customer: fields[1] as CustomerModel?,
      customerAddress: fields[2] as CustomerAddressModel?,
      deliverer: fields[3] as String?,
      createdAt: fields[4] as String?,
      updatedAt: fields[5] as String?,
      status: fields[6] as String?,
      paymentType: fields[7] as String?,
      chosenDeliverer: fields[8] as String?,
      deliverInTheShortestTime: fields[9] as bool?,
      deliveryDate: fields[10] as String?,
      deliveryDatetimeFrom: fields[11] as String?,
      deliveryDatetimeTo: fields[12] as String?,
      deliveryCost: fields[13] as String?,
      qrUrl: fields[14] as String?,
      fiscalSign: fields[15] as String?,
      receiptSeq: fields[16] as String?,
      terminalId: fields[17] as String?,
      virtualNumber: fields[18] as String?,
      price: fields[19] as String?,
      actualPrice: fields[20] as String?,
      source: fields[21] as String?,
      note: fields[22] as String?,
      canceledBy: fields[24] as String?,
      paymentStatus: fields[25] as String?,
      payOnline: fields[26] as String?,
      payCash: fields[27] as String?,
      payFromBalance: fields[28] as String?,
      payWithCard: fields[29] as String?,
      receivedOnline: fields[30] as String?,
      receivedCash: fields[31] as String?,
      receivedFromBalance: fields[32] as String?,
      receivedFromCard: fields[33] as String?,
      cCreatedBy: fields[34] as CreatedByModel?,
      cModifiedBy: fields[35] as CreatedByModel?,
      clientOrder: fields[36] as int?,
      branch: fields[37] as BranchModel?,
      warehouse: fields[38] as BranchModel?,
      items: (fields[40] as List?)?.cast<ItemModel>(),
      finalSum: fields[39] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, OrderModel obj) {
    writer
      ..writeByte(40)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.customer)
      ..writeByte(2)
      ..write(obj.customerAddress)
      ..writeByte(3)
      ..write(obj.deliverer)
      ..writeByte(4)
      ..write(obj.createdAt)
      ..writeByte(5)
      ..write(obj.updatedAt)
      ..writeByte(6)
      ..write(obj.status)
      ..writeByte(7)
      ..write(obj.paymentType)
      ..writeByte(8)
      ..write(obj.chosenDeliverer)
      ..writeByte(9)
      ..write(obj.deliverInTheShortestTime)
      ..writeByte(10)
      ..write(obj.deliveryDate)
      ..writeByte(11)
      ..write(obj.deliveryDatetimeFrom)
      ..writeByte(12)
      ..write(obj.deliveryDatetimeTo)
      ..writeByte(13)
      ..write(obj.deliveryCost)
      ..writeByte(14)
      ..write(obj.qrUrl)
      ..writeByte(15)
      ..write(obj.fiscalSign)
      ..writeByte(16)
      ..write(obj.receiptSeq)
      ..writeByte(17)
      ..write(obj.terminalId)
      ..writeByte(18)
      ..write(obj.virtualNumber)
      ..writeByte(19)
      ..write(obj.price)
      ..writeByte(20)
      ..write(obj.actualPrice)
      ..writeByte(21)
      ..write(obj.source)
      ..writeByte(22)
      ..write(obj.note)
      ..writeByte(24)
      ..write(obj.canceledBy)
      ..writeByte(25)
      ..write(obj.paymentStatus)
      ..writeByte(26)
      ..write(obj.payOnline)
      ..writeByte(27)
      ..write(obj.payCash)
      ..writeByte(28)
      ..write(obj.payFromBalance)
      ..writeByte(29)
      ..write(obj.payWithCard)
      ..writeByte(30)
      ..write(obj.receivedOnline)
      ..writeByte(31)
      ..write(obj.receivedCash)
      ..writeByte(32)
      ..write(obj.receivedFromBalance)
      ..writeByte(33)
      ..write(obj.receivedFromCard)
      ..writeByte(34)
      ..write(obj.cCreatedBy)
      ..writeByte(35)
      ..write(obj.cModifiedBy)
      ..writeByte(36)
      ..write(obj.clientOrder)
      ..writeByte(37)
      ..write(obj.branch)
      ..writeByte(38)
      ..write(obj.warehouse)
      ..writeByte(39)
      ..write(obj.finalSum)
      ..writeByte(40)
      ..write(obj.items);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CustomerAdapter extends TypeAdapter<CustomerModel> {
  @override
  final int typeId = 4;

  @override
  CustomerModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CustomerModel(
      id: fields[0] as int?,
      phone: fields[1] as String?,
      fullName: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CustomerModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.phone)
      ..writeByte(2)
      ..write(obj.fullName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CustomerAddressAdapter extends TypeAdapter<CustomerAddressModel> {
  @override
  final int typeId = 6;

  @override
  CustomerAddressModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CustomerAddressModel(
      id: fields[0] as int?,
      location: fields[1] as LocationModel?,
      createdAt: fields[2] as String?,
      updatedAt: fields[3] as String?,
      name: fields[4] as String?,
      address: fields[5] as String?,
      type: fields[6] as String?,
      apartment: fields[7] as String?,
      entrance: fields[8] as String?,
      floor: fields[9] as String?,
      target: fields[10] as String?,
      streetName: fields[11] as String?,
      isDeliverable: fields[12] as bool?,
      hasDeliverableRequest: fields[13] as bool?,
      isDefault: fields[14] as bool?,
      isDelete: fields[15] as bool?,
      sCreatedBy: fields[16] as String?,
      sModifiedBy: fields[17] as String?,
      customer: fields[18] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, CustomerAddressModel obj) {
    writer
      ..writeByte(19)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.location)
      ..writeByte(2)
      ..write(obj.createdAt)
      ..writeByte(3)
      ..write(obj.updatedAt)
      ..writeByte(4)
      ..write(obj.name)
      ..writeByte(5)
      ..write(obj.address)
      ..writeByte(6)
      ..write(obj.type)
      ..writeByte(7)
      ..write(obj.apartment)
      ..writeByte(8)
      ..write(obj.entrance)
      ..writeByte(9)
      ..write(obj.floor)
      ..writeByte(10)
      ..write(obj.target)
      ..writeByte(11)
      ..write(obj.streetName)
      ..writeByte(12)
      ..write(obj.isDeliverable)
      ..writeByte(13)
      ..write(obj.hasDeliverableRequest)
      ..writeByte(14)
      ..write(obj.isDefault)
      ..writeByte(15)
      ..write(obj.isDelete)
      ..writeByte(16)
      ..write(obj.sCreatedBy)
      ..writeByte(17)
      ..write(obj.sModifiedBy)
      ..writeByte(18)
      ..write(obj.customer);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomerAddressAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LocationModelAdapter extends TypeAdapter<LocationModel> {
  @override
  final int typeId = 7;

  @override
  LocationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocationModel(
      latitude: fields[0] as double?,
      longitude: fields[1] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, LocationModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.latitude)
      ..writeByte(1)
      ..write(obj.longitude);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
