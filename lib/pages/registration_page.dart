import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_login_flutter/components/custom_textfield.dart';
import 'package:tugas_login_flutter/components/custom_button.dart';
import 'package:tugas_login_flutter/components/custom_text.dart';
import 'package:tugas_login_flutter/routers.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController txtUsername = TextEditingController();
  final TextEditingController txtNamaLengkap = TextEditingController();
  final TextEditingController txtEmail = TextEditingController();
  final TextEditingController txtNoWa = TextEditingController();
  final TextEditingController txtAgama = TextEditingController();

  String selectedGender = "Laki-laki";

  @override
  void dispose() {
    txtUsername.dispose();
    txtNamaLengkap.dispose();
    txtEmail.dispose();
    txtNoWa.dispose();
    txtAgama.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F9),
      appBar: AppBar(
        title: const Text("Create Account", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.indigoAccent,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Card Container untuk Form
            Card(
              elevation: 5,
              shadowColor: Colors.black12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Header Form
                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.indigo.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.person_add_alt_1_rounded,
                          size: 40,
                          color: Colors.indigoAccent,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Center(
                      child: CustomText(
                        text: "Form Pendaftaran",
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Input Username
                    CustomTextfield(
                      myHint: "Username",
                      txtController: txtUsername,
                      prefixIcon: Icons.alternate_email_rounded,
                    ),
                    const SizedBox(height: 16),

                    // Input Nama Lengkap
                    CustomTextfield(
                      myHint: "Nama Lengkap",
                      txtController: txtNamaLengkap,
                      prefixIcon: Icons.badge_outlined,
                    ),
                    const SizedBox(height: 16),

                    // Input Email
                    CustomTextfield(
                      myHint: "Alamat Email",
                      txtController: txtEmail,
                      prefixIcon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 16),

                    //no wa
                    CustomTextfield(
                      myHint: "No WhatsApp",
                      txtController: txtNoWa,
                      prefixIcon: Icons.phone_android_outlined,
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 16),

                    //agama
                    CustomTextfield(
                      myHint: "Agama",
                      txtController: txtAgama,
                      prefixIcon: Icons.auto_awesome_outlined,
                    ),
                    const SizedBox(height: 16),

                    //jk
                    DropdownButtonFormField<String>(
                      value: selectedGender,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.wc_outlined, color: Colors.indigoAccent),
                        filled: true,
                        fillColor: Colors.indigo.withOpacity(0.03),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.indigoAccent, width: 2),
                        ),
                      ),
                      items: ["Laki-laki", "Perempuan"].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        if (newValue != null) {
                          setState(() {
                            selectedGender = newValue;
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 32),

                    // Tombol Send
                    CustomButton(
                      textButton: "Kirim Data",
                      icon: Icons.send_rounded,
                      textColor: Colors.white,
                      buttonColor: Colors.indigoAccent,
                      onPressed: () {
                        Get.toNamed(
                          Routes.confirm_registration,
                          arguments: {
                            "username": txtUsername.text,
                            "nama_lengkap": txtNamaLengkap.text,
                            "email": txtEmail.text,
                            "no_wa": txtNoWa.text,
                            "agama": txtAgama.text,
                            "jenis_kelamin": selectedGender,
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}