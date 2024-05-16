import 'package:flutter/material.dart';
import 'package:sikode/views/admin/edit_informasi_admin.dart';

class DetailInformasiAdmin extends StatefulWidget {
  const DetailInformasiAdmin({super.key});

  @override
  State<DetailInformasiAdmin> createState() => _DetailInformasiAdminState();
}

class _DetailInformasiAdminState extends State<DetailInformasiAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Vaksinasi Covid-19",
          style: TextStyle(
            fontFamily: "Montserrat",
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: const Color.fromRGBO(1, 188, 177, 1),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Container(
              alignment: Alignment.topLeft,
              child: SizedBox(
                width: 375,
                height: 560,
                child: Card(
                  color: const Color.fromRGBO(1, 188, 177, 1),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(15),
                        ),
                        child: Image.asset(
                          'assets/images/informasi_vaksinasi.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                          maxLines: null,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 35),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditInformasiAdmin(),
                    ),
                  ); // Aksi yang dijalankan saat tombol ditekan
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(1, 188, 177, 1), // Warna tombol
                  ),
                  child: const Icon(
                    Icons.edit_square,
                    color: Colors.white, // Warna ikon di dalam tombol
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
