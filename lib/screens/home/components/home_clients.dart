import 'package:bir_qadam_pos/screens/home/components/empty_widget.dart';
import 'package:bir_qadam_pos/screens/home/components/order_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../bloc/bloc.dart';
import '../../../core/core.dart';
import '../../../models/models.dart';
import '../../../provider/ordering_provider.dart';
import 'clients_part/six_client_add.dart';
import 'clients_part/six_client_button.dart';

class HomeClientsScreen extends StatefulWidget {
  const HomeClientsScreen({super.key});
  @override
  State<HomeClientsScreen> createState() => _HomeClientsScreenState();
}

class _HomeClientsScreenState extends State<HomeClientsScreen> {
  OrderModel orderModel = OrderModel();
  @override
  Widget build(BuildContext context) {
    final orderingProvider = Provider.of<OrderingProvider>(context);
    final sixClient4List = orderingProvider.getSixClient4List;
    final selectedClientIndex = orderingProvider.getSelectedIndex;
    return SizedBox(
      // color: Colors.blue,
      height: MediaQuery.of(context).size.height * 0.77,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.sp),
            child: BlocBuilder<ClientBloc, ClientState>(
              builder: (context, state) {
                return SizedBox(
                  height: 40.w,
                  width: MediaQuery.of(context).size.width * 1,
                  child: ListView(scrollDirection: Axis.horizontal, children: [
                    Center(
                      child: orderingProvider.getSixClient4List.length > 3
                          ? const SizedBox(width: 0, height: 0)
                          : SixClientsAddButton(
                              color:
                                  orderingProvider.getSixClient4List.isNotEmpty
                                      ? Theme.of(context).dialogBackgroundColor
                                      : Theme.of(context).primaryColor,
                              onPressed: () {
                                orderingProvider.addClient();
                              },
                            ),
                    ),
                    sixClient4List.isNotEmpty
                        ? ListView.builder(
                            itemCount: sixClient4List.length,
                            itemBuilder: (context, index) {
                              final client = sixClient4List[index];
                              return SixClientsButton(
                                isSelected: selectedClientIndex == index,
                                clientNumber: client.clientNumber,
                                onPressed: () {
                                  orderingProvider.selectClient(index);
                                },
                              );
                            })
                        : const SizedBox(),
                  ]),
                );
              },
            ),
          ),
          BlocConsumer<GetOrdersWithIdBloc, GetOrdersWithIdState>(
            listener: (context, state) {
              if (state is GetAllOrdersWithIdSuccess) {
                orderModel = state.ordersesList;
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
              if (state is GetAllOrdersWithIdSuccess) {
                return OrdersCardWidget(oredrsModel: state.ordersesList);
              } else if (state is GetAllOrdersWithIdProccess) {
                return const Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 50,
                          width: 50,
                          child: CircularProgressIndicator()),
                    ],
                  ),
                );
              } else if (state is GetAllOrderFinished) {
                return const EmptyWidget();
              } else {
                return const EmptyWidget();
              }
            },
          )
        ],
      ),
    );
  }

  addButton() {
    return InkWell(
      onTap: () => BlocProvider.of<ClientBloc>(context).add(
        AddNewClientEvent(),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 0.sp),
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: AppColors.primary.withOpacity(0.2),
                width: 1,
              )),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.sp, horizontal: 10.sp),
            child: Text(
              "+ Qo`shish",
              style: AppTextStyle.medium(color: AppColors.primary),
            ),
          ),
        ),
      ),
    );
  }
}
