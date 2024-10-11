class CreatedOrderModel {
  List<ItemsOrderModel>? items;
  int? cashDesk;
  String? receivedCash;
  String? receivedFromCard;

  CreatedOrderModel(
      {this.items, this.cashDesk, this.receivedCash, this.receivedFromCard});

  CreatedOrderModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <ItemsOrderModel>[];
      json['items'].forEach((v) {
        items!.add( ItemsOrderModel.fromJson(v));
      });
    }
    cashDesk = json['cash_desk'];
    receivedCash = json['received_cash'];
    receivedFromCard = json['received_from_card'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['cash_desk'] = cashDesk;
    data['received_cash'] = receivedCash;
    data['received_from_card'] = receivedFromCard;
    return data;
  }
}

class ItemsOrderModel {
  int? product;
  int? productVariant;
  String? quantity;

  ItemsOrderModel({this.product, this.productVariant, this.quantity});

  ItemsOrderModel.fromJson(Map<String, dynamic> json) {
    product = json['product'];
    productVariant = json['product_variant'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['product'] = product;
    data['product_variant'] = productVariant;
    data['quantity'] = quantity;
    return data;
  }
}
