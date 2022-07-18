import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speedtest/app/binding/home_binding.dart';

import 'app/view/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SpeedTest',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: HomeBinding(),
      home: const HomeView(),
    );
  }
}
