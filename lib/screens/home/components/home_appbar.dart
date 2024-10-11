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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                      builder: (context) {
                        return const LockedScreen();
                      },
                    ), (Route<dynamic> route) => false);
                  },
                  child: SvgPicture.asset("assets/images/basket.svg")),
              Text(
                "Kassa",
                style: AppTextStyle.semiBold(size: 18),
              ),
              InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const OrdersListWidget();
                    }));
                  },
                  child: SvgPicture.asset("assets/images/lock.svg"))
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
