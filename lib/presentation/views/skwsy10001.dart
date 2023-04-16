import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasseoyo/presentation/viewmodels/skwsy10001_view_model.dart';
import 'package:wasseoyo/utils/constants/assets.dart';
import 'package:wasseoyo/utils/constants/fonts.dart';
import 'package:wasseoyo/utils/constants/route_constant.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  final ScrollController _controller = ScrollController();

  scrollToInput() {
    setState(() {
      _controller.animateTo(_controller.position.maxScrollExtent,
          duration: const Duration(milliseconds: 600), curve: Curves.ease);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    FocusNode _focusNodeId = FocusNode();
    FocusNode _focusNodePassword = FocusNode();

    _focusNodeId.addListener(() {
      scrollToInput();
    });

    _focusNodePassword.addListener(() {
      scrollToInput();
    });

    var viewModel = Provider.of<Skwsy10001ViewModel>(context);

    String userId = "";
    String password = "";

    // _foucsListen();
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: Form(
            key: formKey,
            child: Container(
              padding:
                  EdgeInsets.fromLTRB(20 * fem, 0 * fem, 11 * fem, 0 * fem),
              width: double.infinity,
              child: SingleChildScrollView(
                controller: _controller,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 102 * fem,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 10.87 * fem, 16 * fem),
                      width: 142.35 * fem,
                      height: 41 * fem,
                      child: Image.asset(
                        Assets.logo,
                        width: 142.35 * fem,
                        height: 41 * fem,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 10.87 * fem, 56 * fem),
                      child: Text(
                        '비콘 기반 근태 출근 관리 앱',
                        style: SafeGoogleFont(
                          'Pretendard',
                          fontSize: 13 * ffem,
                          fontWeight: FontWeight.w600,
                          height: 1.2999999707 * ffem / fem,
                          color: const Color(0xff666666),
                        ),
                      ),
                    ),
                    Container(
                      // inputtxtWd6 (395:87)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 9 * fem, 8 * fem),
                      width: 320 * fem,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // 2bS (395:88)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 0 * fem, 10 * fem),

                            width: double.infinity,
                            child: TextFormField(
                              focusNode: _focusNodeId,
                              validator: (value) {
                                if (value!.isEmpty) return "사번을 입력해 주세요";
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
                                  borderRadius: BorderRadius.circular(8 * fem),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(8 * fem),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0xffff3458),
                                  ),
                                  borderRadius: BorderRadius.circular(8 * fem),
                                ),
                                hintStyle: SafeGoogleFont(
                                  'Pretendard',
                                  fontSize: 18 * ffem,
                                  fontWeight: FontWeight.w500,
                                  height: 1.3999999364 * ffem / fem,
                                  color: const Color(0xffbbbbbb),
                                ),
                                hintText: "사번 입력",
                              ),
                              style: SafeGoogleFont(
                                'Pretendard',
                                fontSize: 18 * ffem,
                                fontWeight: FontWeight.w500,
                                height: 1.3999999364 * ffem / fem,
                                color: const Color(0xff222222),
                              ),
                            ),
                          ),
                          Container(
                            // 2bS (395:88)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 0 * fem, 10 * fem),
                            width: double.infinity,

                            child: TextFormField(
                              focusNode: _focusNodePassword,
                              validator: (value) {
                                if (value!.isEmpty) return "비밀번호를 입력해 주세요";
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
                                  borderRadius: BorderRadius.circular(8 * fem),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(8 * fem),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0xffff3458),
                                  ),
                                  borderRadius: BorderRadius.circular(8 * fem),
                                ),
                                hintStyle: SafeGoogleFont(
                                  'Pretendard',
                                  fontSize: 18 * ffem,
                                  fontWeight: FontWeight.w500,
                                  height: 1.3999999364 * ffem / fem,
                                  color: const Color(0xffbbbbbb),
                                ),
                                hintText: "비밀번호 입력",
                              ),
                              style: SafeGoogleFont(
                                'Pretendard',
                                fontSize: 18 * ffem,
                                fontWeight: FontWeight.w500,
                                height: 1.3999999364 * ffem / fem,
                                color: const Color(0xff222222),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    viewModel.loginFailed
                        ? Container(
                            // CuE (396:307)
                            margin: EdgeInsets.fromLTRB(
                                2 * fem, 0 * fem, 0 * fem, 8 * fem),
                            width: double.infinity,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  // 4Ak (396:310)
                                  '	· 사번이 존재하지 않거나 비밀번호가 일치하지 않습니다.',
                                  style: SafeGoogleFont(
                                    'Pretendard',
                                    fontSize: 13 * ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.2999999707 * ffem / fem,
                                    color: const Color(0xffff3458),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : const SizedBox(),
                    Container(
                      // a96 (395:84)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 32 * fem),
                      width: double.infinity,
                      child: GestureDetector(
                        onTap: () => viewModel.autoLoginCheck(),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // stradioW2k (395:85)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 8 * fem, 0 * fem),
                              width: 27 * fem,
                              height: 27 * fem,
                              child: Image.asset(
                                viewModel.autoLoginChecked
                                    ? Assets.autoLoginChecked
                                    : Assets.autoLoginUnChecked,
                                width: 27 * fem,
                                height: 27 * fem,
                              ),
                            ),
                            Container(
                              // Qdv (395:86)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 5 * fem, 0 * fem, 0 * fem),
                              child: GestureDetector(
                                child: Text(
                                  '자동로그인',
                                  style: SafeGoogleFont(
                                    'Pretendard',
                                    fontSize: 16 * ffem,
                                    fontWeight: FontWeight.w500,
                                    height: 1 * ffem / fem,
                                    color: const Color(0xff222222),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      // btnprimaryXCk (396:248)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 9 * fem, 32 * fem),
                      width: 320 * fem,
                      height: 59 * fem,
                      decoration: BoxDecoration(
                        color: const Color(0xff7652dd),
                        borderRadius: BorderRadius.circular(8 * fem),
                      ),
                      child: TextButton(
                        onPressed: () {
                          final formKeyState = formKey.currentState!;
                          if (formKeyState.validate()) {
                            formKeyState.save();
                            viewModel.login(userId, password).then((login) {
                              if (login) {
                                Navigator.popUntil(context, (route) => false);
                                Navigator.pushNamed(context, Routes.index);
                              }
                            });
                          }
                        },
                        child: Center(
                          child: Text(
                            '로그인',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont(
                              'Pretendard',
                              fontSize: 18 * ffem,
                              fontWeight: FontWeight.w500,
                              height: 1.3999999364 * ffem / fem,
                              color: const Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      // sttextlinkzc8 (396:302)
                      // margin:
                      //     EdgeInsets.fromLTRB(110 * fem, 0 * fem, 118 * fem, 0 * fem),
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 24 * fem,
                          child: Center(
                            child: Text(
                              '비밀번호재설정',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont(
                                'Pretendard',
                                fontSize: 16 * ffem,
                                fontWeight: FontWeight.w500,
                                height: 1.5 * ffem / fem,
                                decoration: TextDecoration.underline,
                                color: const Color(0xff999999),
                                decorationColor: const Color(0xff999999),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
