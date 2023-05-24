import 'package:flutter/material.dart';
import 'package:wasseoyo/presentation/views/index_screen.dart';
import 'package:wasseoyo/presentation/views/password_screen.dart';
import 'package:wasseoyo/presentation/views/login_screen.dart';
import 'package:wasseoyo/presentation/views/splash.dart';
import 'package:wasseoyo/utils/constants/route_constant.dart';

final routeManager = <String, WidgetBuilder>{
  //Routes.splash: (context) => Splash(),
  Routes.index: (context) => const Index(),
  Routes.login: (context) => Login(),
  //Routes.password: (context) => Password(),
};
