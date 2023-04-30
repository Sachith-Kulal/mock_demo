import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_demo/constants/app_theme.dart';
import 'package:test_demo/pages/home_page.dart';

import 'controllers/app_initial_binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AppInitialBinding(),
      title: 'mock',
      theme: AppTheme().themeDataCustom,
      home: const HOME(),
    );
  }
}



