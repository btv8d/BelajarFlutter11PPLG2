import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_login_flutter/controllers/detail_makanan_controllers.dart'; // Import controller baru
import 'package:tugas_login_flutter/models/makanan_models.dart';

class DetailMakananPage extends StatelessWidget {
  const DetailMakananPage({super.key});

  @override
  Widget build(BuildContext context) {
    final DetailMakananController controller = Get.put(DetailMakananController());
    
    final MakananModel makanan = controller.makanan;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FA), 
      appBar: AppBar(
        title: Text(makanan.namaMakanan, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: const Color(0xFF6BC5CC), 
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            Stack(
              children: [
                Image.network(
                  makanan.gambarMakanan,
                  width: double.infinity,
                  height: 260,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 260,
                      color: const Color(0xFFF6CF71).withOpacity(0.3),
                      child: const Icon(Icons.fastfood, size: 80, color: Color(0xFFF89C74)),
                    );
                  },
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.4),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF6CF71).withOpacity(0.35),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          makanan.kategoriMakanan, 
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFFB8860B),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Color(0xFFF6CF71), size: 18),
                          const SizedBox(width: 4),
                          Text(
                            "${makanan.ratingMakanan} / 5.0", 
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2C3E50),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                 
                  Text(
                    makanan.namaMakanan,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2C3E50),
                    ),
                  ),
                  const SizedBox(height: 6),

                  
                  Text(
                    makanan.hargaMakanan,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2ECC71),
                    ),
                  ),
                  const Divider(height: 28, thickness: 1, color: Color(0xFFE2E8F0)),

                 
                  const Text(
                    "Deskripsi Makanan",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF2C3E50)),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    makanan.deskripsiMakanan,
                    style: const TextStyle(fontSize: 14, color: Color(0xFF718096), height: 1.4),
                  ),
                  const SizedBox(height: 20),

                  
                  const Text(
                    "Ulasan Pelanggan",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF2C3E50)),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFF89C74).withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        ),
                      ],
                      border: Border.all(color: const Color(0xFFF89C74).withOpacity(0.3)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.format_quote, color: Color(0xFFF89C74), size: 24),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            '"${makanan.ulasanMakanan}"', 
                            style: const TextStyle(
                              fontSize: 14,
                              fontStyle: FontStyle.italic,
                              color: Color(0xFF4A5568),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}