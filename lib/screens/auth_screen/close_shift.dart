import 'package:bir_qadam_pos/core/core.dart';
import 'package:flutter/material.dart';
import '../../bloc/bloc.dart';
import '../../models/branch/branch_model.dart';
import '../../models/models.dart';
import '../widgets/widgets.dart';

class ColseShiftScreen extends StatefulWidget {
  const ColseShiftScreen({super.key});

  @override
  State<ColseShiftScreen> createState() => _ColseShiftScreenState();
}

class _ColseShiftScreenState extends State<ColseShiftScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetBranchBloc>(context).add(GetAllBranchEvent());
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: SingleChildScrollView(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 22.w),
                  Center(
                      child: Text(
                    "Tizimga kirish",
                    style: AppTextStyle.semiBold(size: 18),
                  )),
                  Container(color: AppColors.dark, height: 1),
                  SizedBox(height: 22.w),
                  Padding(
                    padding: EdgeInsets.only(top: 22.w, bottom: 7.w),
                    child: const Text("Telefon raqam"),
                  ),
                  SizedBox(
                    height: 51.w,
                    child: AppInputField(
                        controller: phoneControlller,
                        formatters: [AppValidator.phoneFormatter],
                        keyboardType: TextInputType.number,
                        prefixIcon: Container(
                          width: 70.w,
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.h),
                            child: Text(
                              ' +998',
                              style: AppTextStyle.medium(),
                            ),
                          ),
                        ),
                        hint: "",
                        fillColor: AppColors.white),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 22.w, bottom: 7.w),
                    child: const Text("Kassa"),
                  ),
                  SizedBox(
                    height: 51.w,
                    child: Container(
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
                    child: const Text("Filial"),
                  ),
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
                                  const Icon(Icons.keyboard_arrow_down_rounded)
                                ],
                              ),
                            ),
                            onSelected: (value) {
                              mainBranch = value.name ?? "";
                              BlocProvider.of<GetWerehouseBloc>(context)
                                  .add(GetAllWerehouseEvent(value.id ?? 0));

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
                                  const Icon(Icons.keyboard_arrow_down_rounded)
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
                    child: const Text("Qolgan summa"),
                  ),
                  SizedBox(
                    height: 51.w,
                    child: AppInputField(
                        controller: residentalAmountControlller,
                        hint: "Summani kiriting",
                        keyboardType: TextInputType.number,
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
                    child: const Text("Umumiy summa"),
                  ),
                  SizedBox(
                    height: 51.w,
                    child: AppInputField(
                        controller: finishedAmoundControlller,
                        hint: "Summani kiriting",
                        keyboardType: TextInputType.number,
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
                    child: const Text("Parol"),
                  ),
                  SizedBox(
                    height: 51.w,
                    child: AppInputField(
                      isHidden: _isHidden,
                      keyboardType: TextInputType.number,
                      formatters: [AppValidator.codeFormatter],
                      controller: passwordControlller,
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
                          onPressed: () {
                            if (mainposDesktop != "Kassani tanlang") {
                              BlocProvider.of<CloseSessionBloc>(context)
                                  .add(StartCloseSessionEvent(
                                phone: phoneControlller.text,
                                pass: passwordControlller.text,
                                residentalAmount:
                                    residentalAmountControlller.text,
                                finishedAmound: finishedAmoundControlller.text,
                                posdesk: int.parse(mainposDesktop),
                              ));
                            }
                          },
                        ),
                      ),
                    ],
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
