import 'package:flutter/material.dart';
import 'package:bir_qadam_pos/core/core.dart';
import 'package:bir_qadam_pos/models/product/product_model.dart';
import '../../../../hive_helper/product_helper.dart';
import '../../../widgets/widgets.dart';
import 'product_search_item.dart';

class ProductSearchDelegate extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.white,
      platform: TargetPlatform.iOS,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.white,
        iconTheme: IconThemeData(color: AppColors.dark, size: 18),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.dark,
      ),
      textTheme: TextTheme(
        titleLarge: AppTextStyle.medium(color: AppColors.dark),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: AppTextStyle.medium(color: AppColors.dark),
        border: InputBorder.none,
        iconColor: Colors.black,
        helperStyle: AppTextStyle.regular(
          color: AppColors.dark.withOpacity(.8),
        ),
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      AppIconButton(
          icon: AppIcons.clear,
          iconSize: 16,
          iconColor: AppColors.dark,
          onPressed: () {
            if (query.isEmpty) {
              Navigator.pop(context);
            } else {
              query = '';
            }
          }),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return query.isNotEmpty ? _searchProducts() : const SizedBox();
    // return _searchProducts();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // return query.isNotEmpty ? _searchProducts() : _showHistory();
    // return _searchProducts();
    return query.isNotEmpty
        ? _searchProducts()
        : Container(height: 1, color: Colors.black);
  }

  FutureBuilder<List<ProductModel>> _searchProducts() {
    return FutureBuilder(
      future: ProductHelper.searchProductFromServer(query),
      // future: ProductHelper.searchProduct(query),
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.primary,
              strokeWidth: 1,
            ),
          );
        }
        if (snap.hasData) {
          _products = snap.requireData;
          return _showList();
        }
        return const SizedBox();
      },
    );
  }

  Widget _showList() {
    if (_products.isEmpty) {
      return const Center(child: Text("Maxsulot topilmadi"));
    }
    return ListView.builder(
      itemCount: _products.length,
      itemBuilder: (context, index) {
        ProductModel product = _products[index];
        return ProductSearchItem(
          product: product,
          query: query,
        );
      },
    );
  }

  List<ProductModel> _products = [];
}
