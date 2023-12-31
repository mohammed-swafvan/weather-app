import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:weatherapp_starter_project/presentation/screens/home_screen.dart';
import 'package:weatherapp_starter_project/presentation/utils/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather',
      theme: appTheme(),
      home: const HomeScreen(),
    );
  }
}
