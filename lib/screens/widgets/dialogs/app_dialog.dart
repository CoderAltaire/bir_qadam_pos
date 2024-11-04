import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bir_qadam_pos/core/core.dart';
import 'package:provider/provider.dart';
import '../../../bloc/bloc.dart';
import '../../../bloc/searching/bloc.dart';
import '../../../models/product/product_model.dart';
import '../../../provider/ordering_provider.dart';
import '../../../translations/translations.dart';
import '../../home/components/products_search/product_search_item.dart';
import '../widgets.dart';

class AppDialog {
  final BuildContext context;

  AppDialog(this.context);

  // ===== GENDER DIALOG =================================================== //
  Future werehouseDialog(TextEditingController controller) async {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        insetPadding: EdgeInsets.zero,
        shape: AppShape.circularBorder(radius: 20.0),
        elevation: 0,
        backgroundColor: Colors.white,
        child: SizedBox(
          width: ScreenUtil().scaleWidth * .9,
          height: 120.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _setGender(LocaleKeys.man.tr(), controller),
              SizedBox(height: ScreenUtil.defaultSize.height * .02),
              _setGender(LocaleKeys.woman.tr(), controller),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector _setGender(
    String gender,
    TextEditingController controller,
  ) =>
      GestureDetector(
        onTap: () {
          controller.text = gender;
          () {
            Navigator.pop(context);
          };
        },
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(left: 16.w),
          child: Text(gender, style: AppTextStyle.semiBold(size: 15.sp)),
        ),
      );
//=======================================
  showAlertDialog({
    required String label,
    required VoidCallback? onPressed,
    required String title,
  }) {
    showDialog(
      context: context,
      builder: (_) => _AlertDialogWidget(
        label: label,
        onPressed: onPressed,
        title: title,
      ),
    );
  }
  // ======= SIMPLE DIALOG ================================================== //

  void simpleDialog({
    String title = '',
    String content = '',
    VoidCallback? onYesPressed,
  }) {
    showDialog(
        context: context,
        builder: (_) {
          if (Platform.isIOS) {
            return CupertinoAlertDialog(
              title: _setSemiBoldText(title),
              content: SizedBox(
                height: 50.w,
                child: Column(
                  children: [
                    Container(height: 40, child: TextField()),
                  ],
                ),
              ),
              actions: [
                AppTextButton(
                  key: AppKeys.dialogYes,
                  label: "Qiriduv",
                  onPressed: onYesPressed,
                ),
              ],
            );
          }
          return AlertDialog(
            contentPadding: EdgeInsets.fromLTRB(12.w, 8.h, 12.w, 0),
            titlePadding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 0),
            backgroundColor: Colors.white,
            title: _setSemiBoldText(title),
            content: Text(content, style: AppTextStyle.medium()),
            actions: <Widget>[
              AppTextButton(
                  key: AppKeys.dialogNo,
                  label: LocaleKeys.no.tr(),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              AppTextButton(
                key: AppKeys.dialogYes,
                label: LocaleKeys.yes.tr(),
                onPressed: onYesPressed,
              ),
            ],
          );
        });
  }

  searchDialog({
    VoidCallback? onYesPressed,
  }) {
    showDialog(
        context: context,
        builder: (_) {
          return BlocConsumer<SearchingBloc, SearchingState>(
            listener: (context, state) {
              if (state is SearchSucces) {
                state.products;
              }
            },
            builder: (context, state) {
              if (state is SearchProccess) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        border: Border.all(color: AppColors.greyEf),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            child: const CircularProgressIndicator(
                              strokeWidth: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              } else if (state is SearchSucces) {
                return Padding(
                    padding:
                        EdgeInsets.only(top: 60, left: 15.sp, right: 70.sp),
                    child: Container(
                      height: state.products.length > 5
                          ? 350.w
                          : state.products.length * 70.w,
                      width: 400,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        border: Border.all(color: AppColors.greyEf),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: state.products.length,
                        itemBuilder: (context, index) {
                          ProductModel product = state.products[index];
                          return ProductSearchItem(
                            product: product,
                            query: state.query,
                          );
                        },
                      ),
                    ));
              } else {
                return const SizedBox();
              }
            },
          );
        });
  }

  TextEditingController orderIdController = TextEditingController();

  /// show barcode
  void showEnterIdDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.sp),
          child: AlertDialog(
            titlePadding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
            actionsPadding:
                EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.w, vertical: 2.h),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r)),
            actionsAlignment: MainAxisAlignment.spaceBetween,
            insetPadding: EdgeInsets.zero,
            title: Row(
              children: [
                Text(
                  'ID raqam bo`yicha qidiruv',
                  style: AppTextStyle.medium(size: 18),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: AppColors.greyF4,
                    icon: const Icon(Icons.close_rounded))
              ],
            ),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 1.w, bottom: 7.w),
                  child: Text(
                    "ID raqam kiriting",
                    style:
                        AppTextStyle.regular(size: 14, color: AppColors.greyF6),
                  ),
                ),
                AppInputField(
                  autfocus: true,
                  style: AppTextStyle.regular(size: 16),
                  hintStyle: AppTextStyle.regular(size: 16),
                  controller: orderIdController,
                  hint: 'Matn kiriting',
                ),
              ],
            ),
            actions: [
              PrimaryButton(
                  label: "Qidiruv",
                  onPressed: () {
                    // Ma'lumotni qayta ishlash uchun kerakli joyda
                    Navigator.of(context).pop();
                    BlocProvider.of<GetOrdersWithIdBloc>(context).add(
                      StartGetOrdersWithIdEvent(orderIdController.text),
                    );
                  })
            ],
          ),
        );
      },
    );
  }

  /// show barcode
  void showOrderSucces() {
    showDialog(
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.sp),
          child: AlertDialog(
            titlePadding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
            actionsPadding:
                EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.w, vertical: 2.h),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r)),
            actionsAlignment: MainAxisAlignment.spaceBetween,
            insetPadding: EdgeInsets.zero,
            title: Row(
              children: [
                Text(
                  'Tasdiqlandi',
                  style: AppTextStyle.medium(size: 18),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: AppColors.greyF4,
                    icon: const Icon(Icons.close_rounded))
              ],
            ),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 1.w, bottom: 7.w),
                  child: Text(
                    "Order muvaffaqiyatli tasdiqlandi.",
                    style:
                        AppTextStyle.regular(size: 16, color: AppColors.greyF6),
                  ),
                ),
              ],
            ),
            actions: [
              PrimaryButton(
                  label: "OK",
                  onPressed: () {
                    Provider.of<OrderingProvider>(context, listen: false)
                        .cancelOrdering();
                    Navigator.of(context).pop();
                  })
            ],
          ),
        );
      },
    );
  }

  // ///Select Product Variant
  // void selectProductVariant(ProductModel _product) {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return Padding(
  //         padding: EdgeInsets.symmetric(horizontal: 30.sp),
  //         child: Container(
  //           height: MediaQuery.of(context).size.height * 0.5,
  //           child: AlertDialog(
  //             titlePadding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
  //             actionsPadding:
  //                 EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
  //             contentPadding:
  //                 EdgeInsets.symmetric(horizontal: 20.w, vertical: 2.h),
  //             shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(12.r)),
  //             actionsAlignment: MainAxisAlignment.spaceBetween,
  //             insetPadding: EdgeInsets.zero,
  //             title: Row(
  //               children: [
  //                 Text(
  //                   'Maxsulotning turini tanlang',
  //                   style: AppTextStyle.medium(size: 18),
  //                 ),
  //                 const Spacer(),
  //                 IconButton(
  //                     onPressed: () {
  //                       Navigator.pop(context);
  //                     },
  //                     color: AppColors.greyF4,
  //                     icon: const Icon(Icons.close_rounded))
  //               ],
  //             ),
  //             content: SizedBox(
  //               child: SingleChildScrollView(
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.stretch,
  //                   children: [
  //                     ...(_product ).map((e) {
  //                       return Padding(
  //                         padding: EdgeInsets.symmetric(vertical: 5.sp),
  //                         child: InkWell(
  //                           onTap: () {
  //                             ItemModel item = ItemModel(
  //                               product: e,
  //                               actualPrice: e.regularPrice,
  //                               actualQuantity: e.quantityAvailable,
  //                               price: e.regularPrice,
  //                               productVariant: ProductVariant(),
  //                               quantity: "1",
  //                               currentValue: 1,
  //                             );
  //                             Provider.of<OrderingProvider>(context,
  //                                     listen: false)
  //                                 .addProduct(
  //                               item: item,
  //                             );
  //                             // BlocProvider.of<AddSearchingProductsBloc>(context)
  //                             //     .add(GetSearchedProductWithWord(item: item));
  //                             Navigator.pop(context);
  //                           },
  //                           child: Container(
  //                             decoration: BoxDecoration(
  //                               borderRadius: BorderRadius.circular(12.r),
  //                               border: Border.all(color: AppColors.greyEf),
  //                             ),
  //                             child: Padding(
  //                               padding: EdgeInsets.symmetric(
  //                                   horizontal: 10.sp, vertical: 12.sp),
  //                               child: Text(
  //                                 e.name ?? "",
  //                                 style: AppTextStyle.regular(size: 16),
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       );
  //                     }),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //             actions: [],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  ///Select Product From Pistol Variant
  void selectVariantFromPistol(List<ProductModel> _product) {
    showDialog(
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.sp),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: AlertDialog(
              titlePadding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
              actionsPadding:
                  EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.w, vertical: 2.h),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r)),
              actionsAlignment: MainAxisAlignment.spaceBetween,
              insetPadding: EdgeInsets.zero,
              title: Row(
                children: [
                  Text(
                    'Maxsulotning turini tanlang',
                    style: AppTextStyle.medium(size: 18),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      color: AppColors.greyF4,
                      icon: const Icon(Icons.close_rounded))
                ],
              ),
              content: SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ..._product.map((e) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.sp),
                          child: InkWell(
                            onTap: () {
                              ItemModel item = ItemModel(
                                product: e,
                                id: e.id,
                                actualPrice: e.regularPrice,
                                actualQuantity: e.quantityAvailable,
                                price: e.regularPrice,
                                productVariant: e.productVariants,
                                quantity: "1",
                                currentValue: 1,
                              );
                              Provider.of<OrderingProvider>(context,
                                      listen: false)
                                  .addProduct(
                                item: item,
                              );
                              // BlocProvider.of<AddSearchingProductsBloc>(context)
                              //     .add(GetSearchedProductWithWord(item: item));
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                                border: Border.all(color: AppColors.greyEf),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.sp, vertical: 12.sp),
                                child: Text(
                                  e.productVariants?.name ?? "Nomsiz",
                                  maxLines: 1,
                                  style: AppTextStyle.regular(size: 16),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
              actions: [
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.stretch,
                //   children: [
                //     PrimaryButton(
                //         label: "OK",
                //         onPressed: () {
                //           Provider.of<OrderingProvider>(context, listen: false)
                //               .cancelOrdering();
                //           Navigator.of(context).pop();
                //         }),
                //   ],
                // )
              ],
            ),
          ),
        );
      },
    );
  }

  Text _setSemiBoldText(String text) {
    return Text(
      text,
      style: AppTextStyle.semiBold(size: 18),
    );
  }

  Future setBirthDate(TextEditingController controller) async {
    String initialDate = controller.text;
    if (Platform.isIOS) {
      showModalBottomSheet(
          context: context,
          builder: (_) {
            return SizedBox(
              height: 320.h,
              child: Column(
                children: [
                  CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    initialDateTime: AppFormatter.parseDate(initialDate),
                    maximumDate: DateTime(2015),
                    onDateTimeChanged: (v) {
                      String date = AppFormatter.formatDate(v);
                      controller.text = date;
                    },
                  ).wrapExpanded(),
                  AppTextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    label: LocaleKeys.back.tr(),
                  )
                ],
              ),
            );
          });

      return;
    }

    DateTime? dateTime = await showDatePicker(
      context: context,
      currentDate: AppFormatter.parseDate(initialDate),
      initialDate: AppFormatter.parseDate(initialDate),
      firstDate: DateTime(1950),
      lastDate: DateTime(2015),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            useMaterial3: true,
            brightness: Brightness.dark,
            colorSchemeSeed: AppColors.primary,
            datePickerTheme: const DatePickerThemeData(),
          ),
          child: child ?? const SizedBox(),
        );
      },
    );

    if (dateTime == null) return;
    String date = AppFormatter.formatDate(dateTime);
    controller.text = date;
  }
}

class _AlertDialogWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final String title;
  const _AlertDialogWidget({
    required this.label,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    // double halfWidth = MediaQuery.of(context).size.width / 2 - 56.w;
    return AlertDialog(
      contentPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      titlePadding: EdgeInsets.fromLTRB(8.w, 35.h, 8.w, 35.h),
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: AppTextStyle.semiBold(size: 18, color: AppColors.dark),
      ),
      content: Row(
        children: [
          Expanded(
            // width: halfWidth - 12,
            child: AppOutlinedButton(
              label: LocaleKeys.no.tr(),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            // width: halfWidth - 12,
            child: AppOutlinedButton(
              label: label,
              onPressed: onPressed,
            ),
          ),
          // Expanded(
          //   child: PrimaryButton(
          //     label: label,
          //     onPressed: onPressed,
          //   ),
          // ),
        ],
      ),
    );
  }
}
