import 'package:bir_qadam_pos/core/core.dart';
import 'package:bir_qadam_pos/hive_helper/hive_prefs.dart';
import 'package:flutter/material.dart';
import '../../bloc/bloc.dart';
import '../home/home_screen.dart';
import '../widgets/widgets.dart';
import 'close_shift.dart';

class LockedScreen extends StatefulWidget {
  const LockedScreen({super.key});

  @override
  State<LockedScreen> createState() => _LockedScreenState();
}

class _LockedScreenState extends State<LockedScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isHidden = true;
  @override
  Widget build(BuildContext context) {
    phoneController.text = AppPrefs.phone;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.sp),
                child: Center(
                    child: Text(
                  "Tizimga kirish",
                  style: AppTextStyle.semiBold(size: 16),
                )),
              ),
              Container(color: AppColors.dark.withOpacity(0.3), height: 1),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.sp),
                child: SingleChildScrollView(
                  // physics: const NeverScrollableScrollPhysics(),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.88,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(),
                        Center(
                          child: SizedBox(
                            height: 200.w,
                            child: Image.asset(
                              "assets/images/avatar.png",
                            ),
                          ),
                        ),
                        // SizedBox(height: 50.w),
                        Center(
                            child: Text(
                          "Iltimos, tizimga kiring",
                          style: AppTextStyle.medium(size: 18),
                        )),
                        Padding(
                          padding: EdgeInsets.only(top: 22.w, bottom: 7.w),
                          child: Text(
                            "Telefon raqam",
                            style:
                                AppTextStyle.regular(color: AppColors.greyF6),
                          ),
                        ),
                        SizedBox(
                          height: 51.w,
                          child: SizedBox(
                            height: 51.w,
                            child: AppInputField(
                                controller: phoneController,
                                formatters: [AppValidator.phoneFormatter],
                                keyboardType: TextInputType.number,
                                enableBorderColor: AppColors.greyEf,
                                style: AppTextStyle.regular(),
                                prefixIcon: Container(
                                  width: 70.w,
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10.h),
                                    child: Text(
                                      ' +998',
                                      style: AppTextStyle.regular(),
                                    ),
                                  ),
                                ),
                                hint: "",
                                fillColor: AppColors.white),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 22.w, bottom: 7.w),
                          child: Text(
                            "Parol",
                            style:
                                AppTextStyle.regular(color: AppColors.greyF6),
                          ),
                        ),
                        SizedBox(
                          height: 51.w,
                          child: AppInputField(
                            isHidden: _isHidden,
                            enableBorderColor: AppColors.greyEf,
                            keyboardType: TextInputType.number,
                            formatters: [AppValidator.codeFormatter],
                            controller: passwordController,
                            style: AppTextStyle.regular(),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isHidden = !_isHidden;
                                });
                              },
                              icon: _isHidden
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                            ),
                            fillColor: AppColors.white,
                          ),
                        ),

                        const Spacer(),
                        SizedBox(height: 50.w),
                        Row(
                          children: [
                            Expanded(
                                child: PrimaryButton(
                              label: "Seans yakunlash",
                              enableColor: false,
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return ColseShiftScreen(
                                      password: passwordController.text,
                                      phone: phoneController.text,
                                      branchName: 'Filialni tanlang',
                                      branches: const [],
                                      posdesk: "Kassani tanlang",
                                      wereHouse: const [],
                                      werehouseName: 'Omborni tanlang',
                                    );
                                  },
                                ));
                              },
                            )),
                            SizedBox(
                              width: 20.h,
                            ),
                            Expanded(
                              child: BlocConsumer<CloseSessionBloc,
                                  CloseSessionState>(
                                listener: (context, state) {
                                  if (state is LoginSessionSuccess) {
                                    Navigator.pushAndRemoveUntil(context,
                                        MaterialPageRoute(builder: (context) {
                                      return const HomeScreen();
                                    }), (Route<dynamic> route) => false);
                                  }

                                  if (state is CloseSessionFailure) {
                                    Fluttertoast.showToast(
                                        msg: "Error Closing Session !s",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  }
                                },
                                builder: (context, state) {
                                  return PrimaryButton(
                                    label: "Kirish",
                                    onPressed: () {
                                      if (AppPrefs.password ==
                                          passwordController.text) {
                                        Navigator.pushAndRemoveUntil(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return const HomeScreen();
                                        }), (Route<dynamic> route) => false);
                                      } else {
                                        Fluttertoast.showToast(
                                            msg: "Parol noto`gri !",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.CENTER,
                                            timeInSecForIosWeb: 1,
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                      }
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 22.w),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
