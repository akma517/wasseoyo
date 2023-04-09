import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:wasseoyo/presentation/viewmodels/index_view_model.dart';
import 'package:wasseoyo/utils/constants/route_constant.dart';
import 'package:wasseoyo/utils/helpers/route_mapper.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // 파이어베이스 채널 비동기 작업 보장을 위한 필수 코드
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => IndexViewModel(),
        ),
      ],
      child: MaterialApp(
        title: 'Wasseoyo Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: Routes.index,
        routes: routeManager,
      ),
    );
  }
}
