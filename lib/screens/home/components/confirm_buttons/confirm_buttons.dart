import 'package:bir_qadam_pos/provider/ordering_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../bloc/bloc.dart';
import '../../../../core/core.dart';
import '../../../../hive_helper/hive_helper.dart';
import '../../../../models/models.dart';
import '../../../../singeltons/items_singleton.dart';
import '../../../widgets/dialogs/dialogs.dart';
import '../../../widgets/widgets.dart';

class ConfirmButtons extends StatelessWidget {
  const ConfirmButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ItemModel> orderedProducts =
        context.watch<OrderingProvider>().getCurrentClient.orderedProducts;
    final String orderId =
        context.watch<OrderingProvider>().getCurrentClient.orderId ?? "";
    return Padding(
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
                Fluttertoast.showToast(
                    msg: "Order tasdiqlandi",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    textColor: Colors.white,
                    fontSize: 16.0);

                AppDialog dialog = AppDialog(context);
                dialog.showOrderSucces();
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
                  enableColor: orderedProducts.isNotEmpty,
                  loading: state is CloseOrderProccessState,
                  onPressed: () {
                    if (orderedProducts.isNotEmpty) {
                      List<ItemsOrderModel> items = <ItemsOrderModel>[];
                      for (var x in (orderedProducts)) {
                        items.add(
                          ItemsOrderModel(
                            product: x.product?.id,
                            productVariant: x.productVariant?.id ?? null,
                            quantity: (x.currentValue ?? 1).toString(),
                          ),
                        );
                      }
                      CreatedOrderModel order = CreatedOrderModel(
                        cashDesk: AppPrefs.getPosDesk,
                        receivedCash:
                            ItemsSingleton.getTotalPrice(orderedProducts)
                                .toString(),
                        receivedFromCard: "0",
                        items: items,
                      );
                      BlocProvider.of<CloseOrderBloc>(context).add(
                          StartCloseOrderEvent(
                              order, orderId == "" ? true : false, orderId));
                    }
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
                    child: SvgPicture.asset("assets/images/list.svg")),
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
                      Provider.of<OrderingProvider>(context, listen: false)
                          .cancelOrdering();
                    },
                    child: SvgPicture.asset("assets/images/delete.svg")),
              ),
            ],
          )
        ],
      ),
    );
  }
}
