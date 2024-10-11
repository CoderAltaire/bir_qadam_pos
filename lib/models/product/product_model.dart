//=======================================================================================================================================================
//=======================================================================================================================================================
//=======================================================================================================================================================
//=======================================================================================================================================================

import '../../core/core.dart';
import '../../hive_helper/hive_helper.dart';
part 'product_model.g.dart';

class ItemModel {
  int? id;
  ProductModel? product;
  ProductVariant? productVariant;
  String? series;
  String? quantity;
  int? currentValue;
  String? price;
  String? actualQuantity;
  String? actualPrice;
  String? createdAt;
  String? updatedAt;
  int? iCreatedBy;
  String? nModifiedBy;
  int? warehouse;
  int? branch;
  double? finalSum;
  String? commissioner;

  ItemModel(
      {this.id,
      this.product,
      this.currentValue,
      this.productVariant,
      this.series,
      this.quantity,
      this.price,
      this.actualQuantity,
      this.actualPrice,
      this.createdAt,
      this.updatedAt,
      this.iCreatedBy,
      this.nModifiedBy,
      this.warehouse,
      this.branch,
      this.finalSum,
      this.commissioner});

  ItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product =
        json['product'] != null ?  ProductModel.fromJson(json['product']) : null;

       productVariant =
        json['product_variant'] != null ?  ProductVariant.fromJson(json['product_variant']) : null;
    series = json['series'];
    quantity = json['quantity'];
    price = json['price'];
    actualQuantity = json['actual_quantity'];
    actualPrice = json['actual_price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    iCreatedBy = json['_created_by'];
    nModifiedBy = json['_modified_by'];
    warehouse = json['warehouse'];
    branch = json['branch'];
    finalSum = json['final_sum'];
    // commissioner = json['commissioner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    if (product != null) {
      data['product'] = product!.toJson();
    }

      if (productVariant != null) {
      data['product_variant'] = productVariant!.toJson();
    }
  
    data['series'] = series;
    data['quantity'] = quantity;
    data['price'] = price;
    data['actual_quantity'] = actualQuantity;
    data['actual_price'] = actualPrice;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['_created_by'] = iCreatedBy;
    data['_modified_by'] = nModifiedBy;
    data['warehouse'] = warehouse;
    data['branch'] = branch;
    data['final_sum'] = finalSum;
    data['commissioner'] = commissioner;
    return data;
  }
}

class ProductVariant {
  int? id;
  String? name;
  String? nameUz;
  String? nameRu;
  String? nameEn;

  ProductVariant({this.id, this.name, this.nameUz, this.nameRu, this.nameEn});

  ProductVariant.fromJson(Map<String, dynamic> json) {
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


@HiveType(
    typeId: HiveTypes.productModel, adapterName: HiveAdapters.productModel)
class ProductModel extends HiveObject {
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
  @HiveField(5)
  int? orderingNumber;
  @HiveField(6)
  String? ikpu;
  @HiveField(7)
  String? packageCode;
  @HiveField(8)
  String? barcode;
  @HiveField(9)
  bool? isActive;
  @HiveField(10)
  bool? hasSeries;
  @HiveField(11)
  bool? isSet;
  @HiveField(12)
  bool? isSold;
  @HiveField(13)
  bool? isRecommended;
  @HiveField(14)
  bool? isPromo;
  @HiveField(15)
  List<String>? crosssellProducts;
  @HiveField(16)
  String? regularPrice;
  @HiveField(17)
  bool? hasDiscount;
  @HiveField(18)
  String? discountedPrice;
  @HiveField(19)
  String? discountType;
  @HiveField(20)
  String? discountPercentage;
  @HiveField(21)
  String? discountStartDate;
  @HiveField(22)
  String? discountEndDate;
  @HiveField(23)
  String? activeTimeFrom;
  @HiveField(24)
  String? activeTimeTo;
  @HiveField(25)
  bool? isWeight;
  @HiveField(26)
  bool? isPieces;
  @HiveField(27)
  bool? isMobileVisible;
  @HiveField(28)
  CategoryModel? category;
  @HiveField(29)
  String? trademark;
  @HiveField(30)
  int? unitTypeValue;
  @HiveField(31)
  String? measureSizeValue;
  @HiveField(32)
  int? measureValue;
  @HiveField(33)
  String? sizeWeight;
  @HiveField(34)
  String? sizeHeight;
  @HiveField(35)
  String? sizeLength;
  @HiveField(36)
  String? sizeWidth;
  @HiveField(37)
  double? vat;
  @HiveField(38)
  String? limit;
  @HiveField(39)
  MainImageModel? mainImage;
 

  ProductModel(
      {this.id,
      this.name,
      this.nameUz,
      this.nameRu,
      this.nameEn,
      this.orderingNumber,
      this.ikpu,
      this.packageCode,
      this.barcode,
      this.isActive,
      this.hasSeries,
      this.isSet,
      this.isSold,
      this.isRecommended,
      this.isPromo,
      this.crosssellProducts,
      this.regularPrice,
      this.hasDiscount,
      this.discountedPrice,
      this.discountType,
      this.discountPercentage,
      this.discountStartDate,
      this.discountEndDate,
      this.activeTimeFrom,
      this.activeTimeTo,
      this.isWeight,
      this.isPieces,
      this.isMobileVisible,
      this.category,
      this.trademark,
      this.unitTypeValue,
      this.measureSizeValue,
      this.measureValue,
      this.sizeWeight,
      this.sizeHeight,
      this.sizeLength,
      this.sizeWidth,
      this.vat,
      this.limit,
   
      this.mainImage});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameUz = json['name_uz'];
    nameRu = json['name_ru'];
    nameEn = json['name_en'];
    orderingNumber = json['ordering_number'];
    ikpu = json['ikpu'];
    packageCode = json['package_code'];
    barcode = json['barcode'];
    isActive = json['is_active'];
    hasSeries = json['has_series'];
    isSet = json['is_set'];
    isSold = json['is_sold'];
    isRecommended = json['is_recommended'];
    isPromo = json['is_promo'];
    if (json['crosssell_products'] != null) {
      crosssellProducts = <String>[];
      json['crosssell_products'].forEach((v) {
        crosssellProducts!.add(v);
      });
    }
    regularPrice = json['regular_price'].toString();
    hasDiscount = json['has_discount'];
    discountedPrice = json['discounted_price'];
    discountType = json['discount_type'];
    discountPercentage = json['discount_percentage'];
    discountStartDate = json['discount_start_date'];
    discountEndDate = json['discount_end_date'];
    activeTimeFrom = json['active_time_from'];
    activeTimeTo = json['active_time_to'];
    isWeight = json['is_weight'];
    isPieces = json['is_pieces'];
    isMobileVisible = json['is_mobile_visible'];
    category = json['category'] != null
        ? CategoryModel.fromJson(json['category'])
        : null;
    trademark = json['trademark'];
    unitTypeValue = json['unit_type_value'];
    measureSizeValue = json['measure_size_value'];
    measureValue = json['measure_value'];
    sizeWeight = json['size_weight'];
    sizeHeight = json['size_height'];
    sizeLength = json['size_length'];
    sizeWidth = json['size_width'];
    vat = json['vat'];
    limit = json['limit'];
    mainImage = json['main_image'] != null
        ? MainImageModel.fromJson(json['main_image'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['name_uz'] = nameUz;
    data['name_ru'] = nameRu;
    data['name_en'] = nameEn;
    data['ordering_number'] = orderingNumber;
    data['ikpu'] = ikpu;
    data['package_code'] = packageCode;
    data['barcode'] = barcode;
    data['is_active'] = isActive;
    data['has_series'] = hasSeries;
    data['is_set'] = isSet;
    data['is_sold'] = isSold;
    data['is_recommended'] = isRecommended;
    data['is_promo'] = isPromo;
    if (crosssellProducts != null) {
      data['crosssell_products'] = crosssellProducts!.map((v) => v).toList();
    }
    data['regular_price'] = regularPrice;
    data['has_discount'] = hasDiscount;
    data['discounted_price'] = discountedPrice;
    data['discount_type'] = discountType;
    data['discount_percentage'] = discountPercentage;
    data['discount_start_date'] = discountStartDate;
    data['discount_end_date'] = discountEndDate;
    data['active_time_from'] = activeTimeFrom;
    data['active_time_to'] = activeTimeTo;
    data['is_weight'] = isWeight;
    data['is_pieces'] = isPieces;
    data['is_mobile_visible'] = isMobileVisible;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    data['trademark'] = trademark;
    data['unit_type_value'] = unitTypeValue;
    data['measure_size_value'] = measureSizeValue;
    data['measure_value'] = measureValue;
    data['size_weight'] = sizeWeight;
    data['size_height'] = sizeHeight;
    data['size_length'] = sizeLength;
    data['size_width'] = sizeWidth;
    data['vat'] = vat;
    data['limit'] = limit;
    if (mainImage != null) {
      data['main_image'] = mainImage!.toJson();
    }
    return data;
  }
}

@HiveType(
    typeId: HiveTypes.categoryModel, adapterName: HiveAdapters.categoryModel)
class CategoryModel extends HiveObject {
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
  @HiveField(5)
  String? shortName;
  @HiveField(6)
  String? shortNameUz;
  @HiveField(7)
  String? shortNameRu;
  @HiveField(8)
  String? shortNameEn;
  @HiveField(9)
  bool? isActive;
  bool? showOnMainpage;
  @HiveField(10)
  ImageModel? image;
  @HiveField(11)
  int? orderingNumber;
  @HiveField(12)
  int? homePageOrderingNumber;

  CategoryModel(
      {this.id,
      this.name,
      this.nameUz,
      this.nameRu,
      this.nameEn,
      this.shortName,
      this.shortNameUz,
      this.shortNameRu,
      this.shortNameEn,
      this.isActive,
      this.showOnMainpage,
      this.image,
      this.orderingNumber,
      this.homePageOrderingNumber});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameUz = json['name_uz'];
    nameRu = json['name_ru'];
    nameEn = json['name_en'];
    shortName = json['short_name'];
    shortNameUz = json['short_name_uz'];
    shortNameRu = json['short_name_ru'];
    shortNameEn = json['short_name_en'];
    isActive = json['is_active'];
    showOnMainpage = json['show_on_mainpage'];
    image = json['image'] != null ? ImageModel.fromJson(json['image']) : null;
    orderingNumber = json['ordering_number'];
    homePageOrderingNumber = json['home_page_ordering_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['name_uz'] = nameUz;
    data['name_ru'] = nameRu;
    data['name_en'] = nameEn;
    data['short_name'] = shortName;
    data['short_name_uz'] = shortNameUz;
    data['short_name_ru'] = shortNameRu;
    data['short_name_en'] = shortNameEn;
    data['is_active'] = isActive;
    data['show_on_mainpage'] = showOnMainpage;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    data['ordering_number'] = orderingNumber;
    data['home_page_ordering_number'] = homePageOrderingNumber;
    return data;
  }
}

@HiveType(typeId: HiveTypes.imageModel, adapterName: HiveAdapters.imageModel)
class ImageModel extends HiveObject {
  @override
  get key => id;
  @HiveField(0)
  int? id;
  @HiveField(2)
  String? normal;
  @HiveField(3)
  String? small;
  @HiveField(4)
  String? icon;
  @HiveField(5)
  String? original;

  ImageModel({this.id, this.normal, this.small, this.icon, this.original});

  ImageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    normal = json['normal'];
    small = json['small'];
    icon = json['icon'];
    original = json['original'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['normal'] = normal;
    data['small'] = small;
    data['icon'] = icon;
    data['original'] = original;
    return data;
  }
}

@HiveType(
    typeId: HiveTypes.mainImageModel, adapterName: HiveAdapters.mainImageModel)
class MainImageModel extends HiveObject {
  @override
  get key => id;
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? normal;
  @HiveField(2)
  String? small;
  @HiveField(3)
  String? icon;
  @HiveField(4)
  bool? isMain;

  MainImageModel({this.id, this.normal, this.small, this.icon, this.isMain});

  MainImageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    normal = json['normal'];
    small = json['small'];
    icon = json['icon'];
    isMain = json['is_main'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['normal'] = normal;
    data['small'] = small;
    data['icon'] = icon;
    data['is_main'] = isMain;
    return data;
  }
}
