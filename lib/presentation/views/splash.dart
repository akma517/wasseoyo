import 'package:flutter/material.dart';
import 'package:wasseoyo/utils/constants/fonts.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Container(
          padding: EdgeInsets.fromLTRB(
              100.78 * fem, 256 * fem, 102.83 * fem, 0 * fem),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // kwsylogonUx (439:113)
                margin:
                    EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 20 * fem),
                width: 156.38 * fem,
                height: 45 * fem,
                child: Image.asset(
                  'assets/uiux/images/kwsy-logo-SGx.png',
                  width: 156.38 * fem,
                  height: 45 * fem,
                ),
              ),
              Text(
                '비콘 기반 근태 출근 관리 앱',
                style: SafeGoogleFont(
                  'Pretendard',
                  fontSize: 13 * ffem,
                  fontWeight: FontWeight.w600,
                  height: 1.2999999707 * ffem / fem,
                  color: const Color(0xff666666),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
