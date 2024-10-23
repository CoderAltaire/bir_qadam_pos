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
    _passfocusNode.addListener(() {
      setState(() {}); // Fokus holati o'zgarganda UI yangilanadi
    });
    _phonefocusNode.addListener(() {
      setState(() {}); // Fokus holati o'zgarganda UI yangilanadi
    });
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

  final FocusNode _passfocusNode = FocusNode();
  final FocusNode _phonefocusNode = FocusNode();

  bool keyboardVisible = false;

  @override
  void dispose() {
    _passfocusNode.dispose();
    _phonefocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    keyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(builder: (context, constraints) {
          return RefreshIndicator(
            onRefresh: () async {
              BlocProvider.of<GetBranchBloc>(context).add(GetAllBranchEvent());
            },
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
                    children: [
                      SizedBox(height: 20.w),
                      Center(
                          child: Text(
                        "Tizimga kirish",
                        style: AppTextStyle.semiBold(size: 16),
                      )),
                      SizedBox(height: 20.w),
                      Container(color: AppColors.dark, height: 1),
                      Padding(
                        padding: EdgeInsets.all(15.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20.w),
                            Center(
                              child: SizedBox(
                                height: 200.w,
                                child: Image.asset(
                                  "assets/images/avatar.png",
                                ),
                              ),
                            ),

                            SizedBox(height: 20.w),
                            Center(
                                child: Text(
                              "Iltimos, tizimga kiring",
                              style: AppTextStyle.medium(size: 18),
                            )),
                            Container(),
                            Padding(
                              padding: EdgeInsets.only(top: 22.w, bottom: 7.w),
                              child: Text(
                                "Filial",
                                style: AppTextStyle.regular(
                                    color: AppColors.greyF6),
                              ),
                            ),
                            // AppInputField(
                            //     hint: "Filialni tanlang", fillColor: AppColors.white),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 15.sp),
                              decoration: AppShape.simpleContainer2(
                                  color: AppColors.greyEf),
                              child:
                                  BlocConsumer<GetBranchBloc, GetBranchState>(
                                listener: (context, state) {
                                  if (state is GetAllBranchSuccess) {
                                    branches = state.branchesList;
                                  }
                                },
                                builder: (context, state) {
                                  double heightPopUp = branches.isEmpty
                                      ? 50.w
                                      : branches.length * 55.w;
                                  return PopupMenuButton(
                                      constraints: BoxConstraints.expand(
                                          height: heightPopUp),
                                      color: AppColors.white,
                                      offset: keyboardVisible
                                          ? const Offset(90, 250)
                                          : const Offset(90, 50),
                                      onOpened: () {
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode());
                                        setState(() {});
                                      },
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color:
                                                Theme.of(context).primaryColor,
                                            width: 1),
                                        borderRadius:
                                            BorderRadius.circular(15.r),
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
                                                : Text(
                                                    mainBranch,
                                                    style: AppTextStyle.regular(
                                                        color: mainBranch ==
                                                                "Filialni tanlang"
                                                            ? AppColors.greyF6
                                                            : AppColors.dark),
                                                  ),
                                            const Spacer(),
                                            const Icon(Icons
                                                .keyboard_arrow_down_rounded)
                                          ],
                                        ),
                                      ),
                                      onSelected: (value) {
                                        FocusScope.of(context).unfocus();

                                        mainBranch = value.name ?? "";
                                        BlocProvider.of<GetWerehouseBloc>(
                                                context)
                                            .add(GetAllWerehouseEvent(
                                                value.id ?? 0));
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
                              child: Text(
                                "Ombor",
                                style: AppTextStyle.regular(
                                    color: AppColors.greyF6),
                              ),
                            ),

                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 15.sp),
                              decoration: AppShape.simpleContainer2(
                                  color: AppColors.greyEf),
                              child: BlocConsumer<GetWerehouseBloc,
                                  GetWerehouseState>(
                                listener: (context, state) {
                                  if (state is GetAllWerehouseSuccess) {
                                    werehouses = state.werehouseesList;
                                  }
                                },
                                builder: (context, state) {
                                  double heightPopUp = werehouseBox.isEmpty
                                      ? 150.w
                                      : werehouseBox.length * 55.w;
                                  return PopupMenuButton(
                                      constraints: BoxConstraints.expand(
                                          height: heightPopUp, width: 400),
                                      offset: keyboardVisible
                                          ? const Offset(90, 250)
                                          : const Offset(90, 50),
                                      onOpened: () {
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode());
                                        setState(() {});
                                      },
                                      color: AppColors.white,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color:
                                                Theme.of(context).primaryColor,
                                            width: 1),
                                        borderRadius:
                                            BorderRadius.circular(15.r),
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
                                                : Text(
                                                    mainWerehouse,
                                                    style: AppTextStyle.regular(
                                                        color: mainWerehouse ==
                                                                "Omborni tanlang"
                                                            ? AppColors.greyF6
                                                            : AppColors.dark),
                                                  ),
                                            const Spacer(),
                                            const Icon(Icons
                                                .keyboard_arrow_down_rounded)
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
                              child: Text(
                                "Kassa",
                                style: AppTextStyle.regular(
                                    color: AppColors.greyF6),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 15.sp),
                              decoration: AppShape.simpleContainer2(
                                  color: AppColors.greyEf),
                              child: PopupMenuButton(
                                  constraints:
                                      BoxConstraints.expand(height: 110.w),
                                  offset: keyboardVisible
                                      ? const Offset(90, 250)
                                      : const Offset(90, 50),
                                  onOpened: () {
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());
                                    setState(() {});
                                  },
                                  padding: EdgeInsets.all(5.sp),
                                  color: AppColors.white,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Theme.of(context).primaryColor,
                                        width: 1),
                                    borderRadius: BorderRadius.circular(15.r),
                                  ),
                                  child: Container(
                                    height: 50.w,
                                    color: AppColors.white,
                                    width: double.infinity,
                                    child: Row(
                                      children: [
                                        Text(
                                          mainposDesktop,
                                          style: AppTextStyle.regular(
                                              color: mainposDesktop ==
                                                      "Kassani tanlang"
                                                  ? AppColors.greyF6
                                                  : AppColors.dark),
                                        ),
                                        const Spacer(),
                                        const Icon(
                                            Icons.keyboard_arrow_down_rounded)
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
                              child: Text(
                                "Telefon raqam",
                                style: AppTextStyle.regular(
                                    color: AppColors.greyF6),
                              ),
                            ),
                            SizedBox(
                              height: 51.w,
                              child: AppInputField(
                                focusNode: _phonefocusNode,
                                keyboardType: TextInputType.number,
                                hint: "",
                                controller: phoneController,
                                fillColor: AppColors.white,
                                enableBorderColor: AppColors.greyEf,
                                style: AppTextStyle.regular(),
                                formatters: [AppValidator.phoneFormatter],
                                onEnding: () {
                                  FocusScope.of(context).unfocus();
                                },
                                prefixIcon: Container(
                                  width: 70.w,
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10.h),
                                    child: Text(
                                      '+998',
                                      style: AppTextStyle.regular(),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 22.w, bottom: 7.w),
                              child: Text(
                                "Parol",
                                style: AppTextStyle.regular(
                                    color: AppColors.greyF6),
                              ),
                            ),
                            SizedBox(
                              height: 51.w,
                              child: AppInputField(
                                focusNode: _passfocusNode,
                                onEnding: () {
                                  FocusScope.of(context).unfocus();
                                },
                                controller: passwordController,
                                keyboardType: TextInputType.number,
                                isHidden: _isHidden,
                                style: AppTextStyle.regular(),
                                enableBorderColor: AppColors.greyEf,
                                // style: AppTextStyle.regular(color: AppColors.greyF6),
                                formatters: [AppValidator.codeFormatter],
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
                                        return ColseShiftScreen(
                                          password: passwordController.text,
                                          phone: phoneController.text,
                                          branchName: mainBranch,
                                          wereHouse: werehouses,
                                          posdesk: mainposDesktop,
                                          branches: branches,
                                          werehouseName: mainWerehouse,
                                        );
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
                                    loading: state is OpenSessionProcces
                                        ? true
                                        : false,
                                    onPressed: () {
                                      if (AppPrefs.getPosDesk != 0 &&
                                          mainBranch != 'Filialni tanlang' &&
                                          mainWerehouse != 'Omborni tanlang' &&
                                          mainposDesktop != "Kassani tanlang") {
                                        BlocProvider.of<OpenSessionBloc>(
                                                context)
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
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        }),
      ),
    );
  }
}
