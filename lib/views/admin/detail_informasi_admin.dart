import 'package:flutter/material.dart';
import 'edit_informasi_admin.dart';

class DetailInformasiAdmin extends StatelessWidget {
  final String judul;
  final String deskripsi;
  final String imageUrl;
  final String docId;

  const DetailInformasiAdmin({
    super.key,
    required this.judul,
    required this.deskripsi,
    required this.imageUrl,
    required this.docId,
  });

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          judul,
          style: const TextStyle(
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
                        child: Image.network(
                          imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          deskripsi,
                          style: const TextStyle(
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
                      builder: (context) => EditInformasiAdmin(
                        judul: judul,
                        deskripsi: deskripsi,
                        imageUrl: imageUrl,
                        docId: docId,
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(1, 188, 177, 1),
                  ),
                  child: const Icon(
                    Icons.edit_square,
                    color: Colors.white,
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
