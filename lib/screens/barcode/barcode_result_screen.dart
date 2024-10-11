import 'package:flutter/material.dart';
import 'package:bir_qadam_pos/core/core.dart';
import 'package:bir_qadam_pos/services/barcode_scanning_service.dart';
import '../../bloc/bloc.dart';
import '../../models/product/product_model.dart';
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
            if (state is BarcodeSuccessState) {}
          },
          builder: (context, state) {
            if (state is BarcodeLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is BarcodeSuccessState) {
              ProductModel product = state.products;

              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 400.w,
                    child: Image.network(
                      product.mainImage?.normal ??
                          "https://www.google.com/url?sa=i&url=https%3A%2F%2Fstock.adobe.com%2Fsearch%3Fk%3Dno%2Bphoto%2Bimage&psig=AOvVaw2HdF_Fsnyw2z5Inqnw7Mbf&ust=1728627126194000&source=images&cd=vfe&opi=89978449&ved=0CBMQjRxqFwoTCICK8v-Tg4kDFQAAAAAdAAAAABAE",
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
                            style: AppTextStyle.medium(
                                color: const Color(0xff545454), size: 18),
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
                  Padding(
                    padding: EdgeInsets.fromLTRB(14.w, 15.h, 14.w, 0),
                    child: Text(
                      product.name ?? "",
                      style: AppTextStyle.medium(
                          color: const Color(0xff545454), size: 18),
                    ),
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      PrimaryButton(
                        label: "Qo`shish",
                        onPressed: () async {
                          ItemModel item = ItemModel(
                            product: product,
                            actualPrice: product.regularPrice,
                            actualQuantity: "1",
                            price: product.regularPrice,
                            productVariant: ProductVariant(),
                            quantity: "1",
                          );

                          BlocProvider.of<AddSearchingProductsBloc>(context)
                              .add(GetSearchedProduct(item: item));
                          if (Platform.isIOS) {
                            Navigator.pop(context);
                            BarcodeScanningService.scanBarcode().then((value) {
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
