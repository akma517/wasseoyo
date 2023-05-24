// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:wasseoyo/presentation/viewmodels/user_view_model.dart';
// import 'package:wasseoyo/presentation/widgets/agree_check.dart';
// import 'package:wasseoyo/utils/constants/assets.dart';
// import 'package:wasseoyo/utils/constants/colors.dart';
// import 'package:wasseoyo/utils/constants/fonts.dart';

// class Password extends StatefulWidget {
//   const Password({super.key});

//   @override
//   State<Password> createState() => _PasswordState();
// }

// class _PasswordState extends State<Password> {
//   final formKey = GlobalKey<FormState>();
//   final GlobalKey newPasswordKey = GlobalKey();
//   final GlobalKey confirmPasswordKey = GlobalKey();
//   final GlobalKey agreeKey = GlobalKey();

//   @override
//   Widget build(BuildContext context) {
//     var viewModel = Provider.of<UserViewModel>(context);
//     double baseWidth = 360;
//     double fem = MediaQuery.of(context).size.width / baseWidth;
//     double ffem = fem * 0.97;

//     String newPassword = "";
//     String confirmPassword = "";

//     return GestureDetector(
//       onTap: () {
//         FocusManager.instance.primaryFocus?.unfocus();
//       },
//       child: Scaffold(
//         body: SafeArea(
//           child: Form(
//             key: formKey,
//             child: Container(
//               // pkwsy20002x6L (423:155)
//               padding:
//                   EdgeInsets.fromLTRB(20 * fem, 67 * fem, 20 * fem, 32 * fem),
//               width: double.infinity,
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Container(
//                       margin: EdgeInsets.fromLTRB(
//                           2 * fem, 0 * fem, 0 * fem, 23 * fem),
//                       width: double.infinity,
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Container(
//                             // icoarrowleftxGg (423:218)
//                             margin: EdgeInsets.fromLTRB(
//                                 0 * fem, 0 * fem, 0 * fem, 0 * fem),
//                             width: 20 * fem,
//                             height: 18 * fem,
//                             child: GestureDetector(
//                               onTap: () => Navigator.pop(context),
//                               child: Image.asset(
//                                 MyAssets.leftArrow,
//                                 width: 20 * fem,
//                                 height: 18 * fem,
//                               ),
//                             ),
//                           ),
//                           Container(
//                             key: newPasswordKey,
//                             // GYG (423:221)
//                             margin: EdgeInsets.fromLTRB(
//                                 0 * fem, 0 * fem, 0 * fem, 0 * fem),
//                             child: Text(
//                               '비밀번호 재설정',
//                               style: SafeGoogleFont(
//                                 'Pretendard',
//                                 fontSize: 20 * ffem,
//                                 fontWeight: FontWeight.w700,
//                                 height: 1.4 * ffem / fem,
//                                 color: const Color(0xff222222),
//                               ),
//                             ),
//                           ),
//                           SizedBox(),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       // inputtxtMpc (423:213)
//                       margin: EdgeInsets.fromLTRB(
//                           0 * fem, 0 * fem, 0 * fem, 32 * fem),
//                       width: 320 * fem,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Container(
//                             // inputtxtWd6 (395:87)
//                             margin: EdgeInsets.fromLTRB(
//                                 0 * fem, 0 * fem, 9 * fem, 8 * fem),
//                             width: 320 * fem,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Container(
//                                   // 2bS (395:88)
//                                   margin: EdgeInsets.fromLTRB(
//                                       0 * fem, 0 * fem, 0 * fem, 10 * fem),

//                                   width: double.infinity,
//                                   child: TextFormField(
//                                     onTap: () {
//                                       Timer(const Duration(milliseconds: 100),
//                                           () {
//                                         Scrollable.ensureVisible(
//                                             newPasswordKey.currentContext!,
//                                             duration: const Duration(
//                                                 milliseconds: 600),
//                                             curve: Curves.ease);
//                                       });
//                                     },
//                                     // focusNode: focusNodeNewPassword,
//                                     obscureText: true,
//                                     onSaved: (newValue) =>
//                                         newPassword = newValue!,
//                                     textInputAction: TextInputAction.next,
//                                     keyboardType: TextInputType.text,
//                                     decoration: InputDecoration(
//                                       filled: true,
//                                       fillColor: const Color(0xfff1f1f1),
//                                       border: OutlineInputBorder(
//                                         borderSide: BorderSide.none,
//                                         borderRadius:
//                                             BorderRadius.circular(8 * fem),
//                                       ),
//                                       enabledBorder: OutlineInputBorder(
//                                         borderSide: viewModel.changeFailed
//                                             ? const BorderSide(
//                                                 color: MyColors.wrongColor,
//                                               )
//                                             : BorderSide.none,
//                                         borderRadius:
//                                             BorderRadius.circular(8 * fem),
//                                       ),
//                                       errorBorder: OutlineInputBorder(
//                                         borderSide: const BorderSide(
//                                           color: MyColors.wrongColor,
//                                         ),
//                                         borderRadius:
//                                             BorderRadius.circular(8 * fem),
//                                       ),
//                                       hintStyle: SafeGoogleFont(
//                                         'Pretendard',
//                                         fontSize: 18 * ffem,
//                                         fontWeight: FontWeight.w500,
//                                         height: 1.3999999364 * ffem / fem,
//                                         color: const Color(0xffbbbbbb),
//                                       ),
//                                       hintText: "새 비밀번호 입력",
//                                     ),
//                                     style: SafeGoogleFont(
//                                       'Pretendard',
//                                       fontSize: 18 * ffem,
//                                       fontWeight: FontWeight.w500,
//                                       height: 1.3999999364 * ffem / fem,
//                                       color: const Color(0xff222222),
//                                     ),
//                                   ),
//                                 ),
//                                 Container(
//                                   // CuE (396:307)
//                                   margin: EdgeInsets.fromLTRB(
//                                       2 * fem, 0 * fem, 0 * fem, 8 * fem),
//                                   width: double.infinity,
//                                   child: Row(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         // 4Ak (396:310)
//                                         ' · 8자 이상의 문자와 숫자를 조합해 설정해 주세요.',
//                                         style: SafeGoogleFont(
//                                           'Pretendard',
//                                           fontSize: 13 * ffem,
//                                           fontWeight: FontWeight.w600,
//                                           height: 1.2999999707 * ffem / fem,
//                                           color: viewModel.changeFailed
//                                               ? MyColors.wrongColor
//                                               : MyColors.hintTextColor,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Container(
//                                   key: confirmPasswordKey,
//                                   // 2bS (395:88)
//                                   margin: EdgeInsets.fromLTRB(
//                                       0 * fem, 0 * fem, 0 * fem, 10 * fem),
//                                   width: double.infinity,

//                                   child: TextFormField(
//                                     // focusNode: focusNodeConfirmPassword,
//                                     onTap: () {
//                                       Timer(const Duration(milliseconds: 100),
//                                           () {
//                                         Scrollable.ensureVisible(
//                                             newPasswordKey.currentContext!,
//                                             duration: const Duration(
//                                                 milliseconds: 600),
//                                             curve: Curves.ease);
//                                       });
//                                     },
//                                     onEditingComplete: () {
//                                       Timer(const Duration(milliseconds: 100),
//                                           () {
//                                         Scrollable.ensureVisible(
//                                             agreeKey.currentContext!,
//                                             duration: const Duration(
//                                                 milliseconds: 600),
//                                             curve: Curves.ease);
//                                       });
//                                     },
//                                     // validator: (value) {
//                                     //   if (value!.isEmpty)
//                                     //     return "비밀번호를 입력해 주세요.";
//                                     // },
//                                     onSaved: (newValue) =>
//                                         confirmPassword = newValue!,
//                                     // onTap: () => focus.highlightMode,
//                                     // focusNode: focus,
//                                     keyboardType: TextInputType.text,
//                                     obscureText: true,
//                                     decoration: InputDecoration(
//                                       filled: true,
//                                       fillColor: const Color(0xfff1f1f1),
//                                       border: OutlineInputBorder(
//                                         borderSide: BorderSide.none,
//                                         borderRadius:
//                                             BorderRadius.circular(8 * fem),
//                                       ),
//                                       enabledBorder: OutlineInputBorder(
//                                         borderSide: viewModel.changeFailed
//                                             ? const BorderSide(
//                                                 color: MyColors.wrongColor,
//                                               )
//                                             : BorderSide.none,
//                                         borderRadius:
//                                             BorderRadius.circular(8 * fem),
//                                       ),
//                                       errorBorder: OutlineInputBorder(
//                                         borderSide: const BorderSide(
//                                           color: Color(0xffff3458),
//                                         ),
//                                         borderRadius:
//                                             BorderRadius.circular(8 * fem),
//                                       ),
//                                       hintStyle: SafeGoogleFont(
//                                         'Pretendard',
//                                         fontSize: 18 * ffem,
//                                         fontWeight: FontWeight.w500,
//                                         height: 1.3999999364 * ffem / fem,
//                                         color: const Color(0xffbbbbbb),
//                                       ),
//                                       hintText: "비밀번호 입력",
//                                     ),
//                                     style: SafeGoogleFont(
//                                       'Pretendard',
//                                       fontSize: 18 * ffem,
//                                       fontWeight: FontWeight.w500,
//                                       height: 1.3999999364 * ffem / fem,
//                                       color: const Color(0xff222222),
//                                     ),
//                                   ),
//                                 ),
//                                 viewModel.changeFailed
//                                     ? Container(
//                                         // CuE (396:307)
//                                         margin: EdgeInsets.fromLTRB(
//                                             2 * fem, 0 * fem, 0 * fem, 0 * fem),
//                                         width: double.infinity,
//                                         child: Row(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               // 4Ak (396:310)
//                                               viewModel.errorMessage,
//                                               style: SafeGoogleFont(
//                                                 'Pretendard',
//                                                 fontSize: 13 * ffem,
//                                                 fontWeight: FontWeight.w600,
//                                                 height:
//                                                     1.2999999707 * ffem / fem,
//                                                 color: MyColors.wrongColor,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       )
//                                     : const SizedBox(),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       key: agreeKey,
//                       // VrG (423:105)
//                       margin: EdgeInsets.fromLTRB(
//                           0 * fem, 0 * fem, 9 * fem, 50 * fem),
//                       padding: EdgeInsets.fromLTRB(
//                           20 * fem, 20 * fem, 4 * fem, 10 * fem),
//                       width: double.infinity,
//                       height: 230 * fem,
//                       decoration: BoxDecoration(
//                         border: Border.all(color: const Color(0xffdddddd)),
//                         borderRadius: BorderRadius.circular(16 * fem),
//                       ),

//                       child: Container(
//                         // frameCEt (423:106)
//                         margin: EdgeInsets.fromLTRB(
//                             0 * fem, 0 * fem, 12 * fem, 0 * fem),
//                         width: 280 * fem,
//                         height: double.infinity,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             AgreeCheck(
//                               fem: fem,
//                               ffem: ffem,
//                               text: '[필수] 정보 수집 동의',
//                               execFunc: viewModel.agreeCheck,
//                               checked: viewModel.agree,
//                             ),
//                             Container(
//                               // lineh5A (423:112)
//                               margin: EdgeInsets.fromLTRB(
//                                   0 * fem, 19 * fem, 0 * fem, 19 * fem),
//                               width: double.infinity,
//                               height: 1 * fem,
//                               decoration: const BoxDecoration(
//                                 color: Color(0xffdddddd),
//                               ),
//                             ),
//                             Expanded(
//                               child: Container(
//                                 width: 280 * fem,
//                                 height: 173 * fem,
//                                 child: Scrollbar(
//                                   thickness: 5,
//                                   child: Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 8.0),
//                                     child: SingleChildScrollView(
//                                       child: Text(
//                                         overflow: TextOverflow.clip,
//                                         '''해당 App은 비콘 기반 근태 출근 관리 앱으로서 어쩌구 저쩌구 아래와 같은 정보를 수집합니다. 해당 App은 비콘 기반 근태 출근 관리 앱으로서 어쩌구 저쩌구 아래와 같은 정보를 수집합니다. 어쩌구 저쩌구 아래와 같은 정보를 수집합니다.\n · 기기의 고유 mac address\n · 핸드폰 번호\n · 핸드폰 번호\n · 핸드폰 번호
//                                         ''',
//                                         style: SafeGoogleFont(
//                                           'Pretendard',
//                                           fontSize: 13 * ffem,
//                                           fontWeight: FontWeight.w500,
//                                           height: 1.2999999707 * ffem / fem,
//                                           color: MyColors.hintTextColor,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Container(
//                       margin: EdgeInsets.only(
//                           bottom: MediaQuery.of(context).viewInsets.bottom),
//                       child: TextButton(
//                         // btnprimarygBz (I423:209;396:255)
//                         onPressed: viewModel.agree
//                             ? () {
//                                 final formKeyState = formKey.currentState!;
//                                 if (formKeyState.validate()) {
//                                   formKeyState.save();

//                                   if (newPassword.isEmpty ||
//                                       confirmPassword.isEmpty) {
//                                     viewModel.errorMessage =
//                                         ' · 비밀번호를 입력해 주세요.';
//                                   } else {
//                                     viewModel.errorMessage =
//                                         '· 비밀번호가 일치하지 않습니다.';
//                                   }

//                                   viewModel.changePw();

//                                   // viewModel
//                                   //     .changePassword(newPassword)
//                                   //     .then((change) {
//                                   //   if (change) {
//                                   //     Navigator.popUntil(context, (route) => false);
//                                   //     Navigator.pushNamed(context, Routes.index);
//                                   //   } else {
//                                   //     AlertDialog(
//                                   //       content: Text('비밀번호 변경에 실패하였습니다.'),
//                                   //     );
//                                   //   }
//                                   // });
//                                 }
//                               }
//                             : null,
//                         style: TextButton.styleFrom(
//                           padding: EdgeInsets.zero,
//                         ),
//                         child: Container(
//                           width: 320 * fem,
//                           height: 59 * fem,
//                           decoration: BoxDecoration(
//                             color: viewModel.agree
//                                 ? MyColors.ableColor
//                                 : MyColors.disableColor,
//                             borderRadius: BorderRadius.circular(8 * fem),
//                           ),
//                           child: Center(
//                             child: Text(
//                               '확인',
//                               textAlign: TextAlign.center,
//                               style: SafeGoogleFont(
//                                 'Pretendard',
//                                 fontSize: 18 * ffem,
//                                 fontWeight: FontWeight.w500,
//                                 height: 1.3999999364 * ffem / fem,
//                                 color: viewModel.agree
//                                     ? MyColors.ableTextColor
//                                     : MyColors.disableTextColor,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
