import '../models/product/product_model.dart';
class ItemsSingleton {
  static List<ItemModel> products = [];
  static List<ItemModel> barcodeProducts = [];
  static double getTotalPrice(List<ItemModel> products) {

    double t = 0;
    for (var e in products) {
    print("!!!!");
    print(e.currentValue);
    print(e.price);
      t += double.parse(e.product?.regularPrice??"") * (e.currentValue ?? 1);
    }
    return t;
  }
}
