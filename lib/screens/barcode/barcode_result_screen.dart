import 'package:flutter/material.dart';
import 'package:bir_qadam_pos/core/core.dart';
import 'package:bir_qadam_pos/services/barcode_scanning_service.dart';
import 'package:provider/provider.dart';
import '../../bloc/bloc.dart';
import '../../models/product/product_model.dart';
import '../../provider/ordering_provider.dart';
import '../widgets/widgets.dart';

class BarcodeResultScreen extends StatefulWidget {
  final String barcode;
  const BarcodeResultScreen(this.barcode, {super.key});

  @override
  State<BarcodeResultScreen> createState() => _BarcodeResultScreenState();
}

class _BarcodeResultScreenState extends State<BarcodeResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) =>
            BarcodeBloc()..add(GetItemByBarcodeEvent(widget.barcode)),
        child: BlocConsumer<BarcodeBloc, BarcodeState>(
          listener: (context, state) {
            if (state is BarcodeFailedState) {
              Fluttertoast.showToast(msg: state.error);
              Navigator.pop(context);
            }
            // if (state is BarcodeSuccessState) {
            //   ItemModel item = ItemModel(
            //     product: state.products.first,
            //     actualPrice: state.products.first.regularPrice,
            //     actualQuantity: state.products.first.quantityAvailable,
            //     price: state.products.first.regularPrice,
            //     productVariant: ProductVariant(),
            //     quantity: "1",
            //     currentValue: 1,
            //   );
            //   Provider.of<OrderingProvider>(context, listen: false).addProduct(
            //     item: item,
            //   );

            //   BlocProvider.of<AddSearchingProductsBloc>(context)
            //       .add(GetSearchedProductWithWord(item: item));
            //   Navigator.pop(context);
            // }
          },
          builder: (context, state) {
            if (state is BarcodeLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is BarcodeSuccessState) {
              List<ProductModel> product = state.products;
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 400.w,
                    child: Padding(
                      padding: EdgeInsets.all(80.sp),
                      child: Image.network(
                        product.first.mainImage?.normal ?? "",
                        errorBuilder: (context, error, stackTrace) {
                          return SvgPicture.asset(
                            "assets/images/lock.svg",
                            color: AppColors.grey,
                          );
                        },
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(14.w, 15.h, 14.w, 0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Barcode:",
                            style: AppTextStyle.medium(size: 18),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.fromLTRB(14.w, 15.h, 14.w, 0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            widget.barcode,
                            style: AppTextStyle.medium(
                                color: const Color(0xff545454), size: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(14.w, 15.h, 14.w, 0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Nomi:",
                            style: AppTextStyle.medium(size: 18),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.fromLTRB(14.w, 15.h, 14.w, 0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            product.first.name ?? "",
                            maxLines: null,
                            style: AppTextStyle.medium(
                                color: const Color(0xff545454), size: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      PrimaryButton(
                        label: "Qo`shish",
                        onPressed: () async {
                          ItemModel item = ItemModel(
                            product: product.first,
                            actualPrice: product.first.regularPrice,
                            actualQuantity: product.first.quantityAvailable,
                            price: product.first.regularPrice,
                            productVariant: ProductVariant(),
                            quantity: "1",
                            currentValue: 1,
                          );
                          Provider.of<OrderingProvider>(context, listen: false)
                              .addProduct(
                            item: item,
                          );
                          // BlocProvider.of<AddSearchingProductsBloc>(context)
                          //     .add(GetSearchedProductWithWord(item: item));
                          if (Platform.isIOS) {

                            Navigator.pop(context);
                            BarcodeScanningService.scanBarcode(context)
                                .then((value) {
                              "Come Back".printf(name: "barcode result");
                            });
                          } else {
                            Navigator.pop(context);
                          }
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  ),
                ],
                // ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
