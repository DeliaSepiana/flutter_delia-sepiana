import 'package:flutter/material.dart';
import 'package:praktikum/api_recomend.dart';

import 'result_page.dart';

class RecomendationPage extends StatefulWidget {
  const RecomendationPage({Key? key});

  @override
  State<RecomendationPage> createState() => _RecomendationPageState();
}

class _RecomendationPageState extends State<RecomendationPage> {
  final RecomendationService _recommendationService = RecomendationService();

  TextEditingController harga = TextEditingController();
  TextEditingController kamera = TextEditingController();
  TextEditingController penyimpanan = TextEditingController();
  String gptOutput = '';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title:
            const Text("Phone Recommendations", style: TextStyle(fontSize: 18)),
        backgroundColor: const Color.fromARGB(255, 48, 119, 51),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              buildTextField(
                  harga, 'Harga', 'Contoh: 10000000', TextInputType.text),
              buildTextField(
                  kamera, 'Kamera', 'Contoh: 68mp', TextInputType.text),
              buildTextField(penyimpanan, 'Penyimpanan', 'Contoh: 125gb',
                  TextInputType.text),
              SizedBox(height: 15),
              Align(
                alignment: Alignment.centerRight,
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      submit();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(
                          255, 48, 119, 51), // Warna hijau pada tombol
                      fixedSize:
                          Size(200, 40), // Panjang lebar dan tinggi tombol
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(8.0), // Radius tombol
                      ),
                    ),
                    child: const Text('Dapatkan Rekomendasi'),
                  ),
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(TextEditingController controller, String label,
      String hint, TextInputType keyboardType) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(),
          contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        ),
      ),
    );
  }

  Future<void> submit() async {
    setState(() {
      isLoading = true;
    });

    try {
      gptOutput = await _recommendationService.getRecommendation(
        harga,
        kamera,
        penyimpanan,
      );

      // Navigasi ke halaman result
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(result: gptOutput),
        ),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
}
