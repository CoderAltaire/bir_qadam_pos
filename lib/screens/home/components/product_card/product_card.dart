import 'package:bir_qadam_pos/models/product/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/components/money_formatter.dart';
import '../../../../core/core.dart';
import '../../../../provider/ordering_provider.dart';

class ProductCard extends StatefulWidget {
  final ItemModel items;
  const ProductCard({super.key, required this.items});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  ItemModel item = ItemModel();
  @override
  Widget build(BuildContext context) {
    final List<ItemModel> orderedProducts =
        context.watch<OrderingProvider>().getCurrentClient.orderedProducts;
    item = orderedProducts.where((e) {
      return (e.id ?? "") == (widget.items.id ?? "");
    }).first;

    final orderingProvider = Provider.of<OrderingProvider>(context);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.sp),
      child: Container(
        height: 200.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: AppColors.greyEf,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 5.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.72,
                    child: Text(
                      item.productVariant?.name ?? item.product?.name ?? "XXX",
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      maxLines: 2,
                      style: AppTextStyle.semiBold(size: 16),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        orderingProvider.removeProduct(widget.items);
                        setState(() {});
                      },
                      icon: const Icon(
                        Icons.close_rounded,
                        color: AppColors.greyEf,
                      ))
                ],
              ),
              Row(
                children: [
                  Text(
                    "Asil miqdori",
                    style:
                        AppTextStyle.regular(size: 15, color: AppColors.greyF8),
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.only(right: 15.sp),
                    child: Text(
                      AppFormatter.rounderFromString(
                          item.product?.quantityAvailable ?? item.quantity),
                      style: AppTextStyle.semiBold(size: 16),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.sp),
                child: Text(
                  "${MoneyFormatter.formatter.format(((double.parse(item.product?.regularPrice ?? "0")) * (item.currentValue ?? (1)).toDouble()))}so`m",
                  style:
                      AppTextStyle.medium(size: 17, color: AppColors.primary),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.greyF5,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                width: 170.h,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Material(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(8.r),
                          onTap: () {
                            setState(() {});
                            if ((item.currentValue ?? 1) > 1) {
                              // item.currentValue = (item.currentValue ?? 1) - 1;
                              orderingProvider.minusProduct(item: item);
                            }
                          },
                          child: Container(
                            height: 45.w,
                            width: 50.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: const Icon(Icons.remove_rounded),
                          ),
                        ),
                      ),
                      Text(
                        (item.currentValue ?? 1).toString(),
                        style: AppTextStyle.medium(
                          size: 16,
                        ),
                      ),
                      Material(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(8.r),
                          onTap: () {
                            if ((item.currentValue ?? 1) <
                                (double.parse(item.actualQuantity ??
                                    item.quantity ??
                                    "1"))) {
                              setState(() {});
                              // item.currentValue = (item.currentValue ?? 1) + 1;
                              orderingProvider.addProduct(item: item);
                            }
                          },
                          child: Container(
                            height: 45.w,
                            width: 50.h,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: const Icon(Icons.add_rounded),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
