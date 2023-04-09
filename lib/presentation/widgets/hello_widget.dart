import 'package:flutter/material.dart';

class HelloTextWidget extends StatelessWidget {
  const HelloTextWidget({
    Key? key,
    required this.userName,
  }) : super(key: key);
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Text(
      "hello World from $userName",
      textAlign: TextAlign.center,
    );
  }
}
