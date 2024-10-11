import 'package:flutter/material.dart';
import 'package:bir_qadam_pos/core/core.dart';
import 'package:bir_qadam_pos/models/product/product_model.dart';

import '../../../../bloc/bloc.dart';
import '../../../widgets/widgets.dart';

// ignore: must_be_immutable
class ProductSearchItem extends StatelessWidget {
  final ProductModel product;
  String query;
  bool isHistory;
  ProductSearchItem({
    super.key,
    required this.product,
    this.query = '',
    this.isHistory = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.fromLTRB(12.w, 8.h, isHistory ? 0 : 12.w, 8.h),
      tileColor: AppColors.white,
      // leading: AppImage(
      //   height: 56.h,
      //   width: 56.w,
      //   radius: 6,
      //   image: product.representation.toString(),
      // ),
      title: Text.rich(TextSpan(children: _highlightOccurrences())),
      // subtitle: Text(_getPrice()),
      trailing: _getTrailing,
      onTap: () {
        ItemModel item = ItemModel(
          product: product,
          actualPrice: product.regularPrice,
          actualQuantity: "1",
          price: product.regularPrice,
          productVariant: ProductVariant(),
          quantity: "1",
        );

        BlocProvider.of<AddSearchingProductsBloc>(context)
            .add(GetSearchedProductWithWord(item: item));
        Navigator.pop(context);
      },
    );
  }

  Widget get _getTrailing => !isHistory
      ? Icon(Icons.arrow_forward_ios, size: 16.r)
      : AppIconButton(
          icon: AppIcons.clear,
          iconSize: 12,
          iconColor: AppColors.dark,
          onPressed: () async {
            await product.delete();
          },
        );

  // String _getPrice() {
  //   if ((product.services).isEmpty) return '0';

  //   if ((product.services.first.prices).isEmpty) return '0';

  //   return LocaleKeys.from_price.tr(args: [
  //     AppFormatter.formatPrice(product.services.first.prices.first.price),
  //   ]);
  // }

  List<TextSpan> _highlightOccurrences() {
    TextStyle simpleStyle = AppTextStyle.medium(size: 14);
    TextStyle highlightedStyle = AppTextStyle.bold(
      size: 14,
      color: AppColors.dark,
    );

    String source = product.name ?? "";

    if (!source.toLowerCase().contains(query.toLowerCase())) {
      return [
        TextSpan(text: source, style: simpleStyle),
      ];
    }
    final matches = query.toLowerCase().allMatches(source.toLowerCase());

    int lastMatchEnd = 0;

    final List<TextSpan> children = [];
    for (var i = 0; i < matches.length; i++) {
      final match = matches.elementAt(i);

      if (match.start != lastMatchEnd) {
        children.add(
          TextSpan(
            text: source.substring(lastMatchEnd, match.start),
            style: simpleStyle,
          ),
        );
      }

      children.add(
        TextSpan(
          text: source.substring(match.start, match.end),
          style: highlightedStyle,
        ),
      );

      if (i == matches.length - 1 && match.end != source.length) {
        children.add(
          TextSpan(
            text: source.substring(match.end, source.length),
            style: simpleStyle,
          ),
        );
      }

      lastMatchEnd = match.end;
    }
    return children;
  }
}
