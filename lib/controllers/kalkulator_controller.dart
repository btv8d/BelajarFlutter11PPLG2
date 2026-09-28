import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KalkulatorController extends GetxController {
  var hasilHitung = '0'.obs;

  void hitung(String operator, String strAngka1, String strAngka2) {
    if (strAngka1.trim().isEmpty || strAngka2.trim().isEmpty) {
      Get.snackbar(
        "Peringatan",
        "Angka pertama dan kedua tidak boleh kosong!",
        backgroundColor: Colors.orange,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    double angka1 = double.tryParse(strAngka1) ?? 0;
    double angka2 = double.tryParse(strAngka2) ?? 0;
    double kalkulasi = 0;

    if (operator == '+') {
      kalkulasi = angka1 + angka2;
    } else if (operator == '-') {
      kalkulasi = angka1 - angka2;
    } else if (operator == '×') {
      kalkulasi = angka1 * angka2;
    } else if (operator == '÷') {
      
      if (angka2 == 0) {
        Get.snackbar(
          "Peringatan Error",
          "Tidak dapat membagi dengan angka 0!",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }
      kalkulasi = angka1 / angka2;
    }

  
    hasilHitung.value = kalkulasi.toStringAsFixed(
      kalkulasi.truncateToDouble() == kalkulasi ? 0 : 2,
    );

   
    Get.snackbar(
      "Berhasil",
      "Hasil: ${hasilHitung.value}",
      backgroundColor: Colors.green,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
  }
}