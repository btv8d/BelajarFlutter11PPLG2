import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_login_flutter/components/custom_button.dart';
import 'package:tugas_login_flutter/components/custom_text.dart';

class ConfirmRegistrationPage extends StatelessWidget {
  const ConfirmRegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Get.arguments as Map<String, dynamic>? ?? {};
    final username = data['username'] ?? '-';
    final namaLengkap = data['nama_lengkap'] ?? '-';
    final email = data['email'] ?? '-';
    final noWa = data['no_wa'] ?? '-';
    final agama = data['agama'] ?? '-';
    final jenisKelamin = data['jenis_kelamin'] ?? '-';

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F9),
      appBar: AppBar(
        title: const Text("Konfirmasi Data", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.indigoAccent,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          elevation: 5,
          shadowColor: Colors.black12,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.teal.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.verified_user_rounded,
                      size: 40,
                      color: Colors.teal,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const Center(
                  child: CustomText(
                    text: "Ringkasan Pendaftaran",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
                const Divider(height: 32, thickness: 1),

                _buildInfoTile(Icons.alternate_email_rounded, "Username", username),
                _buildInfoTile(Icons.badge_outlined, "Nama Lengkap", namaLengkap),
                _buildInfoTile(Icons.email_outlined, "Email", email),
                _buildInfoTile(Icons.phone_android_outlined, "No WhatsApp", noWa),
                _buildInfoTile(Icons.auto_awesome_outlined, "Agama", agama),
                _buildInfoTile(Icons.wc_outlined, "Jenis Kelamin", jenisKelamin),

                const SizedBox(height: 28),

                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    textButton: "OK / Selesai",
                    icon: Icons.check_circle_outline_rounded,
                    textColor: Colors.white,
                    buttonColor: Colors.teal,
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoTile(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.indigo.withOpacity(0.08),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: Colors.indigoAccent, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
                const SizedBox(height: 2),
                Text(
                  value.isEmpty ? '-' : value,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}