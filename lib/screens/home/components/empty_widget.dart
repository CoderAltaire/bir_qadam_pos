import 'package:bir_qadam_pos/core/core.dart';
import 'package:flutter/material.dart';

import '../../widgets/dialogs/dialogs.dart';
import '../../widgets/widgets.dart';

class EmptyWidget extends StatefulWidget {
  const EmptyWidget({super.key});

  @override
  State<EmptyWidget> createState() => _EmptyWidgetState();
}
class _EmptyWidgetState extends State<EmptyWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      // color: Colors.red,
      child: Column(
        children: [
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/basket.png"),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.sp),
                child: Text(
                  "Xozircha bu yer bo’sh!",
                  style: AppTextStyle.medium(size: 17),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: 6.sp, left: 18.sp, right: 18.sp),
                    child: Text(
                      "Buyurtmani qabul qilish yaqin bo’lgan manzillarni qo’shib oling",
                      textAlign: TextAlign.center,
                      style: AppTextStyle.regular(
                          size: 16, color: AppColors.greyF4),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: 60.sp, left: 18.sp, right: 18.sp),
                    child: Text(
                      "Versiya  1.0.0 (4)",
                      textAlign: TextAlign.center,
                      style: AppTextStyle.regular(
                          size: 14,
                          color: const Color.fromARGB(255, 187, 190, 195)),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          PrimaryButton(
              enableColor: false,
              label: "ID raqam bo`yicha qidiruv",
              onPressed: () {
                AppDialog dialog = AppDialog(context);
                dialog.showEnterIdDialog();
              }),
        ],
      ),
    );
  }
}
