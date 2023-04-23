import 'package:flutter/material.dart';
import 'package:wasseoyo/utils/constants/assets.dart';
import 'package:wasseoyo/utils/constants/fonts.dart';

class AgreeCheck extends StatefulWidget {
  const AgreeCheck({
    super.key,
    required this.fem,
    this.execFunc,
    required this.ffem,
    required this.text,
    this.checked,
  });

  final double fem;
  final Function? execFunc;
  final double ffem;
  final String text;
  final bool? checked;

  @override
  State<AgreeCheck> createState() => _AgreeCheckState();
}

class _AgreeCheckState extends State<AgreeCheck> {
  bool checked = false;

  @override
  void initState() {
    checked = widget.checked ?? checked;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // a96 (395:84)
      margin: EdgeInsets.fromLTRB(
          0 * widget.fem, 0 * widget.fem, 0 * widget.fem, 0 * widget.fem),
      width: double.infinity,
      child: GestureDetector(
        onTap: () {
          widget.execFunc?.call() ??
              setState(
                () => checked = !checked,
              );
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // stradioW2k (395:85)
              margin: EdgeInsets.fromLTRB(0 * widget.fem, 0 * widget.fem,
                  8 * widget.fem, 0 * widget.fem),
              width: 27 * widget.fem,
              height: 27 * widget.fem,
              child: Image.asset(
                checked ? MyAssets.checked : MyAssets.unChecked,
                width: 27 * widget.fem,
                height: 27 * widget.fem,
              ),
            ),
            Container(
              // Qdv (395:86)
              margin: EdgeInsets.fromLTRB(0 * widget.fem, 5 * widget.fem,
                  0 * widget.fem, 0 * widget.fem),
              child: GestureDetector(
                child: Text(
                  widget.text,
                  style: SafeGoogleFont(
                    'Pretendard',
                    fontSize: 16 * widget.ffem,
                    fontWeight: FontWeight.w500,
                    height: 1 * widget.ffem / widget.fem,
                    color: const Color(0xff222222),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
