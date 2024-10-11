import 'package:bir_qadam_pos/models/models.dart';
import 'package:bir_qadam_pos/models/product/product_model.dart';

import '../../core/core.dart';
import '../../hive_helper/hive_helper.dart';
import '../branch/branch_model.dart';
part 'orders_model.g.dart';

@HiveType(typeId: HiveTypes.order, adapterName: HiveAdapters.order)
class OrderModel extends HiveObject {
  @override
  get key => id;
  @HiveField(0)
  int? id;
  @HiveField(1)
  CustomerModel? customer;
  @HiveField(2)
  CustomerAddressModel? customerAddress;
  @HiveField(3)
  String? deliverer;
  @HiveField(4)
  String? createdAt;
  @HiveField(5)
  String? updatedAt;
  @HiveField(6)
  String? status;
  @HiveField(7)
  String? paymentType;
  @HiveField(8)
  String? chosenDeliverer;
  @HiveField(9)
  bool? deliverInTheShortestTime;
  @HiveField(10)
  String? deliveryDate;
  @HiveField(11)
  String? deliveryDatetimeFrom;
  @HiveField(12)
  String? deliveryDatetimeTo;
  @HiveField(13)
  String? deliveryCost;
  @HiveField(14)
  String? qrUrl;
  @HiveField(15)
  String? fiscalSign;
  @HiveField(16)
  String? receiptSeq;
  @HiveField(17)
  String? terminalId;
  @HiveField(18)
  String? virtualNumber;
  @HiveField(19)
  String? price;
  @HiveField(20)
  String? actualPrice;
  @HiveField(21)
  String? source;
  @HiveField(22)
  String? note;
  @HiveField(24)
  String? canceledBy;
  @HiveField(25)
  String? paymentStatus;
  @HiveField(26)
  String? payOnline;
  @HiveField(27)
  String? payCash;
  @HiveField(28)
  String? payFromBalance;
  @HiveField(29)
  String? payWithCard;
  @HiveField(30)
  String? receivedOnline;
  @HiveField(31)
  String? receivedCash;
  @HiveField(32)
  String? receivedFromBalance;
  @HiveField(33)
  String? receivedFromCard;
  @HiveField(34)
  CreatedByModel? cCreatedBy;
  @HiveField(35)
  CreatedByModel? cModifiedBy;
  @HiveField(36)
  int? clientOrder;
  @HiveField(37)
  BranchModel? branch;
  @HiveField(38)
  BranchModel? warehouse;
  @HiveField(39)
  double? finalSum;
  @HiveField(40)
  List<ItemModel>? items;
  OrderModel(
      {this.id,
      this.customer,
      this.customerAddress,
      this.deliverer,
      this.createdAt,
      this.updatedAt,
      this.status,
      this.paymentType,
      this.chosenDeliverer,
      this.deliverInTheShortestTime,
      this.deliveryDate,
      this.deliveryDatetimeFrom,
      this.deliveryDatetimeTo,
      this.deliveryCost,
      this.qrUrl,
      this.fiscalSign,
      this.receiptSeq,
      this.terminalId,
      this.virtualNumber,
      this.price,
      this.actualPrice,
      this.source,
      this.note,
      this.canceledBy,
      this.paymentStatus,
      this.payOnline,
      this.payCash,
      this.payFromBalance,
      this.payWithCard,
      this.receivedOnline,
      this.receivedCash,
      this.receivedFromBalance,
      this.receivedFromCard,
      this.cCreatedBy,
      this.cModifiedBy,
      this.clientOrder,
      this.branch,
      this.warehouse,
      this.items,
      this.finalSum});

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customer = json['customer'] != null
        ? CustomerModel.fromJson(json['customer'])
        : null;
    customerAddress = json['customer_address'] != null
        ? CustomerAddressModel.fromJson(json['customer_address'])
        : null;
    if (json['items'] != null) {
      items = <ItemModel>[];
      json['items'].forEach((v) {
        items!.add(ItemModel.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
    paymentType = json['payment_type'];
    chosenDeliverer = json['chosen_deliverer'];
    deliverInTheShortestTime = json['deliver_in_the_shortest_time'];
    deliveryDate = json['delivery_date'];
    deliveryDatetimeFrom = json['delivery_datetime_from'];
    deliveryDatetimeTo = json['delivery_datetime_to'];
    deliveryCost = json['delivery_cost'];
    qrUrl = json['qr_url'];
    fiscalSign = json['fiscal_sign'];
    receiptSeq = json['receipt_seq'];
    terminalId = json['terminal_id'];
    virtualNumber = json['virtual_number'];
    price = json['price'];
    actualPrice = json['actual_price'];
    source = json['source'];
    note = json['note'];
    canceledBy = json['canceled_by'];
    paymentStatus = json['payment_status'];
    payOnline = json['pay_online'];
    payCash = json['pay_cash'];
    payFromBalance = json['pay_from_balance'];
    payWithCard = json['pay_with_card'];
    receivedOnline = json['received_online'];
    receivedCash = json['received_cash'];
    receivedFromBalance = json['received_from_balance'];
    receivedFromCard = json['received_from_card'];
    // cCreatedBy = json['_created_by'] != null
    //     ? CreatedByModel.fromJson(json['_created_by'])
    //     : null;
    // cModifiedBy = json['_modified_by'] != null
    //     ? CreatedByModel.fromJson(json['_modified_by'])
    //     : null;
    clientOrder = json['client_order'];
    branch =
        json['branch'] != null ? BranchModel.fromJson(json['branch']) : null;
    warehouse = json['warehouse'] != null
        ? BranchModel.fromJson(json['warehouse'])
        : null;
    finalSum = json['final_sum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    if (customerAddress != null) {
      data['customer_address'] = customerAddress!.toJson();
    }
    data['deliverer'] = deliverer;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['status'] = status;
    data['payment_type'] = paymentType;
    data['chosen_deliverer'] = chosenDeliverer;
    data['deliver_in_the_shortest_time'] = deliverInTheShortestTime;
    data['delivery_date'] = deliveryDate;
    data['delivery_datetime_from'] = deliveryDatetimeFrom;
    data['delivery_datetime_to'] = deliveryDatetimeTo;
    data['delivery_cost'] = deliveryCost;
    data['qr_url'] = qrUrl;
    data['fiscal_sign'] = fiscalSign;
    data['receipt_seq'] = receiptSeq;
    data['terminal_id'] = terminalId;
    data['virtual_number'] = virtualNumber;
    data['price'] = price;
    data['actual_price'] = actualPrice;
    data['source'] = source;
    data['note'] = note;
    data['canceled_by'] = canceledBy;
    data['payment_status'] = paymentStatus;
    data['pay_online'] = payOnline;
    data['pay_cash'] = payCash;
    data['pay_from_balance'] = payFromBalance;
    data['pay_with_card'] = payWithCard;
    data['received_online'] = receivedOnline;
    data['received_cash'] = receivedCash;
    data['received_from_balance'] = receivedFromBalance;
    data['received_from_card'] = receivedFromCard;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    if (cCreatedBy != null) {
      data['_created_by'] = cCreatedBy!.toJson();
    }
    if (cModifiedBy != null) {
      data['_modified_by'] = cModifiedBy!.toJson();
    }
    data['client_order'] = clientOrder;
    if (branch != null) {
      data['branch'] = branch!.toJson();
    }
    if (warehouse != null) {
      data['warehouse'] = warehouse!.toJson();
    }
    data['final_sum'] = finalSum;
    return data;
  }
}

@HiveType(typeId: HiveTypes.customer, adapterName: HiveAdapters.customer)
class CustomerModel extends HiveObject {
  @override
  get key => id;
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? phone;
  @HiveField(2)
  String? fullName;

  CustomerModel({this.id, this.phone, this.fullName});

  CustomerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phone = json['phone'];
    fullName = json['full_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['phone'] = phone;
    data['full_name'] = fullName;
    return data;
  }
}

@HiveType(
    typeId: HiveTypes.customerAddress,
    adapterName: HiveAdapters.customerAddress)
class CustomerAddressModel extends HiveObject {
  @override
  get key => id;
  @HiveField(0)
  int? id;
  @HiveField(1)
  LocationModel? location;
  @HiveField(2)
  String? createdAt;
  @HiveField(3)
  String? updatedAt;
  @HiveField(4)
  String? name;
  @HiveField(5)
  String? address;
  @HiveField(6)
  String? type;
  @HiveField(7)
  String? apartment;
  @HiveField(8)
  String? entrance;
  @HiveField(9)
  String? floor;
  @HiveField(10)
  String? target;
  @HiveField(11)
  String? streetName;
  @HiveField(12)
  bool? isDeliverable;
  @HiveField(13)
  bool? hasDeliverableRequest;
  @HiveField(14)
  bool? isDefault;
  @HiveField(15)
  bool? isDelete;
  @HiveField(16)
  String? sCreatedBy;
  @HiveField(17)
  String? sModifiedBy;
  @HiveField(18)
  int? customer;

  CustomerAddressModel(
      {this.id,
      this.location,
      this.createdAt,
      this.updatedAt,
      this.name,
      this.address,
      this.type,
      this.apartment,
      this.entrance,
      this.floor,
      this.target,
      this.streetName,
      this.isDeliverable,
      this.hasDeliverableRequest,
      this.isDefault,
      this.isDelete,
      this.sCreatedBy,
      this.sModifiedBy,
      this.customer});

  CustomerAddressModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    location = json['location'] != null
        ? LocationModel.fromJson(json['location'])
        : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
    address = json['address'];
    type = json['type'];
    apartment = json['apartment'];
    entrance = json['entrance'];
    floor = json['floor'];
    target = json['target'];
    streetName = json['street_name'];
    isDeliverable = json['is_deliverable'];
    hasDeliverableRequest = json['has_deliverable_request'];
    isDefault = json['is_default'];
    isDelete = json['is_delete'];
    sCreatedBy = json['_created_by'];
    sModifiedBy = json['_modified_by'];
    customer = json['customer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    if (location != null) {
      data['location'] = location!.toJson();
    }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['name'] = name;
    data['address'] = address;
    data['type'] = type;
    data['apartment'] = apartment;
    data['entrance'] = entrance;
    data['floor'] = floor;
    data['target'] = target;
    data['street_name'] = streetName;
    data['is_deliverable'] = isDeliverable;
    data['has_deliverable_request'] = hasDeliverableRequest;
    data['is_default'] = isDefault;
    data['is_delete'] = isDelete;
    data['_created_by'] = sCreatedBy;
    data['_modified_by'] = sModifiedBy;
    data['customer'] = customer;
    return data;
  }
}

@HiveType(
    typeId: HiveTypes.locationModel, adapterName: HiveAdapters.locationModel)
class LocationModel extends HiveObject {
  @HiveField(0)
  double? latitude;
  @HiveField(1)
  double? longitude;

  LocationModel({this.latitude, this.longitude});

  LocationModel.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}
