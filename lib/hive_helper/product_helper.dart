
import '../models/product/product_model.dart';
import '../services/services.dart';

class ProductHelper {
  const ProductHelper._();
  // static Box<ProductModel> get _box => HiveBoxes.productBox;

  // static Future putAll(List<ProductModel> products) async {
  //   Map<String, ProductModel> entries = {};
  //   for (var product in products) {
  //     entries[product.key] = product;
  //   }

  //   await _box.putAll(entries);
  // }

  // static ProductModel? getProductByBarcode(String barcode) {
  //   ProductModel? prod;
  //   for (var product in _box.values) {
  //     if (product.name!.contains(barcode)) {
  //       prod = product;
  //       break;
  //     }
  //   }
  //   //   for (var product in _box.values) {
  //   //   if (product.barcode!.contains(barcode)) {
  //   //     prod = product;
  //   //     break;
  //   //   }
  //   // }
  //   return prod;
  // }

  // static Future<List<ProductModel>> searchProduct(String query) async {
  //   query = query.trim().toLowerCase().toLatin();

  //   return _box.values
  //       .where(
  //         (product) => product.name!.toLowerCase().toLatin().contains(query),
  //       )
  //       .toList();
  // }

  static Future<List<ProductModel>> searchProductFromServer(
      String query) async {
    // query = query.trim().toLowerCase().toLatin();
    query = query.trim().toLowerCase();
    HttpResult result = await ApiService.searchProducts(query);
    List<ProductModel> producs = (result.result['results'] as List)
        .map((e) => ProductModel.fromJson(e))
        .toList();
    return producs;
  }
}
