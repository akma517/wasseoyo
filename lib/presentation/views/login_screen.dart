import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasseoyo/presentation/viewmodels/user_view_model.dart';
import 'package:wasseoyo/presentation/widgets/agree_check.dart';
import 'package:wasseoyo/utils/constants/assets.dart';
import 'package:wasseoyo/utils/constants/colors.dart';
import 'package:wasseoyo/utils/constants/fonts.dart';
import 'package:wasseoyo/utils/constants/route_constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  final GlobalKey idKey = GlobalKey();
  final GlobalKey passwordKey = GlobalKey();
  final GlobalKey logo = GlobalKey();

  late final ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<UserViewModel>(context);

    String userId = "";
    String password = "";

    tabToInputScroll() {
      Timer(const Duration(milliseconds: 300), () {
        scrollController.animateTo(780.h,
            curve: Curves.ease, duration: const Duration(milliseconds: 600));
      });
    }

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        scrollController.animateTo(scrollController.position.minScrollExtent,
            curve: Curves.ease, duration: const Duration(milliseconds: 600));
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Form(
            key: formKey,
            child: Container(
              width: 360.w,
              height: 780.h,
              color: Colors.white,
              padding: EdgeInsets.only(
                  top: 102.h, bottom: viewModel.loginFailed ? 27.h : 47.h),
              child: ScrollConfiguration(
                behavior: const ScrollBehavior().copyWith(overscroll: false),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        key: logo,
                        width: 142.w,
                        height: 41.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.w),
                        ),
                        child: Image.asset(
                          MyAssets.logo,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      SizedBox(
                        width: 140.w,
                        child: const Text(
                          '비콘 기반 근태 출근 관리 앱',
                          style: MyFonts.e13,
                        ),
                      ),
                      SizedBox(height: 64.h),
                      Container(
                        key: idKey,
                        width: 320.w,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 57.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.w),
                                color: viewModel.loginFailed
                                    ? const Color(0xffff3458)
                                    : const Color(0xfff1f2f6),
                              ),
                              child: TextFormField(
                                onTap: () => tabToInputScroll(),

                                // focusNode: _focusNodeId,
                                validator: (value) {
                                  if (value!.isEmpty) return;
                                },
                                onSaved: (newValue) => userId = newValue!,
                                // focusNode: _focusNode,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: const Color(0xfff1f1f1),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(8.w),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: viewModel.loginFailed
                                          ? const Color(0xffff3458)
                                          : const Color(0xfff1f2f6),
                                    ),
                                    borderRadius: BorderRadius.circular(8.w),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xffff3458),
                                    ),
                                    borderRadius: BorderRadius.circular(8.w),
                                  ),
                                  hintStyle: MyFonts.m18g,
                                  hintText: "사번 입력",
                                ),
                                style: MyFonts.m18,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Container(
                              key: passwordKey,
                              width: double.infinity,
                              height: 57.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.w),
                                color: viewModel.loginFailed == false
                                    ? const Color(0xfff1f2f6)
                                    : const Color(0xffff3458),
                              ),
                              child: TextFormField(
                                onTap: () => tabToInputScroll(),
                                // focusNode: _focusNodePassword,
                                validator: (value) {
                                  if (value!.isEmpty) return;
                                },
                                onSaved: (newValue) => password = newValue!,
                                // onTap: () => focus.highlightMode,
                                // focusNode: focus,
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: const Color(0xfff1f1f1),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(8.w),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: viewModel.loginFailed
                                          ? const Color(0xffff3458)
                                          : const Color(0xfff1f2f6),
                                    ),
                                    borderRadius: BorderRadius.circular(8.w),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xffff3458),
                                    ),
                                    borderRadius: BorderRadius.circular(8.w),
                                  ),
                                  hintStyle: MyFonts.m18g,
                                  hintText: "비밀번호 입력",
                                ),
                                style: MyFonts.m18,
                              ),
                            ),
                          ],
                        ),
                      ),
                      viewModel.loginFailed
                          ? Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 8.h,
                              ),
                              width: 320.w,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 2,
                                      vertical: 3,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 3.w,
                                          height: 3.h,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xffff3458),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 2.w),
                                  const Expanded(
                                    child: SizedBox(
                                      child: Text(
                                        "사번이 존재하지 않거나 비밀번호가 일치하지 않습니다.",
                                        style: MyFonts.e13r,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : const SizedBox(),
                      SizedBox(height: 16.h),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 20.w,
                          right: 235.w,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 27.h,
                              child: AgreeCheck(
                                execFunc: viewModel.autoLoginCheck,
                                text: '자동로그인',
                                checked: viewModel.autoLoginChecked,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 32.h),
                      Container(
                        width: 320.w,
                        height: 59.h,
                        decoration: BoxDecoration(
                          color: MyColors.ableColor,
                          borderRadius: BorderRadius.circular(8.w),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: SizedBox(
                                child: TextButton(
                                  onPressed: () {
                                    final formKeyState = formKey.currentState!;
                                    formKeyState.save();
                                    if (userId.isNotEmpty &&
                                        password.isNotEmpty) {
                                      viewModel
                                          .login(userId, password)
                                          .then((login) {
                                        if (login) {
                                          Navigator.popUntil(
                                              context, (route) => false);
                                          Navigator.pushNamed(
                                              context, Routes.index);
                                        } else {
                                          viewModel.loginFail();
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                        }
                                      });
                                    } else {
                                      viewModel.loginFail();
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    }
                                  },
                                  child: const Text('로그인',
                                      textAlign: TextAlign.center,
                                      style: MyFonts.m18w),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 32.h),
                      Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pushNamed(context, Routes.password),
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                              child: const Text('비밀번호재설정',
                                  textAlign: TextAlign.center,
                                  style: MyFonts.m16gu),
                            ),
                          ]),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
