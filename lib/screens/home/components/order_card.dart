import 'package:bir_qadam_pos/core/core.dart';
import 'package:bir_qadam_pos/screens/home/components/empty_widget.dart';
import 'package:bir_qadam_pos/screens/home/components/total_sum.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../bloc/bloc.dart';
import '../../../models/models.dart';
import '../../../provider/ordering_provider.dart';
import 'confirm_buttons/confirm_buttons.dart';
import 'product_card/product_card.dart';

class OrdersCardWidget extends StatefulWidget {
  const OrdersCardWidget({
    super.key,
  });

  @override
  State<OrdersCardWidget> createState() => _OrdersCardWidgetState();
}

class _OrdersCardWidgetState extends State<OrdersCardWidget> {
  @override
  Widget build(BuildContext context) {
    final orderingProvider = Provider.of<OrderingProvider>(context);

    final List<ItemModel> orderedProducts =
        context.watch<OrderingProvider>().getCurrentClient.orderedProducts;
    return Expanded(
      child: BlocConsumer<GetOrdersWithIdBloc, GetOrdersWithIdState>(
        listener: (context, state) {
          if (state is GetAllOrdersWithIdSuccess) {
            // orderingProvider.addClient();
          }
          if (state is GetAllOrdersWithIdFailure) {
            Fluttertoast.showToast(
                msg: state.msg,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        },
        builder: (context, state) {
          return state is GetAllOrdersWithIdProccess
              ? const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: CircularProgressIndicator(strokeWidth: 1),
                    ),
                  ],
                )
              : orderedProducts.isEmpty
                  ? const EmptyWidget()
                  : Stack(
                      children: [
                        Column(
                          children: [
                            const TotalSumWidet(),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.53,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  itemCount: orderedProducts.length,
                                  itemBuilder: (context, index) {
                                    return ProductCard(
                                        items: orderedProducts[index]);
                                  }),
                            ),
                          ],
                        ),
                        const ConfirmButtons(),
                      ],
                    );
        },
      ),
    );
  }
}
