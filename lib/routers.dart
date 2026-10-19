import 'package:get/get.dart';
import 'package:tugas_login_flutter/pages/confirm_registration_page.dart';
import 'package:tugas_login_flutter/pages/registration_page.dart';
import 'package:tugas_login_flutter/pages/list_makanan_page.dart';
import 'package:tugas_login_flutter/pages/detail_makanan_page.dart';

class Routes {
  static const String registration = "/registration";
  static const String confirm_registration = "/confirm_registration";
  static const String list_makanan = "/list_makanan";
  static const String detail_makanan = "/detail_makanan";
  
  //dll

  //masukkan ke myPages array
  static final myPages = [
    GetPage(name: registration, page: () => RegistrationPage()),
    GetPage(name: confirm_registration, page: () => ConfirmRegistrationPage()),
    GetPage(name: list_makanan, page: () => ListMakananPage()),
    GetPage(name: detail_makanan, page: () => DetailMakananPage()),
    //dll
  ];
}