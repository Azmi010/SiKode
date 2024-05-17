import 'package:flutter/material.dart';
import 'package:sikode/utils/elevatedbutton.dart';
import 'package:sikode/utils/imagepicker.dart';
import 'package:sikode/utils/textformfield.dart';
import 'package:sikode/views/admin/informasi_admin.dart';

class TambahInformasiAdmin extends StatefulWidget {
  const TambahInformasiAdmin({super.key});

  @override
  State<TambahInformasiAdmin> createState() => _TambahInformasiAdminState();
}

class _TambahInformasiAdminState extends State<TambahInformasiAdmin> {
  late TextEditingController judulcontroller;
  late TextEditingController deskripsicontroller;

  @override
  void initState() {
    super.initState();
    judulcontroller = TextEditingController();
    deskripsicontroller = TextEditingController();
  }

  @override
  void dispose() {
    judulcontroller.dispose();
    deskripsicontroller.dispose();
    super.dispose();
  }

  Future<void> _showPickerDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return const ImagePickerDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Tambah Informasi Warga",
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
              child: const Text(
                "Judul",
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              controller: judulcontroller,
              hintText: "Masukkan Judul Informasi",
            ),
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.topLeft,
              child: const Text(
                "Deskripsi",
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              controller: deskripsicontroller,
              hintText: "Masukkan Deskripsi",
              maxLines: 10,
              minLines: 1,
              keyboardType: TextInputType.multiline,
            ),
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.topLeft,
              child: const Text(
                "Upload Gambar",
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromRGBO(169, 169, 169, 1),
                  ),
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 2),
                  const Text(
                    "Tidak ada file yang dipilih",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Color.fromRGBO(1, 193, 139, 1),
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await _showPickerDialog(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(228, 228, 228, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: const Text(
                      "pilih file",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            CustomButton(
              text: "Tambah",
              backgroundColor: const Color.fromRGBO(1, 193, 139, 1),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InformasiAdmin(),
                  ),
                ); // Aks
              },
            ),
          ],
        ),
      ),
    );
  }
}
