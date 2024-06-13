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
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const SizedBox(height: 30),
                Container(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    width: 375,
                    child: Card(
                      color: const Color.fromRGBO(1, 188, 177, 1),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            height: 200,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(15),
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(15),
                              ),
                              child: Image.network(
                                imageUrl,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  } else {
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress.expectedTotalBytes != null
                                            ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                                            : null,
                                      ),
                                    );
                                  }
                                },
                                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                  debugPrint('Image load error: $exception');
                                  return const Center(
                                    child: Icon(
                                      Icons.broken_image,
                                      size: 50,
                                      color: Colors.grey,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              deskripsi,
                              style: const TextStyle(
                                fontSize: 14,
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
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: const EdgeInsets.all(20),
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
            ),
          ),
        ],
      ),
    );
  }
}
