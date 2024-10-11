// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductModelAdapter extends TypeAdapter<ProductModel> {
  @override
  final int typeId = 10;

  @override
  ProductModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductModel(
      id: fields[0] as int?,
      name: fields[1] as String?,
      nameUz: fields[2] as String?,
      nameRu: fields[3] as String?,
      nameEn: fields[4] as String?,
      orderingNumber: fields[5] as int?,
      ikpu: fields[6] as String?,
      packageCode: fields[7] as String?,
      barcode: fields[8] as String?,
      isActive: fields[9] as bool?,
      hasSeries: fields[10] as bool?,
      isSet: fields[11] as bool?,
      isSold: fields[12] as bool?,
      isRecommended: fields[13] as bool?,
      isPromo: fields[14] as bool?,
      crosssellProducts: (fields[15] as List?)?.cast<String>(),
      regularPrice: fields[16] as String?,
      hasDiscount: fields[17] as bool?,
      discountedPrice: fields[18] as String?,
      discountType: fields[19] as String?,
      discountPercentage: fields[20] as String?,
      discountStartDate: fields[21] as String?,
      discountEndDate: fields[22] as String?,
      activeTimeFrom: fields[23] as String?,
      activeTimeTo: fields[24] as String?,
      isWeight: fields[25] as bool?,
      isPieces: fields[26] as bool?,
      isMobileVisible: fields[27] as bool?,
      category: fields[28] as CategoryModel?,
      trademark: fields[29] as String?,
      unitTypeValue: fields[30] as int?,
      measureSizeValue: fields[31] as String?,
      measureValue: fields[32] as int?,
      sizeWeight: fields[33] as String?,
      sizeHeight: fields[34] as String?,
      sizeLength: fields[35] as String?,
      sizeWidth: fields[36] as String?,
      vat: fields[37] as double?,
      limit: fields[38] as String?,
      mainImage: fields[39] as MainImageModel?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductModel obj) {
    writer
      ..writeByte(40)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.nameUz)
      ..writeByte(3)
      ..write(obj.nameRu)
      ..writeByte(4)
      ..write(obj.nameEn)
      ..writeByte(5)
      ..write(obj.orderingNumber)
      ..writeByte(6)
      ..write(obj.ikpu)
      ..writeByte(7)
      ..write(obj.packageCode)
      ..writeByte(8)
      ..write(obj.barcode)
      ..writeByte(9)
      ..write(obj.isActive)
      ..writeByte(10)
      ..write(obj.hasSeries)
      ..writeByte(11)
      ..write(obj.isSet)
      ..writeByte(12)
      ..write(obj.isSold)
      ..writeByte(13)
      ..write(obj.isRecommended)
      ..writeByte(14)
      ..write(obj.isPromo)
      ..writeByte(15)
      ..write(obj.crosssellProducts)
      ..writeByte(16)
      ..write(obj.regularPrice)
      ..writeByte(17)
      ..write(obj.hasDiscount)
      ..writeByte(18)
      ..write(obj.discountedPrice)
      ..writeByte(19)
      ..write(obj.discountType)
      ..writeByte(20)
      ..write(obj.discountPercentage)
      ..writeByte(21)
      ..write(obj.discountStartDate)
      ..writeByte(22)
      ..write(obj.discountEndDate)
      ..writeByte(23)
      ..write(obj.activeTimeFrom)
      ..writeByte(24)
      ..write(obj.activeTimeTo)
      ..writeByte(25)
      ..write(obj.isWeight)
      ..writeByte(26)
      ..write(obj.isPieces)
      ..writeByte(27)
      ..write(obj.isMobileVisible)
      ..writeByte(28)
      ..write(obj.category)
      ..writeByte(29)
      ..write(obj.trademark)
      ..writeByte(30)
      ..write(obj.unitTypeValue)
      ..writeByte(31)
      ..write(obj.measureSizeValue)
      ..writeByte(32)
      ..write(obj.measureValue)
      ..writeByte(33)
      ..write(obj.sizeWeight)
      ..writeByte(34)
      ..write(obj.sizeHeight)
      ..writeByte(35)
      ..write(obj.sizeLength)
      ..writeByte(36)
      ..write(obj.sizeWidth)
      ..writeByte(37)
      ..write(obj.vat)
      ..writeByte(38)
      ..write(obj.limit)
      ..writeByte(39)
      ..write(obj.mainImage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CategoryModelAdapter extends TypeAdapter<CategoryModel> {
  @override
  final int typeId = 11;

  @override
  CategoryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoryModel(
      id: fields[0] as int?,
      name: fields[1] as String?,
      nameUz: fields[2] as String?,
      nameRu: fields[3] as String?,
      nameEn: fields[4] as String?,
      shortName: fields[5] as String?,
      shortNameUz: fields[6] as String?,
      shortNameRu: fields[7] as String?,
      shortNameEn: fields[8] as String?,
      isActive: fields[9] as bool?,
      image: fields[10] as ImageModel?,
      orderingNumber: fields[11] as int?,
      homePageOrderingNumber: fields[12] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, CategoryModel obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.nameUz)
      ..writeByte(3)
      ..write(obj.nameRu)
      ..writeByte(4)
      ..write(obj.nameEn)
      ..writeByte(5)
      ..write(obj.shortName)
      ..writeByte(6)
      ..write(obj.shortNameUz)
      ..writeByte(7)
      ..write(obj.shortNameRu)
      ..writeByte(8)
      ..write(obj.shortNameEn)
      ..writeByte(9)
      ..write(obj.isActive)
      ..writeByte(10)
      ..write(obj.image)
      ..writeByte(11)
      ..write(obj.orderingNumber)
      ..writeByte(12)
      ..write(obj.homePageOrderingNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ImageModelAdapter extends TypeAdapter<ImageModel> {
  @override
  final int typeId = 12;

  @override
  ImageModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImageModel(
      id: fields[0] as int?,
      normal: fields[2] as String?,
      small: fields[3] as String?,
      icon: fields[4] as String?,
      original: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ImageModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.normal)
      ..writeByte(3)
      ..write(obj.small)
      ..writeByte(4)
      ..write(obj.icon)
      ..writeByte(5)
      ..write(obj.original);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MainImageModelAdapter extends TypeAdapter<MainImageModel> {
  @override
  final int typeId = 13;

  @override
  MainImageModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MainImageModel(
      id: fields[0] as int?,
      normal: fields[1] as String?,
      small: fields[2] as String?,
      icon: fields[3] as String?,
      isMain: fields[4] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, MainImageModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.normal)
      ..writeByte(2)
      ..write(obj.small)
      ..writeByte(3)
      ..write(obj.icon)
      ..writeByte(4)
      ..write(obj.isMain);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MainImageModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
