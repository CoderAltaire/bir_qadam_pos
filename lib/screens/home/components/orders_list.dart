import 'package:bir_qadam_pos/core/components/money_formatter.dart';
import 'package:bir_qadam_pos/core/core.dart';
import 'package:bir_qadam_pos/screens/home/components/home_appbar.dart';
import 'package:bir_qadam_pos/screens/home/home_screen.dart';
import 'package:bir_qadam_pos/screens/widgets/widgets.dart';
import 'package:flutter/material.dart';
import '../../../bloc/bloc.dart';
import '../../../models/models.dart';
import 'isempty.dart';

class OrdersListWidget extends StatefulWidget {
  const OrdersListWidget({super.key});

  @override
  State<OrdersListWidget> createState() => _OrdersListWidgetState();
}

class _OrdersListWidgetState extends State<OrdersListWidget> {
  List<OrderModel> ordersList = [];
  bool isFinishedStatus = false;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetOrdersBloc>(context).add(StartGetOrdersEvent(false));
  }

  @override
  Widget build(BuildContext context) {
    // final orderingProvider = Provider.of<OrderingProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<GetOrdersBloc, GetOrdersState>(
          listener: (context, state) {
            if (state is GetAllOrdersSuccess) {
              ordersList = state.ordersesList;
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                const HomeOdersListAppBar(),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.sp, vertical: 15.sp),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.sp),
                        child: Row(
                          children: [
                            Expanded(
                              child: PrimaryButton(
                                label: "Faol",
                                enableColor: !isFinishedStatus,
                                onPressed: () {
                                  isFinishedStatus = false;

                                  BlocProvider.of<GetOrdersBloc>(context)
                                      .add(StartGetOrdersEvent(false));
                                },
                              ),
                            ),
                            SizedBox(
                              width: 14.h,
                            ),
                            Expanded(
                                child: PrimaryButton(
                                    enableColor: isFinishedStatus,
                                    label: "Arxiv",
                                    onPressed: () {
                                      isFinishedStatus = true;

                                      BlocProvider.of<GetOrdersBloc>(context)
                                          .add(StartGetOrdersEvent(true));
                                    })),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.76,
                        child: state is GetAllOrdersProccess
                            ? const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 1,
                                      )),
                                ],
                              )
                            : ordersList.isNotEmpty
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    padding: EdgeInsets.zero,
                                    itemCount: ordersList.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.sp),
                                        child: InkWell(
                                          onTap: () {
                                            BlocProvider.of<
                                                        GetOrdersWithIdBloc>(
                                                    context)
                                                .add(
                                              StartGetOrdersWithIdEvent(
                                                ordersList[index].id.toString(),
                                              ),
                                            );
                                            Navigator.pushAndRemoveUntil(
                                                context, MaterialPageRoute(
                                                    builder: (context) {
                                              return const HomeScreen();
                                            }),
                                                (Route<dynamic> route) =>
                                                    false);
                                          },
                                          child: Container(
                                            height: 150.w,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12.r),
                                                border: Border.all(
                                                  color: AppColors.greyEf,
                                                )),
                                            child: Padding(
                                              padding: EdgeInsets.all(15.sp),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 3.sp),
                                                    child: Text(
                                                      ordersList[index]
                                                              .customer
                                                              ?.fullName ??
                                                          "",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      softWrap: false,
                                                      // maxLines: 2,
                                                      style:
                                                          AppTextStyle.semiBold(
                                                              size: 16),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 3.sp),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "ID raqam",
                                                          style: AppTextStyle
                                                              .regular(
                                                                  size: 15,
                                                                  color: AppColors
                                                                      .greyF8),
                                                        ),
                                                        const Spacer(),
                                                        Text(
                                                          "№ ${ordersList[index].id}",
                                                          style: AppTextStyle
                                                              .semiBold(
                                                                  size: 15),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 3.sp),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "Sana",
                                                          style: AppTextStyle
                                                              .regular(
                                                                  size: 15,
                                                                  color: AppColors
                                                                      .greyF8),
                                                        ),
                                                        const Spacer(),
                                                        Text(
                                                          AppFormatter
                                                              .orderStringTimeWithMonth(
                                                                  ordersList[index]
                                                                          .createdAt ??
                                                                      ""),
                                                          style: AppTextStyle
                                                              .semiBold(
                                                                  size: 15),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 5.sp),
                                                    child: Text(
                                                      "${MoneyFormatter.formatter.format(ordersList[index].finalSum)} so`m",
                                                      style:
                                                          AppTextStyle.medium(
                                                              size: 16,
                                                              color: AppColors
                                                                  .primary),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    })
                                : const IsEmpty(),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
