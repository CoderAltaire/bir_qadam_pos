import 'package:flutter/material.dart';

import '../../../bloc/bloc.dart';
import '../../../core/core.dart';
import '../../../services/services.dart';
import '../../barcode/barcode_scan_screen.dart';
import '../../widgets/widgets.dart';
import 'products_search/product_search.dart';

class HomeSearchPart extends StatelessWidget {
  const HomeSearchPart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetOrdersWithIdBloc, GetOrdersWithIdState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.sp, vertical: 0.sp),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
            child: Row(
              children: [
                Expanded(
                    flex: 100,
                    child: InkWell(
                      onTap: () {
                        if (state is GetAllOrdersWithIdSuccess) {
                          showSearch(
                            context: context,
                            delegate: ProductSearchDelegate(),
                          );
                        } else {
                          Fluttertoast.showToast(
                              msg: "Kerakli orderni tanlang",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        decoration:
                            AppShape.simpleContainer2(color: AppColors.greyEf),
                        child: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.all(10.sp),
                                child: SvgPicture.asset(AppIcons.search)),
                            Text(
                              "Maxsulot nomi...",
                              style:
                                  AppTextStyle.regular(color: AppColors.greyF4),
                            ),
                          ],
                        ),
                      ),
                    )),
                SizedBox(
                  width: 14.h,
                ),
                Expanded(
                  flex: 15,
                  child: InkWell(
                    onTap: () {
                      if (state is GetAllOrdersWithIdSuccess) {
                        if (Platform.isIOS) {
                          BarcodeScanningService.scanBarcode();
                        } else {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const BarcodeScanPage();
                          }));
                        }
                      } else {
                        Fluttertoast.showToast(
                            msg: "Kerakli orderni tanlang",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      decoration:
                          AppShape.simpleContainer2(color: AppColors.greyEf),
                      child: Padding(
                          padding: EdgeInsets.all(10.sp),
                          child: SvgPicture.asset(AppIcons.qr)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
