import 'package:bir_qadam_pos/core/core.dart';
import 'package:bir_qadam_pos/hive_helper/hive_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../bloc/bloc.dart';
import '../../models/branch/branch_model.dart';
import '../../models/models.dart';
import '../widgets/widgets.dart';
import 'auth_screen.dart';

class ColseShiftScreen extends StatefulWidget {
  final String phone;
  final String password;
  final List<BranchModel> branches;
  final List<WerehouseModel> wereHouse;
  final List<PosDeskModel> posdesk;
  final String posdeskName;
  final String branchName;
  final String werehouseName;

  const ColseShiftScreen(
      {super.key,
      required this.phone,
      required this.password,
      required this.posdesk,
      required this.branchName,
      required this.branches,
      required this.werehouseName,
      required this.wereHouse,
      required this.posdeskName});

  @override
  State<ColseShiftScreen> createState() => _ColseShiftScreenState();
}

class _ColseShiftScreenState extends State<ColseShiftScreen> {
  @override
  void initState() {
    super.initState();
    phoneControlller.text = widget.phone;
    passwordControlller.text = widget.password;
    if (widget.branchName != "Filialni tanlang'") {
      mainBranch = widget.branchName;
    }
    if (widget.werehouseName != "Omborni tanlang'") {
      mainWerehouse = widget.werehouseName;
    }
    if (widget.posdeskName != "Kassani tanlang") {
      mainposDesktop = widget.posdeskName;
    }
    if (widget.branches.isEmpty) {
      BlocProvider.of<GetBranchBloc>(context).add(GetAllBranchEvent());
    } else {
      branches = widget.branches;
      heightFilialPopUp = branches.isEmpty ? 55.w : branches.length * 55.w;
    }
    werehouses = widget.wereHouse;
    posdesk = widget.posdesk;
    heightWerehousePopUp = werehouses.isEmpty ? 55.w : werehouses.length * 55.w;
    heightPosPopUp = posdesk.isEmpty ? 55.w : posdesk.length * 55.w;
  }

  TextEditingController phoneControlller = TextEditingController();
  TextEditingController passwordControlller = TextEditingController();
  TextEditingController residentalAmountControlller = TextEditingController();
  TextEditingController finishedAmoundControlller = TextEditingController();
  String mainBranch = 'Filialni tanlang';
  String mainWerehouse = 'Omborni tanlang';
  String mainposDesktop = "Kassani tanlang";
  List<PosDeskModel> posdesk = [];
  List<BranchModel> branches = [];
  List<WerehouseModel> werehouses = [];
  bool _isHidden = true;
  bool keyboardVisible = false;
  double heightWerehousePopUp = 55.w;
  double heightFilialPopUp = 55.w;
  double heightPosPopUp = 55.w;
  @override
  Widget build(BuildContext context) {
    keyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocConsumer<CloseSessionBloc, CloseSessionState>(
          listener: (context, state) {
            if (state is CloseSessionSuccess) {
              Fluttertoast.showToast(
                  msg: "Success",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  textColor: Colors.white,
                  fontSize: 16.0);
              AppPrefs.setToken("");
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                builder: (context) {
                  return const AuthentificationScreen();
                },
              ), (Route<dynamic> route) => false);
            }
            if (state is CloseSessionFailure) {
              RegExp regExp = RegExp(r'\[(.*?)\]');
              Match? match = regExp.firstMatch(state.msg);
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
                SizedBox(height: 35.w),
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
                      Padding(
                        padding: EdgeInsets.only(top: 20.w, bottom: 7.w),
                        child: Text(
                          "Telefon raqam",
                          style: AppTextStyle.regular(color: AppColors.greyF6),
                        ),
                      ),
                      SizedBox(
                        height: 51.w,
                        child: AppInputField(
                            controller: phoneControlller,
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
                      Padding(
                        padding: EdgeInsets.only(top: 22.w, bottom: 7.w),
                        child: Text(
                          "Filial",
                          style: AppTextStyle.regular(color: AppColors.greyF6),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15.sp),
                        decoration:
                            AppShape.simpleContainer2(color: AppColors.greyEf),
                        child: BlocConsumer<GetBranchBloc, GetBranchState>(
                          listener: (context, state) {
                            if (state is GetAllBranchSuccess) {
                              branches = state.branchesList;
                              heightFilialPopUp = branches.isEmpty
                                  ? 50.w
                                  : branches.length * 55.w;

                              if (mainBranch != "Filialni tanlang") {
                                mainBranch = widget.branchName;
                                // AppPrefs.setBranch(widget.branchId);
                              }
                            }
                          },
                          builder: (context, state) {
                            return PopupMenuButton(
                                constraints: BoxConstraints.expand(
                                    height: heightFilialPopUp),
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
                                onSelected: (value) {
                                  if (branches.length > 1) {
                                    mainBranch = value.name ?? "";
                                    if (widget.wereHouse.isEmpty) {
                                      BlocProvider.of<GetWerehouseBloc>(context)
                                          .add(GetAllWerehouseEvent(
                                              value.id ?? 0));
                                    } else {
                                      werehouses = widget.wereHouse;
                                    }
                                    setState(() {});
                                  }
                                },
                                enabled: branches.length > 1,
                                itemBuilder: (_) {
                                  return branches.map((e) {
                                    return PopupMenuItem(
                                        value: e,
                                        child: SizedBox(
                                          child: Text(e.name ?? ""),
                                        ));
                                  }).toList();
                                },
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
                                      const Icon(
                                          Icons.keyboard_arrow_down_rounded)
                                    ],
                                  ),
                                ));
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 22.w, bottom: 7.w),
                        child: Text(
                          "Ombor",
                          style: AppTextStyle.regular(color: AppColors.greyF6),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15.sp),
                        decoration:
                            AppShape.simpleContainer2(color: AppColors.greyEf),
                        child:
                            BlocConsumer<GetWerehouseBloc, GetWerehouseState>(
                          listener: (context, state) {
                            if (state is GetAllWerehouseSuccess) {
                              werehouses = state.werehouseesList;
                              heightWerehousePopUp = werehouses.isEmpty
                                  ? 50.w
                                  : werehouses.length * 55.w;
                            }
                          },
                          builder: (context, state) {
                            return PopupMenuButton(
                                constraints: BoxConstraints.expand(
                                    height: heightWerehousePopUp),
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
                                enabled: werehouses.length > 1,
                                onSelected: (value) {
                                  if (werehouses.length > 1) {
                                    mainWerehouse = value.name ?? "";
                                    setState(() {});
                                    BlocProvider.of<PosDeskBloc>(context)
                                        .add(GetPosDesksEvent());
                                  }
                                },
                                itemBuilder: (_) {
                                  return werehouses.map((e) {
                                    return PopupMenuItem(
                                        value: e,
                                        child: SizedBox(
                                          child: Text(e.name ?? ""),
                                        ));
                                  }).toList();
                                },
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
                                      const Icon(
                                          Icons.keyboard_arrow_down_rounded)
                                    ],
                                  ),
                                ));
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 22.w, bottom: 7.w),
                        child: Text(
                          "Kassa",
                          style: AppTextStyle.regular(color: AppColors.greyF6),
                        ),
                      ),
                      SizedBox(
                        height: 51.w,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15.sp),
                          decoration: AppShape.simpleContainer2(
                              color: AppColors.greyEf),
                          child: BlocConsumer<PosDeskBloc, PosDeskState>(
                            listener: (context, state) {
                              if (state is PosDeskSucces) {
                                posdesk = state.posDesks;

                                heightPosPopUp = posdesk.isEmpty
                                    ? 55.w
                                    : posdesk.length * 55.w;
                              }
                            },
                            builder: (context, state) {
                              return PopupMenuButton(
                                  offset: keyboardVisible
                                      ? const Offset(90, 250)
                                      : const Offset(90, 50),
                                  onOpened: () {
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());
                                    setState(() {});
                                  },
                                  padding: EdgeInsets.all(5.sp),
                                  constraints: BoxConstraints.expand(
                                      height: heightPosPopUp),
                                  color: AppColors.white,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Theme.of(context).primaryColor,
                                        width: 1),
                                    borderRadius: BorderRadius.circular(15.r),
                                  ),
                                  enabled: posdesk.length > 1,
                                  onSelected: (value) {
                                    if (posdesk.length > 1) {
                                      mainposDesktop = value.name ?? "";
                                      setState(() {});
                                      AppPrefs.setPosDesk(value.id??0);
                                    }
                                  },
                                  itemBuilder: (_) {
                                    return posdesk.map((e) {
                                      return PopupMenuItem(
                                          value: e,
                                          child: SizedBox(
                                            child: Text(e.name.toString()),
                                          ));
                                    }).toList();
                                  },
                                  child: Container(
                                    height: 50.w,
                                    color: AppColors.white,
                                    width: double.infinity,
                                    child: Row(
                                      children: [
                                        state is PosDeskProcces?
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
                                  ));
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 22.w, bottom: 7.w),
                        child: Text(
                          "Qolgan summa",
                          style: AppTextStyle.regular(color: AppColors.greyF6),
                        ),
                      ),
                      SizedBox(
                        height: 51.w,
                        child: AppInputField(
                            controller: residentalAmountControlller,
                            hint: "Summani kiriting",
                            enableBorderColor: AppColors.greyEf,
                            hintStyle: AppTextStyle.regular(
                                size: 16, color: AppColors.greyF6),
                            keyboardType: TextInputType.number,
                            style: AppTextStyle.regular(),
                            fillColor: AppColors.white,
                            suffixIcon: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("So`m   "),
                              ],
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 22.w, bottom: 7.w),
                        child: Text(
                          "Umumiy summa",
                          style: AppTextStyle.regular(color: AppColors.greyF6),
                        ),
                      ),
                      SizedBox(
                        height: 51.w,
                        child: AppInputField(
                            controller: finishedAmoundControlller,
                            hint: "Summani kiriting",
                            enableBorderColor: AppColors.greyEf,
                            hintStyle: AppTextStyle.regular(
                                size: 16, color: AppColors.greyF6),
                            keyboardType: TextInputType.number,
                            style: AppTextStyle.regular(),
                            fillColor: AppColors.white,
                            suffixIcon: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("So`m   "),
                              ],
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 22.w, bottom: 7.w),
                        child: Text(
                          "Parol",
                          style: AppTextStyle.regular(color: AppColors.greyF6),
                        ),
                      ),
                      SizedBox(
                        height: 51.w,
                        child: AppInputField(
                          isHidden: _isHidden,
                          enableBorderColor: AppColors.greyEf,
                          keyboardType: TextInputType.number,
                          formatters: [AppValidator.codeFormatter],
                          controller: passwordControlller,
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
                      SizedBox(height: 22.w),
                      Row(
                        children: [
                          Expanded(
                              child: PrimaryButton(
                            enableColor: false,
                            label: "Bekor qilish",
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )),
                          SizedBox(
                            width: 20.h,
                          ),
                          Expanded(
                            child: PrimaryButton(
                              label: "Yakunlash",
                              loading: state is CloseSessionProccess,
                              onPressed: () {
                                if (mainposDesktop != "Kassani tanlang") {
                                  BlocProvider.of<CloseSessionBloc>(context)
                                      .add(StartCloseSessionEvent(
                                    phone: phoneControlller.text,
                                    pass: passwordControlller.text,
                                    residentalAmount:
                                        residentalAmountControlller.text,
                                    finishedAmound:
                                        finishedAmoundControlller.text,
                                    posdesk: AppPrefs.getPosDesk
                                  ));
                                }
                              },
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
