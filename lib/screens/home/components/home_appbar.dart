import 'package:bir_qadam_pos/bloc/bloc.dart';
import 'package:bir_qadam_pos/screens/home/components/orders_list.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../auth_screen/locked_screen.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.amber,
      height: MediaQuery.of(context).size.height * 0.12,
      child: Column(
        children: [
          SizedBox(height: 40.w),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.sp),
            child: BlocBuilder<GetOrdersWithIdBloc, GetOrdersWithIdState>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    state is GetAllOrdersWithIdSuccess
                        ? SizedBox(
                            height: MediaQuery.of(context).size.height * 0.039,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                BlocProvider.of<GetOrdersWithIdBloc>(context)
                                    .add(
                                  StartGetOrdersWithIdFinishedEvent(),
                                );
                              },
                              icon: const Icon(Icons.arrow_back),
                            ),
                          )
                        : SizedBox(
                            height: MediaQuery.of(context).size.height * 0.039,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(context,
                                    MaterialPageRoute(
                                  builder: (context) {
                                    return const LockedScreen();
                                  },
                                ), (Route<dynamic> route) => false);
                              },
                              icon: SvgPicture.asset(
                                "assets/images/basket.svg",
                              ),
                            ),
                          ),
                    Text(
                      state is GetAllOrdersWithIdSuccess
                          ? "ID ${state.ordersesList.id.toString()}"
                          : "Kassa",
                      style: AppTextStyle.semiBold(size: 18),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.039,
                      child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const OrdersListWidget();
                            }));
                          },
                          icon: SvgPicture.asset("assets/images/lock.svg")),
                    )
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.sp),
            child: Container(
              height: 0.5,
              color: AppColors.greyEf,
            ),
          ),
        ],
      ),
    );
  }
}

class HomeOdersListAppBar extends StatelessWidget {
  const HomeOdersListAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50.w),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset("assets/images/basket.svg"),
            Text(
              "Buyurtmalar ro’yxati",
              style: AppTextStyle.semiBold(size: 18),
            ),
            InkWell(
                onTap: () {}, child: SvgPicture.asset("assets/images/lock.svg"))
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 15.sp),
          child: Container(
            height: 0.5,
            color: AppColors.greyEf,
          ),
        ),
      ],
    );
  }
}
