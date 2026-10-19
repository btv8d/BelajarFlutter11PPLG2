import 'package:get/get.dart';
import 'package:tugas_login_flutter/models/makanan_models.dart';

class DetailMakananController extends GetxController {
  late MakananModel makanan;

  @override
  void onInit() {
    super.onInit();
    
    if (Get.arguments != null && Get.arguments is MakananModel) {
      makanan = Get.arguments;
    } else {
      print("Error: Data makanan tidak ditemukan di Get.arguments!");
    }
  }
}