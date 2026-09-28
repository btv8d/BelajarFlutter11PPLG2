import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_login_flutter/components/custom_text.dart';      
import 'package:tugas_login_flutter/components/custom_textfield.dart'; 
import 'package:tugas_login_flutter/components/custom_button.dart';
import 'package:tugas_login_flutter/controllers/kalkulator_controller.dart';   

class MyCalculator extends StatefulWidget {
  const MyCalculator({super.key});

  @override
  State<MyCalculator> createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  
  final KalkulatorController controller = Get.put(KalkulatorController());
  

  final TextEditingController txtAngka1 = TextEditingController();
  final TextEditingController txtAngka2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Calculator Custom GetX'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Obx(() => CustomText(
              text: 'Hasil: ${controller.hasilHitung.value}',
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            )),
            const SizedBox(height: 24),
            
           //num only
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: CustomTextfield(
                myHint: 'Masukkan Angka Pertama',
                txtController: txtAngka1,
              ),
            ),
            
            //num only
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: CustomTextfield(
                myHint: 'Masukkan Angka Kedua',
                txtController: txtAngka2,
              ),
            ),
            const SizedBox(height: 24),
           
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Tombol Tambah
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: CustomButton(
                      textButton: '(+)',
                      buttonColor: Colors.blue,
                      textColor: Colors.white,
                      onPressed: () => controller.hitung('+', txtAngka1.text, txtAngka2.text),
                    ),
                  ),
                ),
                // Tombol Kurang
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: CustomButton(
                      textButton: '(-)',
                      buttonColor: Colors.orange,
                      textColor: Colors.white,
                      onPressed: () => controller.hitung('-', txtAngka1.text, txtAngka2.text),
                    ),
                  ),
                ),
                // Tombol Kali
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: CustomButton(
                      textButton: '(×)',
                      buttonColor: Colors.purple,
                      textColor: Colors.white,
                      onPressed: () => controller.hitung('×', txtAngka1.text, txtAngka2.text),
                    ),
                  ),
                ),
                // Tombol Bagi
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: CustomButton(
                      textButton: '(÷)',
                      buttonColor: Colors.green,
                      textColor: Colors.white,
                      onPressed: () => controller.hitung('÷', txtAngka1.text, txtAngka2.text),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}