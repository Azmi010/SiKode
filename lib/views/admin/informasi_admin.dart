import 'package:flutter/material.dart';
import 'package:sikode/views/admin/detail_informasi_admin.dart';
import 'package:sikode/views/admin/tambah_informasi_admin.dart';

class InformasiAdmin extends StatefulWidget {
  const InformasiAdmin({super.key});

  @override
  State<InformasiAdmin> createState() => _InformasiAdminState();
}

class _InformasiAdminState extends State<InformasiAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Informasi Warga",
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
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      const SizedBox(height: 15),
                      const Text(
                        'Vaksinasi Covid-19',
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          width: 375,
                          height: 280,
                          child: Card(
                            color: const Color.fromRGBO(1, 188, 177, 1),
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: GestureDetector(
                                    child: const Text(
                                      'Baca Selengkapnya...',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'Montserrat',
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          decoration: TextDecoration.underline,
                                          decorationColor: Colors.white),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const DetailInformasiAdmin()));
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
                itemCount: 2,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TambahInformasiAdmin(),
                    ),
                  ); // Aksi yang dijalankan saat tombol ditekan
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 25),
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(1, 188, 177, 1), // Warna tombol
                  ),
                  child: const Icon(
                    Icons.add,
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
