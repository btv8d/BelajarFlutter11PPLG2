import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          "Profil",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          children: [
            
            const CircleAvatar(
              radius: 40,
              backgroundColor: Colors.orangeAccent,
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 12),
            const Text(
              "Nama Pengguna",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              "nanasmadu@mail.com",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 24),

            
            _buildSectionHeader("Akun"),
            _buildSectionCard([
              _buildTile(Icons.person_outline, "Kelola Profil", () {}),
              _buildDivider(),
              _buildTile(Icons.security_outlined, "Keamanan & Privasi", () {}),
            ]),
            const SizedBox(height: 16),

            
            _buildSectionHeader("Preferensi"),
            _buildSectionCard([
              _buildTile(Icons.notifications_none, "Notifikasi", () {}),
              _buildDivider(),
              
              _buildSwitchTile(Icons.dark_mode_outlined, "Mode Gelap", false, (val) {
               
              }),
              _buildDivider(),
              _buildTile(Icons.language, "Bahasa", () {}, trailingText: "Indonesia"),
            ]),
            const SizedBox(height: 16),

            _buildSectionHeader("Dukungan"),
            _buildSectionCard([
              _buildTile(Icons.help_outline, "Pusat Bantuan", () {}),
              _buildDivider(),
              _buildTile(Icons.description_outlined, "Syarat & Ketentuan", () {}),
              _buildDivider(),
              _buildTile(Icons.info_outline, "Tentang Kami", () {}),
            ]),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _buildSectionCard(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }

  Widget _buildTile(IconData icon, String title, VoidCallback onTap, {String? trailingText}) {
    return ListTile(
      leading: Icon(icon, color: Colors.black54, size: 22),
      title: Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (trailingText != null)
            Text(trailingText, style: const TextStyle(fontSize: 13, color: Colors.grey)),
          if (trailingText != null) const SizedBox(width: 4),
          const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
        ],
      ),
      onTap: onTap,
    );
  }

  Widget _buildSwitchTile(IconData icon, String title, bool value, ValueChanged<bool> onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: SwitchListTile(
        secondary: Icon(icon, color: Colors.black54, size: 22),
        title: Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        value: value,
        activeColor: Colors.orange,
        onChanged: onChanged,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
      ),
    );
  }

  // Widget Garis Pemisah
  Widget _buildDivider() {
    return const Divider(height: 1, thickness: 0.5, indent: 50, endIndent: 16);
  }
}