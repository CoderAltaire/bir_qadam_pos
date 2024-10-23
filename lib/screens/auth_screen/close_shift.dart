import 'package:bir_qadam_pos/core/core.dart';
import 'package:flutter/material.dart';
import '../../bloc/bloc.dart';
import '../../models/branch/branch_model.dart';
import '../../models/models.dart';
import '../widgets/widgets.dart';

class ColseShiftScreen extends StatefulWidget {
  final String phone;
  final String password;
  final List<BranchModel> branches;
  final List<WerehouseModel> wereHouse;

  final String posdesk;
  final String branchName;
  final String werehouseName;

  const ColseShiftScreen(
      {super.key,
      required this.phone,
      required this.password,
      // required this.werehouseId,
      // required this.branchId,
      required this.branchName,
      required this.branches,
      required this.werehouseName,
      required this.wereHouse,
      required this.posdesk});

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
      // AppPrefs.setBranch(widget.branchId);
    }

    if (widget.werehouseName != "Omborni tanlang'") {
      mainWerehouse = widget.werehouseName;
    }

    if (widget.branches.isEmpty) {
      BlocProvider.of<GetBranchBloc>(context).add(GetAllBranchEvent());
    } else {
      branches = widget.branches;
    }
    werehouses = widget.wereHouse;
    if (widget.posdesk != "Kassani tanlang") {
      mainposDesktop = widget.posdesk;
    }
  }

  TextEditingController phoneControlller = TextEditingController();
  TextEditingController passwordControlller = TextEditingController();
  TextEditingController residentalAmountControlller = TextEditingController();
  TextEditingController finishedAmoundControlller = TextEditingController();
  String mainBranch = 'Filialni tanlang';
  String mainWerehouse = 'Omborni tanlang';
  String mainposDesktop = "Kassani tanlang";
  List<int> posdesk = [1, 2];
  List<BranchModel> branches = [];
  List<WerehouseModel> werehouses = [];
  bool _isHidden = true;

  bool keyboardVisible = false;

  @override
  Widget build(BuildContext context) {
    keyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          // physics: const NeverScrollableScrollPhysics(),
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
                Navigator.pop(context);
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
                        SizedBox(height: 22.w),
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
                            "Kassa",
                            style:
                                AppTextStyle.regular(color: AppColors.greyF6),
                          ),
                        ),
                        SizedBox(
                          height: 51.w,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 15.sp),
                            decoration: AppShape.simpleContainer2(
                                color: AppColors.greyEf),
                            child: PopupMenuButton(
                                offset: keyboardVisible
                                    ? const Offset(90, 250)
                                    : const Offset(90, 50),
                                onOpened: () {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                  setState(() {});
                                },
                                padding: EdgeInsets.all(5.sp),
                                constraints:
                                    BoxConstraints.expand(height: 110.w),
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
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 22.w, bottom: 7.w),
                          child: Text(
                            "Filial",
                            style:
                                AppTextStyle.regular(color: AppColors.greyF6),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15.sp),
                          decoration: AppShape.simpleContainer2(
                              color: AppColors.greyEf),
                          child: BlocConsumer<GetBranchBloc, GetBranchState>(
                            listener: (context, state) {
                              if (state is GetAllBranchSuccess) {
                                branches = state.branchesList;
                                if (mainBranch != "Filialni tanlang") {
                                  mainBranch = widget.branchName;
                                  // AppPrefs.setBranch(widget.branchId);
                                }
                              }
                            },
                            builder: (context, state) {
                              double heightPopUp = branches.isEmpty
                                  ? 50.w
                                  : branches.length * 55.w;
                              return PopupMenuButton(
                                  constraints: BoxConstraints.expand(
                                      height: heightPopUp),
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
                                  ),
                                  onSelected: (value) {
                                    mainBranch = value.name ?? "";

                                    if (widget.wereHouse.isEmpty) {
                                      BlocProvider.of<GetWerehouseBloc>(context)
                                          .add(GetAllWerehouseEvent(
                                              value.id ?? 0));
                                    } else {
                                      werehouses = widget.wereHouse;
                                    }

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
                            style:
                                AppTextStyle.regular(color: AppColors.greyF6),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15.sp),
                          decoration: AppShape.simpleContainer2(
                              color: AppColors.greyEf),
                          child:
                              BlocConsumer<GetWerehouseBloc, GetWerehouseState>(
                            listener: (context, state) {
                              if (state is GetAllWerehouseSuccess) {
                                werehouses = state.werehouseesList;
                              }
                            },
                            builder: (context, state) {
                              double heightPopUp = werehouses.isEmpty
                                  ? 50.w
                                  : werehouses.length * 55.w;
                              return PopupMenuButton(
                                  constraints: BoxConstraints.expand(
                                      height: heightPopUp),
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
                                  ),
                                  onSelected: (value) {
                                    mainWerehouse = value.name ?? "";
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
                            "Qolgan summa",
                            style:
                                AppTextStyle.regular(color: AppColors.greyF6),
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
                            style:
                                AppTextStyle.regular(color: AppColors.greyF6),
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
                                      posdesk: int.parse(mainposDesktop),
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
      ),
    );
  }
}
