import 'package:flutter/material.dart';
import 'package:flutter_calculator_getx/binding/calculator_binding.dart';
import 'package:flutter_calculator_getx/view/calculator_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    bool savedDark = box.read("isDarkMode") ?? false;

    return GetMaterialApp(
      title: 'Calculator App',
      debugShowCheckedModeBanner: false,
      initialBinding: CalculatorBinding(),
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: savedDark ? ThemeMode.dark : ThemeMode.light,
      home: CalculatorScreen(),
    );
  }
}
