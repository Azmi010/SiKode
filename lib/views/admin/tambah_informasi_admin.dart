import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sikode/utils/elevatedbutton.dart';
import 'package:sikode/utils/imagepicker.dart';
import 'package:sikode/utils/popup.dart';
import 'package:sikode/utils/textformfield.dart';
import 'package:sikode/viewmodels/informasi_viewmodel.dart';
import 'package:sikode/views/admin/bottom_navbar_admin.dart';

class TambahInformasiAdmin extends StatefulWidget {
  const TambahInformasiAdmin({super.key});

  @override
  State<TambahInformasiAdmin> createState() => _TambahInformasiAdminState();
}

class _TambahInformasiAdminState extends State<TambahInformasiAdmin> {
  late TextEditingController judulcontroller;
  late TextEditingController deskripsicontroller;
  File? _imageFile;
  String _fileName = "Tidak ada file yang dipilih";

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
    final pickedFile = await showDialog<File?>(
      context: context,
      builder: (BuildContext context) {
        return const ImagePickerDialog();
      },
    );

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
        _fileName = pickedFile.path.split('/').last;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final informasiViewModel =
        Provider.of<InformasiViewModel>(context, listen: false);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Tambah Informasi Warga",
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
            const SizedBox(height: 30),
            Container(
              alignment: Alignment.topLeft,
              child: const Text(
                "Judul",
                style: TextStyle(
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
                    const SizedBox(
                      width: 2,
                    ),
                    Expanded(
                      child: Text(
                        _fileName,
                        style: const TextStyle(
                          color: Color.fromRGBO(1, 193, 139, 1),
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await _showPickerDialog(context);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(228, 228, 228, 1),
                          fixedSize: Size(
                              MediaQuery.of(context).size.width * 0.25,
                              double.infinity),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      child: const Text(
                        "pilih",
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
              onPressed: () async {
                if (_imageFile != null) {
                  final docRef =
                      FirebaseFirestore.instance.collection('informasi').doc();
                  final docId = docRef.id;

                  final imageUrl =
                      await informasiViewModel.uploadImageToStorage(
                    _imageFile!,
                    'informasi_${DateTime.now().millisecondsSinceEpoch}.jpg',
                  );

                  await informasiViewModel.addInformasi(
                    docId,
                    judulcontroller.text,
                    deskripsicontroller.text,
                    imageUrl,
                  );
                  showCustomDialog(
                    context,
                    icon: Icons.check_circle_outline_sharp,
                    title: "Berhasil",
                    message: "Berhasil Menambah Informasi",
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NavbarAdmin(
                            initialIndex: 1,
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
