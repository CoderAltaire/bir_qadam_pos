import 'package:bir_qadam_pos/core/core.dart';
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
  List<String> types = ["first location", " second location", "thisd location"];
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: SingleChildScrollView(
          // physics: const NeverScrollableScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 25.w),
                Center(
                    child: Text(
                  "Tizimga kirish",
                  style: AppTextStyle.semiBold(size: 18),
                )),
                Container(color: AppColors.dark, height: 1),
                SizedBox(height: 20.w),
                Center(
                  child: SizedBox(
                      height: 200.w,
                      child: Image.asset("assets/images/avatar.png")),
                ),
                SizedBox(height: 50.w),
                Center(
                    child: Text(
                  "Iltimos tizimga kiring",
                  style: AppTextStyle.semiBold(size: 18),
                )),
                Padding(
                  padding: EdgeInsets.only(top: 22.w, bottom: 7.w),
                  child: const Text("Telefon raqam"),
                ),
                SizedBox(
                  height: 51.w,
                  child: AppInputField(
                    keyboardType: TextInputType.number,
                    hint: "",
                    controller: phoneController,
                    fillColor: AppColors.white,
                    formatters: [AppValidator.phoneFormatter],
                    prefixIcon: Container(
                      width: 70.w,
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.h),
                        child: Text(
                          '+998',
                          style: AppTextStyle.medium(),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 22.w, bottom: 7.w),
                  child: const Text("Parol"),
                ),
                SizedBox(
                  height: 51.w,
                  child: AppInputField(
                    controller: passwordController,
                    suffixIcon: const Icon(Icons.visibility_off),
                    fillColor: AppColors.white,
                  ),
                ),
                const Spacer(),
                SizedBox(height: 22.w),
                Row(
                  children: [
                    Expanded(
                        child: PrimaryButton(
                      label: "Seans yakunlash",
                      enableColor: false,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const ColseShiftScreen();
                          },
                        ));
                      },
                    )),
                    SizedBox(
                      width: 20.h,
                    ),
                    Expanded(
                      child: BlocConsumer<CloseSessionBloc, CloseSessionState>(
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
                              Navigator.pushAndRemoveUntil(context,
                                  MaterialPageRoute(builder: (context) {
                                return const HomeScreen();
                              }), (Route<dynamic> route) => false);

                              // BlocProvider.of<OpenSessionBloc>(context)
                              //     .add(StartLoginSessionEvent(
                              //   phoneController.text,
                              //   passwordController.text,
                              // ));
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
    );
  }
}
