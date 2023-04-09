import 'package:wasseoyo/presentation/views/index_screen.dart';
import 'package:wasseoyo/presentation/views/splash_screen.dart';
import 'package:wasseoyo/utils/constants/route_constant.dart';

final routeManager = {
  Routes.splash: (context) => const Splash(),
  Routes.index: (context) => const Index(),
};
