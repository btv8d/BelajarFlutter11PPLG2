import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_login_flutter/routers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Belajar Flutter GetX",
      initialRoute: Routes.list_makanan,
      getPages: Routes.myPages,
      debugShowCheckedModeBanner: false,
    );
  }
}