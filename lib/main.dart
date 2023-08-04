// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:ebotzz/utils/imports.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => GetMaterialApp(
        onInit: () {
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
          ]);
        },
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: child,
        theme: ThemeData(
            fontFamily: 'Brandon Grotesque',
            appBarTheme: AppBarTheme(color: blackColor, centerTitle: true)
        ),
      ),
      child: SignUPScreen(),
      designSize: Size(393, 851),
    );
  }
}


