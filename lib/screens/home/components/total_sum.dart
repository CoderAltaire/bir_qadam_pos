import 'package:flutter/material.dart';

import '../../../core/components/money_formatter.dart';
import '../../../core/core.dart';
import '../../../models/product/product_model.dart';
import '../../../provider/ordering_provider.dart';
import '../../../singeltons/items_singleton.dart';

class TotalSumWidet extends StatelessWidget {
  const TotalSumWidet({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ItemModel> orderedProducts =
        context.watch<OrderingProvider>().getCurrentClient.orderedProducts;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.sp),
      child: Row(
        children: [
          Text(
            "Umumiy summa:",
            style: AppTextStyle.medium(size: 18),
          ),
          const Spacer(),
          Text(
            "${MoneyFormatter.formatter.format(ItemsSingleton.getTotalPrice(orderedProducts))} so`m",
            style: AppTextStyle.medium(size: 18),
          ),
        ],
      ),
    );
  }
}
