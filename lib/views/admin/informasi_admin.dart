import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sikode/viewmodels/informasi_viewmodel.dart';
import 'package:sikode/views/admin/detail_informasi_admin.dart';
import 'package:sikode/views/admin/tambah_informasi_admin.dart';

class InformasiAdmin extends StatefulWidget {
  const InformasiAdmin({super.key});

  @override
  State<InformasiAdmin> createState() => _InformasiAdminState();
}

class _InformasiAdminState extends State<InformasiAdmin> {
  @override
  void initState() {
    super.initState();
    Provider.of<InformasiViewModel>(context, listen: false).fetchInformasi();
  }

  @override
  Widget build(BuildContext context) {
    final informasiViewModel = Provider.of<InformasiViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Informasi Warga",
          style: TextStyle(
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
            if (informasiViewModel.isLoading)
              const Center(child: CircularProgressIndicator())
            else
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    final informasi = informasiViewModel.informasiList[index];
                    return Column(
                      children: [
                        const SizedBox(height: 15),
                        Text(
                          informasi.judul,
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: SizedBox(
                            width: 375,
                            height: 250,
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
                                    child: Image.network(
                                      informasi.imageUrl,
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
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                            decoration:
                                                TextDecoration.underline,
                                            decorationColor: Colors.white),
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DetailInformasiAdmin(
                                                  judul: informasi.judul,
                                                  deskripsi: informasi.deskripsi,
                                                  imageUrl: informasi.imageUrl,
                                                ),
                                          ),
                                        );
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
                  itemCount: informasiViewModel.informasiList.length,
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
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 25),
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(1, 188, 177, 1),
                  ),
                  child: const Icon(
                    Icons.add,
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
