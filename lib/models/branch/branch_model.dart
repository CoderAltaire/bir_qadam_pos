import '../../core/core.dart';
import '../../hive_helper/hive_helper.dart';
part 'branch_model.g.dart';

@HiveType(typeId: HiveTypes.branch, adapterName: HiveAdapters.branch)
class BranchModel extends HiveObject {
  @override
  get key => id;
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? createdAt;
  @HiveField(2)
  String? updatedAt;
  @HiveField(3)
  String? name;
  @HiveField(4)
  String? nameUz;
  @HiveField(5)
  String? nameEn;
  @HiveField(6)
  String? nameRu;
  @HiveField(7)
  String? description;
  @HiveField(8)
  String? descriptionUz;
  @HiveField(9)
  String? descriptionEn;
  @HiveField(10)
  String? descriptionRu;
  @HiveField(11)
  String? phone;
  @HiveField(12)
  String? address;
  @HiveField(13)
  bool? isActive;
  @HiveField(14)
  String? monOpenTime;
  @HiveField(15)
  String? monCloseTime;
  @HiveField(16)
  String? tueOpenTime;
  @HiveField(17)
  String? tueCloseTime;
  @HiveField(18)
  String? wedOpenTime;
  @HiveField(19)
  String? wedCloseTime;
  @HiveField(20)
  String? thuOpenTime;
  @HiveField(21)
  String? thuCloseTime;
  @HiveField(22)
  String? friOpenTime;
  @HiveField(23)
  String? friCloseTime;
  @HiveField(24)
  String? satOpenTime;
  @HiveField(25)
  String? satCloseTime;
  @HiveField(26)
  String? sunOpenTime;
  @HiveField(27)
  String? sunCloseTime;
  @HiveField(28)
  CreatedByModel? cCreatedBy;
  @HiveField(29)
  CreatedByModel? cModifiedBy;
  @HiveField(30)
  MainWarehouseModel? mainWarehouse;

  BranchModel(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.name,
      this.nameUz,
      this.nameEn,
      this.nameRu,
      this.description,
      this.descriptionUz,
      this.descriptionEn,
      this.descriptionRu,
      this.phone,
      this.address,
      this.isActive,
      this.monOpenTime,
      this.monCloseTime,
      this.tueOpenTime,
      this.tueCloseTime,
      this.wedOpenTime,
      this.wedCloseTime,
      this.thuOpenTime,
      this.thuCloseTime,
      this.friOpenTime,
      this.friCloseTime,
      this.satOpenTime,
      this.satCloseTime,
      this.sunOpenTime,
      this.sunCloseTime,
      this.cCreatedBy,
      this.cModifiedBy,
      this.mainWarehouse});

  BranchModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
    nameUz = json['name_uz'];
    nameEn = json['name_en'];
    nameRu = json['name_ru'];
    description = json['description'];
    descriptionUz = json['description_uz'];
    descriptionEn = json['description_en'];
    descriptionRu = json['description_ru'];
    phone = json['phone'];
    address = json['address'];
    isActive = json['is_active'];
    monOpenTime = json['mon_open_time'];
    monCloseTime = json['mon_close_time'];
    tueOpenTime = json['tue_open_time'];
    tueCloseTime = json['tue_close_time'];
    wedOpenTime = json['wed_open_time'];
    wedCloseTime = json['wed_close_time'];
    thuOpenTime = json['thu_open_time'];
    thuCloseTime = json['thu_close_time'];
    friOpenTime = json['fri_open_time'];
    friCloseTime = json['fri_close_time'];
    satOpenTime = json['sat_open_time'];
    satCloseTime = json['sat_close_time'];
    sunOpenTime = json['sun_open_time'];
    sunCloseTime = json['sun_close_time'];
    cCreatedBy = json['_created_by'] != null
        ? CreatedByModel.fromJson(json['_created_by'])
        : null;
    cModifiedBy = json['_modified_by'] != null
        ? CreatedByModel.fromJson(json['_modified_by'])
        : null;
    mainWarehouse = json['main_warehouse'] != null
        ? MainWarehouseModel.fromJson(json['main_warehouse'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['name'] = name;
    data['name_uz'] = nameUz;
    data['name_en'] = nameEn;
    data['name_ru'] = nameRu;
    data['description'] = description;
    data['description_uz'] = descriptionUz;
    data['description_en'] = descriptionEn;
    data['description_ru'] = descriptionRu;
    data['phone'] = phone;
    data['address'] = address;
    data['is_active'] = isActive;
    data['mon_open_time'] = monOpenTime;
    data['mon_close_time'] = monCloseTime;
    data['tue_open_time'] = tueOpenTime;
    data['tue_close_time'] = tueCloseTime;
    data['wed_open_time'] = wedOpenTime;
    data['wed_close_time'] = wedCloseTime;
    data['thu_open_time'] = thuOpenTime;
    data['thu_close_time'] = thuCloseTime;
    data['fri_open_time'] = friOpenTime;
    data['fri_close_time'] = friCloseTime;
    data['sat_open_time'] = satOpenTime;
    data['sat_close_time'] = satCloseTime;
    data['sun_open_time'] = sunOpenTime;
    data['sun_close_time'] = sunCloseTime;
    if (cCreatedBy != null) {
      data['_created_by'] = cCreatedBy!.toJson();
    }
    if (cModifiedBy != null) {
      data['_modified_by'] = cModifiedBy!.toJson();
    }
    if (mainWarehouse != null) {
      data['main_warehouse'] = mainWarehouse!.toJson();
    }
    return data;
  }
}

@HiveType(
    typeId: HiveTypes.createdByModel, adapterName: HiveAdapters.createdByModel)
class CreatedByModel extends HiveObject {
  @override
  get key => id;
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? fullName;

  CreatedByModel({this.id, this.fullName});

  CreatedByModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['full_name'] = fullName;
    return data;
  }
}

@HiveType(
    typeId: HiveTypes.mainWarehouseModel,
    adapterName: HiveAdapters.mainWarehouseModel)
class MainWarehouseModel extends HiveObject {
  @override
  get key => id;
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? nameUz;
  @HiveField(3)
  String? nameRu;
  @HiveField(4)
  String? nameEn;

  MainWarehouseModel(
      {this.id, this.name, this.nameUz, this.nameRu, this.nameEn});

  MainWarehouseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameUz = json['name_uz'];
    nameRu = json['name_ru'];
    nameEn = json['name_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['name_uz'] = nameUz;
    data['name_ru'] = nameRu;
    data['name_en'] = nameEn;
    return data;
  }
}
