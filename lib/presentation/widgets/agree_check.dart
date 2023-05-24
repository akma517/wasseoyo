import 'package:flutter/material.dart';
import 'package:wasseoyo/utils/constants/assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wasseoyo/utils/constants/fonts.dart';

class AgreeCheck extends StatefulWidget {
  const AgreeCheck({
    super.key,
    this.execFunc,
    required this.text,
    this.checked,
  });

  final Function? execFunc;
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
    return GestureDetector(
      onTap: () {
        widget.execFunc?.call() ??
            setState(
              () => checked = !checked,
            );
      },
      child: Container(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Image.asset(
                checked ? MyAssets.checked : MyAssets.unChecked,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              widget.text,
              style: MyFonts.m16,
            ),
          ],
        ),
      ),
    );
  }
}
