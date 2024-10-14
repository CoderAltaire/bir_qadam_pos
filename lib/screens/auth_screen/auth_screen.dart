import 'package:bir_qadam_pos/bloc/bloc.dart';
import 'package:bir_qadam_pos/core/core.dart';
import 'package:bir_qadam_pos/models/branch/branch_model.dart';
import 'package:bir_qadam_pos/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import '../../hive_helper/hive_helper.dart';
import '../../models/models.dart';
import '../widgets/widgets.dart';
import 'close_shift.dart';

class AuthentificationScreen extends StatefulWidget {
  const AuthentificationScreen({super.key});

  @override
  State<AuthentificationScreen> createState() => _AuthentificationScreenState();
}

class _AuthentificationScreenState extends State<AuthentificationScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetBranchBloc>(context).add(GetAllBranchEvent());
  }

  String mainBranch = 'Filialni tanlang';
  String mainWerehouse = 'Omborni tanlang';
  String mainposDesktop = "Kassani tanlang";
  List<int> posdesk = [1, 2];
  List<BranchModel> branches = [];
  List<WerehouseModel> werehouses = [];
  final Box<WerehouseModel> werehouseBox = HiveBoxes.wereHouse;
  final Box<BranchModel> branchBox = HiveBoxes.branch;
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          BlocProvider.of<GetBranchBloc>(context).add(GetAllBranchEvent());
        },
        child: Padding(
          padding: EdgeInsets.all(15.sp),
          child: SingleChildScrollView(
            // physics: const NeverScrollableScrollPhysics(),
            child: BlocConsumer<OpenSessionBloc, OpenSessionState>(
              listener: (context, state) {
                if (state is OpenSessionSuccess) {
                
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                    builder: (context) {
                      return const HomeScreen();
                    },
                  ), (Route<dynamic> route) => false);
                }
                if (state is OpenSessionFailure) {
                  RegExp regExp = RegExp(r'\[(.*?)\]');
                  Match? match = regExp.firstMatch(state.message);
                  String extractedText = match != null ? match.group(1)! : '';
                  Fluttertoast.showToast(
                      msg: extractedText,
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      textColor: Colors.white,
                      fontSize: 16.0);
                }
              },
              builder: (context, state) {
                return Column(
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
                    SizedBox(height: 20.w),
                    Center(
                        child: Text(
                      "Iltimos tizimga kiring",
                      style: AppTextStyle.semiBold(size: 18),
                    )),
                    Container(),
                    Padding(
                      padding: EdgeInsets.only(top: 22.w, bottom: 7.w),
                      child: const Text("Filial"),
                    ),
                    // AppInputField(
                    //     hint: "Filialni tanlang", fillColor: AppColors.white),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.sp),
                      decoration: AppShape.simpleContainer(),
                      child: BlocConsumer<GetBranchBloc, GetBranchState>(
                        listener: (context, state) {
                          if (state is GetAllBranchSuccess) {
                            branches = state.branchesList;
                          }
                        },
                        builder: (context, state) {
                          return PopupMenuButton(
                              offset: const Offset(90, 0),
                              padding: EdgeInsets.all(5.sp),
                              color: AppColors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 2),
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                              child: Container(
                                height: 50.w,
                                color: AppColors.white,
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    state is GetAllBranchProccess
                                        ? const Row(
                                            children: [
                                              SizedBox(
                                                  height: 35,
                                                  width: 35,
                                                  child:
                                                      CircularProgressIndicator(
                                                    strokeWidth: 1,
                                                  )),
                                            ],
                                          )
                                        : Text(mainBranch),
                                    const Spacer(),
                                    const Icon(
                                        Icons.keyboard_arrow_down_rounded)
                                  ],
                                ),
                              ),
                              onSelected: (value) {
                                mainBranch = value.name ?? "";
                                BlocProvider.of<GetWerehouseBloc>(context)
                                    .add(GetAllWerehouseEvent(value.id ?? 0));
                                branchBox.clear();
                                branchBox.put(value.key, value);
                                AppPrefs.setBranch(value.id ?? 0);
                                setState(() {});
                              },
                              itemBuilder: (_) {
                                return branches.map((e) {
                                  return PopupMenuItem(
                                      value: e,
                                      child: Container(
                                        color: AppColors.white,
                                        child: Text(e.name ?? ""),
                                      ));
                                }).toList();
                              });
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 22.w, bottom: 7.w),
                      child: const Text("Ombor"),
                    ),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.sp),
                      decoration: AppShape.simpleContainer(),
                      child: BlocConsumer<GetWerehouseBloc, GetWerehouseState>(
                        listener: (context, state) {
                          if (state is GetAllWerehouseSuccess) {
                            werehouses = state.werehouseesList;
                          }
                        },
                        builder: (context, state) {
                          return PopupMenuButton(
                              offset: const Offset(90, 0),
                              padding: EdgeInsets.all(5.sp),
                              color: AppColors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 2),
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                              child: Container(
                                height: 50.w,
                                color: AppColors.white,
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    state is GetAllWerehouseProccess
                                        ? const Row(
                                            children: [
                                              SizedBox(
                                                  height: 35,
                                                  width: 35,
                                                  child:
                                                      CircularProgressIndicator(
                                                    strokeWidth: 1,
                                                  )),
                                            ],
                                          )
                                        : Text(mainWerehouse),
                                    const Spacer(),
                                    const Icon(
                                        Icons.keyboard_arrow_down_rounded)
                                  ],
                                ),
                              ),
                              onSelected: (value) {
                                mainWerehouse = value.name ?? "";
                                werehouseBox.clear();
                                werehouseBox.put(value.key, value);
                                AppPrefs.setWereHouse(value.id ?? 0);
                                setState(() {});
                              },
                              itemBuilder: (_) {
                                return werehouses.map((e) {
                                  return PopupMenuItem(
                                      value: e,
                                      child: Container(
                                        color: AppColors.white,
                                        child: Text(e.name ?? ""),
                                      ));
                                }).toList();
                              });
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 22.w, bottom: 7.w),
                      child: const Text("Kassa"),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.sp),
                      decoration: AppShape.simpleContainer(),
                      child: PopupMenuButton(
                          offset: const Offset(90, 0),
                          padding: EdgeInsets.all(5.sp),
                          color: AppColors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          child: Container(
                            height: 50.w,
                            color: AppColors.white,
                            width: double.infinity,
                            child: Row(
                              children: [
                                Text(mainposDesktop),
                                const Spacer(),
                                const Icon(Icons.keyboard_arrow_down_rounded)
                              ],
                            ),
                          ),
                          onSelected: (value) {
                            mainposDesktop = value.toString();
                            AppPrefs.setPosDesk(value);
                            setState(() {});
                          },
                          itemBuilder: (_) {
                            return posdesk.map((e) {
                              return PopupMenuItem(
                                  value: e,
                                  child: Container(
                                    color: AppColors.white,
                                    child: Text(e.toString()),
                                  ));
                            }).toList();
                          }),
                    ),
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
                        keyboardType: TextInputType.number,
                        isHidden: _isHidden,
                        formatters: [AppValidator.codeFormatter],
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isHidden = !_isHidden;
                            });
                          },
                          icon: _isHidden
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                        ),
                        fillColor: AppColors.white,
                      ),
                    ),
                    SizedBox(height: 22.w),
                    Row(
                      children: [
                        Expanded(
                            child: PrimaryButton(
                          enableColor: false,
                          label: "Seans yakunlash",
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
                          child: PrimaryButton(
                            label: "Kirish",
                            loading: state is OpenSessionProcces ? true : false,
                            onPressed: () {
                              if (AppPrefs.getPosDesk != 0 &&
                                  mainBranch != 'Filialni tanlang' &&
                                  mainWerehouse != 'Omborni tanlang' &&
                                  mainposDesktop != "Kassani tanlang") {
                                BlocProvider.of<OpenSessionBloc>(context)
                                    .add(StartOpenSessionEvent(
                                  phoneController.text,
                                  passwordController.text,
                                ));
                              } else {
                                Fluttertoast.showToast(
                                    msg:
                                        "Iltimos kerak maydonlarning barchasini to`ldiring",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 22.w),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
