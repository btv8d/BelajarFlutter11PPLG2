import 'package:get/get.dart';

class ConfirmRegistrationController extends GetxController{
  late String username;
  late String nama_lengkap;

  void onInit(){
    super.onInit();
    final arguments = Get.arguments;
    username = arguments['username'];
    nama_lengkap = arguments['nama_lengkap'];                 
  }
}