class PosDeskModel {
  int? id;
  String? name;
  String? nameUz;
  String? nameEn;
  String? nameRu;
  bool? isActive;

  PosDeskModel(
      {this.id,
      this.name,
      this.nameUz,
      this.nameEn,
      this.nameRu,
      this.isActive});

  PosDeskModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameUz = json['name_uz'];
    nameEn = json['name_en'];
    nameRu = json['name_ru'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['name_uz'] = nameUz;
    data['name_en'] = nameEn;
    data['name_ru'] = nameRu;
    data['is_active'] = isActive;
    return data;
  }
}
