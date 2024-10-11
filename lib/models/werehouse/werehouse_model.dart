import 'package:bir_qadam_pos/models/branch/branch_model.dart';

import '../../core/core.dart';
import '../../hive_helper/hive_helper.dart';
part 'werehouse_model.g.dart';

@HiveType(typeId: HiveTypes.werehouse, adapterName: HiveAdapters.werehouse)
class WerehouseModel extends HiveObject {
  @override
  get key => id;
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? updatedAt;
  @HiveField(2)
  String? name;
  @HiveField(3)
  String? nameUz;
  @HiveField(4)
  String? nameEn;
  @HiveField(5)
  String? nameRu;
  @HiveField(6)
  bool? isActive;
  @HiveField(7)
  bool? isMain;
  @HiveField(8)
  String? type;
  @HiveField(9)
  String? address;
  @HiveField(10)
  String? phone;
  @HiveField(11)
  bool? availableShipment;
  @HiveField(12)
  bool? mobileSelling;
  @HiveField(13)
  double? latitude;
  @HiveField(14)
  double? longitude;
  @HiveField(15)
  double? radius;
  @HiveField(16)
  int? deliveryShortestTime;
  @HiveField(17)
  int? minPercentage;
  @HiveField(18)
  int? maxPercentage;
  @HiveField(19)
  String? monOpenTime;
  @HiveField(20)
  String? monCloseTime;
  @HiveField(21)
  String? tueOpenTime;
  @HiveField(22)
  String? tueCloseTime;
  @HiveField(23)
  String? wedOpenTime;
  @HiveField(24)
  String? wedCloseTime;
  @HiveField(25)
  String? thuOpenTime;
  @HiveField(26)
  String? thuCloseTime;
  @HiveField(27)
  String? friOpenTime;
  @HiveField(28)
  String? friCloseTime;
  @HiveField(29)
  String? satOpenTime;
  @HiveField(30)
  String? satCloseTime;
  @HiveField(31)
  String? sunOpenTime;
  @HiveField(32)
  String? sunCloseTime;
  @HiveField(33)
  CreatedByModel? cCreatedBy;
  @HiveField(34)
  CreatedByModel? cModifiedBy;
  @HiveField(35)
  BranchModel? branch;
  @HiveField(36)
  String? typeDisplay;
  @HiveField(37)
  String? createdAt;

  WerehouseModel(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.name,
      this.nameUz,
      this.nameEn,
      this.nameRu,
      this.isActive,
      this.isMain,
      this.type,
      this.address,
      this.phone,
      this.availableShipment,
      this.mobileSelling,
      this.latitude,
      this.longitude,
      this.radius,
      this.deliveryShortestTime,
      this.minPercentage,
      this.maxPercentage,
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
      this.branch,
      this.typeDisplay});

  WerehouseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
    nameUz = json['name_uz'];
    nameEn = json['name_en'];
    nameRu = json['name_ru'];
    isActive = json['is_active'];
    isMain = json['is_main'];
    type = json['type'];
    address = json['address'];
    phone = json['phone'];
    availableShipment = json['available_shipment'];
    mobileSelling = json['mobile_selling'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    radius = json['radius'];
    deliveryShortestTime = json['delivery_shortest_time'];
    minPercentage = json['min_percentage'];
    maxPercentage = json['max_percentage'];
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
    branch =
        json['branch'] != null ? BranchModel.fromJson(json['branch']) : null;
    typeDisplay = json['type_display'];
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
    data['is_active'] = isActive;
    data['is_main'] = isMain;
    data['type'] = type;
    data['address'] = address;
    data['phone'] = phone;
    data['available_shipment'] = availableShipment;
    data['mobile_selling'] = mobileSelling;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['radius'] = radius;
    data['delivery_shortest_time'] = deliveryShortestTime;
    data['min_percentage'] = minPercentage;
    data['max_percentage'] = maxPercentage;
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
    if (branch != null) {
      data['branch'] = branch!.toJson();
    }
    data['type_display'] = typeDisplay;
    return data;
  }
}
