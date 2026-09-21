import 'package:flutter/material.dart';
import 'package:tugas_login_flutter/components/custom_text.dart';      
import 'package:tugas_login_flutter/components/custom_textfield.dart'; 
import 'package:tugas_login_flutter/components/custom_button.dart';   

class MyCalculator extends StatefulWidget {
  const MyCalculator({super.key});

  @override
  State<MyCalculator> createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  
  final TextEditingController txtAngka1 = TextEditingController();
  final TextEditingController txtAngka2 = TextEditingController();
  
  String hasil = '0';

  
  void hitung(String operator) {
    setState(() {
      double num1 = double.tryParse(txtAngka1.text) ?? 0;
      double num2 = double.tryParse(txtAngka2.text) ?? 0;
      double kalkulasi = 0;

      if (operator == '+') {
        kalkulasi = num1 + num2;
      } else if (operator == '-') {
        kalkulasi = num1 - num2;
      } else if (operator == '×') {
        kalkulasi = num1 * num2;
      } else if (operator == '÷') {
        if (num2 == 0) {
          hasil = 'Error (Bagi 0)';
          return;
        }
        kalkulasi = num1 / num2;
      }

     
      hasil = kalkulasi.toStringAsFixed(kalkulasi.truncateToDouble() == kalkulasi ? 0 : 2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Calculator Custom'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           
            CustomText(
              text: 'Hasil: $hasil',
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
            const SizedBox(height: 24),
            
            
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: CustomTextfield(
                myHint: 'Masukkan Angka Pertama',
                txtController: txtAngka1,
              ),
            ),
            
            
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
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: CustomButton(
                      textButton: '(+)',
                      buttonColor: Colors.blue,
                      textColor: Colors.white,
                      onPressed: () => hitung('+'),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: CustomButton(
                      textButton: '(-)',
                      buttonColor: Colors.orange,
                      textColor: Colors.white,
                      onPressed: () => hitung('-'),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: CustomButton(
                      textButton: '(×)',
                      buttonColor: Colors.purple,
                      textColor: Colors.white,
                      onPressed: () => hitung('×'),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: CustomButton(
                      textButton: '(÷)',
                      buttonColor: Colors.green,
                      textColor: Colors.white,
                      onPressed: () => hitung('÷'),
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