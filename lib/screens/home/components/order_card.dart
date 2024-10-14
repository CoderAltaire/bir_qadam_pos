import 'package:bir_qadam_pos/core/core.dart';
import 'package:bir_qadam_pos/models/models.dart';
import 'package:bir_qadam_pos/models/product/product_model.dart';
import 'package:bir_qadam_pos/screens/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../../bloc/bloc.dart';

class OrdersCardWidget extends StatefulWidget {
  final OrderModel oredrsModel;
  const OrdersCardWidget({super.key, required this.oredrsModel});

  @override
  State<OrdersCardWidget> createState() => _OrdersCardWidgetState();
}

class _OrdersCardWidgetState extends State<OrdersCardWidget> {
  @override
  Widget build(BuildContext context) {
    List<ItemModel> item = [];
    item = widget.oredrsModel.items ?? <ItemModel>[];
    double totalSum = 0;
    for (var e in item) {
      totalSum = totalSum +
          ((double.parse(e.product?.regularPrice ?? "0")) *
              (e.currentValue ?? (double.parse(e.quantity ?? "0"))).toDouble());
    }

    return Expanded(
      child: BlocConsumer<AddSearchingProductsBloc, AddSearchingProductsState>(
        listener: (context, state) {
          if (state is AddSearchingProductsSucces) {
            if (state.item.isNotEmpty) {
              totalSum = 0;

              item.add(state.item.first);
              for (var e in item) {
                totalSum = totalSum + double.parse(e.price ?? "0");
              }
            }
          }
          if (state is AddSearchingProductsWithWord) {
            item.add(state.item);
            totalSum = 0;
            for (var e in item) {
              totalSum = totalSum + double.parse(e.price ?? "0");
            }
            item.add(state.item);
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.sp),
                    child: Row(
                      children: [
                        Text(
                          "Umumiy summa",
                          style: AppTextStyle.semiBold(size: 16),
                        ),
                        const Spacer(),
                        Text(
                          "$totalSum so`m",
                          style: AppTextStyle.semiBold(size: 16),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.53,
                    child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: item.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.sp),
                            child: Container(
                              height: 215.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  border: Border.all(
                                    color: AppColors.greyEf,
                                  )),
                              child: Padding(
                                padding: EdgeInsets.all(15.sp),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.72,
                                          child: Text(
                                            widget.oredrsModel.items![index]
                                                    .product?.name ??
                                                "",
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: false,
                                            maxLines: 2,
                                            style:
                                                AppTextStyle.semiBold(size: 17),
                                          ),
                                        ),
                                        const Spacer(),
                                        IconButton(
                                            onPressed: () {
                                              item.remove(widget
                                                  .oredrsModel.items?[index]);
                                              setState(() {});
                                            },
                                            icon:
                                                const Icon(Icons.close_rounded))
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5.sp),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Asil miqdori",
                                            style: AppTextStyle.medium(
                                                size: 16,
                                                color: AppColors.greyF4),
                                          ),
                                          const Spacer(),
                                          Text(
                                            widget.oredrsModel.items?[index]
                                                    .quantity ??
                                                "0",
                                            style:
                                                AppTextStyle.semiBold(size: 16),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5.sp),
                                      child: Text(
                                        "${((double.parse(widget.oredrsModel.items?[index].product?.regularPrice ?? "0")) * (widget.oredrsModel.items?[index].currentValue ?? (double.parse(widget.oredrsModel.items?[index].quantity ?? "0"))).toDouble())} so`m",
                                        style: AppTextStyle.medium(
                                            size: 18, color: AppColors.primary),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.greyF5,
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                      ),
                                      width: 160.h,
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              height: 45.w,
                                              width: 50.h,
                                              decoration: BoxDecoration(
                                                color: AppColors.white,
                                                borderRadius:
                                                    BorderRadius.circular(8.r),
                                              ),
                                              child: IconButton(
                                                onPressed: () {
                                                  setState(() {});
                                                  if ((item[index]
                                                              .currentValue ??
                                                          1) >
                                                      1) {
                                                    item[index]
                                                        .currentValue = (item[
                                                                    index]
                                                                .currentValue ??
                                                            1) -
                                                        1;
                                                  }
                                                },
                                                icon: const Icon(
                                                    Icons.remove_rounded),
                                              ),
                                            ),
                                            Text(
                                              (item[index].currentValue ?? 1)
                                                  .toString(),
                                              style: AppTextStyle.medium(
                                                size: 16,
                                              ),
                                            ),
                                            Container(
                                              height: 45.w,
                                              width: 50.h,
                                              decoration: BoxDecoration(
                                                color: AppColors.white,
                                                borderRadius:
                                                    BorderRadius.circular(8.r),
                                              ),
                                              child: IconButton(
                                                onPressed: () {
                                                  setState(() {});
                                                  item[index]
                                                      .currentValue = (item[
                                                                  index]
                                                              .currentValue ??
                                                          1) +
                                                      1;
                                                },
                                                icon: const Icon(
                                                    Icons.add_rounded),
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
                        }),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 13.sp),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BlocConsumer<CloseOrderBloc, CloseOrderState>(
                      listener: (context, state) {
                        if (state is CloseOrderFailureState) {
                          Fluttertoast.showToast(
                              msg: state.msg,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                        if (state is CloseOrderSuccesState) {
                          BlocProvider.of<GetOrdersWithIdBloc>(context).add(
                            StartGetOrdersWithIdFinishedEvent(),
                          );
                        }
                        // if (state is CloseOrderFailureState) {
                        //   BlocProvider.of<GetOrdersWithIdBloc>(context).add(
                        //     StartGetOrdersWithIdFinishedEvent(),
                        //   );
                        // }
                      },
                      builder: (context, state) {
                        return PrimaryButton(
                            label: "Tasdiqlash",
                            loading: state is CloseOrderProccessState,
                            onPressed: () {
                              List<ItemsOrderModel> items = <ItemsOrderModel>[];

                              for (var x in (widget.oredrsModel.items ??
                                  <ItemModel>[])) {
                                items.add(
                                  ItemsOrderModel(
                                    product: x.product?.id,
                                    productVariant:
                                        x.productVariant?.id ?? null,
                                    quantity: (x.currentValue ?? 1).toString(),
                                  ),
                                );
                              }
                              CreatedOrderModel order = CreatedOrderModel(
                                cashDesk: 2,
                                receivedCash: totalSum.toString(),
                                receivedFromCard: "0",
                                items: items,
                              );

                              BlocProvider.of<CloseOrderBloc>(context)
                                  .add(StartCloseOrderEvent(order));
                            });
                      },
                    ),
                    SizedBox(
                      height: 10.w,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.greyF5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                              ),
                              onPressed: () {},
                              child:
                                  SvgPicture.asset("assets/images/list.svg")),
                        ),
                        SizedBox(
                          width: 20.h,
                        ),
                        Expanded(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.greyF5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                              ),
                              onPressed: () {
                                BlocProvider.of<GetOrdersWithIdBloc>(context)
                                    .add(
                                  StartGetOrdersWithIdFinishedEvent(),
                                );
                              },
                              child:
                                  SvgPicture.asset("assets/images/delete.svg")),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
