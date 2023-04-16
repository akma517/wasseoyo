import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:wasseoyo/presentation/viewmodels/skwsy10001_view_model.dart';
import 'package:wasseoyo/utils/constants/route_constant.dart';
import 'package:wasseoyo/utils/helpers/route_mapper.dart';
import 'package:wasseoyo/utils/helpers/scroll.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding
      .ensureInitialized(); // 파이어베이스 채널 비동기 작업 보장을 위한 필수 코드
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  late bool autoLogined;
  Skwsy10001ViewModel skwsy10001ViewModel = Skwsy10001ViewModel();
  await skwsy10001ViewModel.autoLogin().then(
    (autoLogin) {
      if (autoLogin) {
        autoLogined = true;
      } else {
        autoLogined = false;
      }
    },
  );
  return runApp(MyApp(autoLogined: autoLogined));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.autoLogined});

  final bool autoLogined;

  @override
  Widget build(BuildContext context) {
    var initRoute = autoLogined == true ? Routes.index : Routes.login;
    FlutterNativeSplash.remove();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Skwsy10001ViewModel(),
        ),
      ],
      child: MaterialApp(
        title: 'Wasseoyo Demo',
        debugShowCheckedModeBanner: false,
        scrollBehavior: MyCustomScrollBehavior(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: initRoute,
        routes: routeManager,
      ),
    );
  }
}
