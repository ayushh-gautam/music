import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musico/constants/colors.dart';
import 'package:musico/pages/tabbar.dart';

// import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: whiteColor),
        backgroundColor: Colors.transparent,
        elevation: 0,
      )),
      home: MyTabar(),
    );
  }
}
