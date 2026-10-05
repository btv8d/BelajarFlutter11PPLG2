import 'package:get/get.dart';
import 'package:tugas_login_flutter/pages/confirm_registration_page.dart';
import 'package:tugas_login_flutter/pages/registration_page.dart';

class Routes {
  static const String registration = "/registration";
  static const String confirm_registration = "/confirm_registration";
  //dll

  //masukkan ke myPages array
  static final myPages = [
    GetPage(name: registration, page: () => RegistrationPage()),
    GetPage(name: confirm_registration, page: () => ConfirmRegistrationPage())
    //dll
  ];
}