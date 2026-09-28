import 'package:flutter/material.dart';
import 'package:tugas_login_flutter/components/custom_text.dart';      
import 'package:tugas_login_flutter/components/custom_textfield.dart'; 
import 'package:tugas_login_flutter/components/custom_button.dart';   

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController txtUsername = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();
  String statusLogin = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           
            CustomText(
              text: "Welcome to application $statusLogin",
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 46, 9, 182),
            ),
            const SizedBox(height: 20),
            
            
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: CustomTextfield(
                myHint: "Input Username",
                txtController: txtUsername,
              ),
            ),
            
           
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: CustomTextfield(
                myHint: "Input Password",
                txtController: txtPassword,
              ),
            ),
            const SizedBox(height: 20),

            
            CustomButton(
              textButton: "Login",
              textColor: Colors.white,
              buttonColor: Colors.green,
              onPressed: () {
                setState(() {
                  String username = txtUsername.text.toString();
                  String password = txtPassword.text.toString();
                  if (username == "admin" && password == "admin") {
                    statusLogin = "Admin";
                    print("Sukses login");
                  } else {
                    statusLogin = "Failed";
                    print("Gagal login");
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}