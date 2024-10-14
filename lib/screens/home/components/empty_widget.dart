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
      height: MediaQuery.of(context).size.height*0.7,
      // color: Colors.red,
      child: Column(
        children: [
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/basket.png"),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 15.sp),
                child: Text(
                  "Xozircha hech nima yo`q !",
                  style: AppTextStyle.medium(size: 17),
                ),
              ),
              Center(
                child: Text(
                  "Buyurtmani qabul qilish yaqin bo’lgan manzillarni qo’shib oling",
                  textAlign: TextAlign.center,
                  style: AppTextStyle.regular(size: 16, color: AppColors.greyF4),
                ),
              ),
            ],
          ),
          const Spacer(),
          PrimaryButton(
            enableColor: false,
              label: "ID raqam bo`yicha qidiruv", onPressed: () {
                  AppDialog dialog = AppDialog(context);
                    dialog.showEnterIdDialog();
              }),
        ],
      ),
    );
  }
}
