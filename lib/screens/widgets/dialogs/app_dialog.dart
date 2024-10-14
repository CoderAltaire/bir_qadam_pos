import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bir_qadam_pos/core/core.dart';
import '../../../bloc/bloc.dart';
import '../../../translations/translations.dart';
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
                  style: AppTextStyle.medium(size: 20),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
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
                    "ID raqam kiritish",
                    style:
                        AppTextStyle.regular(size: 15, color: AppColors.greyF6),
                  ),
                ),
                AppInputField(
                  autfocus: true,
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
