import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sikode/utils/elevatedbutton.dart';
import 'package:sikode/utils/imagepicker.dart';
import 'package:sikode/utils/textformfield.dart';
import 'package:sikode/viewmodels/jadwal_olahraga_viewmodel.dart';

class TambahJadwalOlahraga extends StatefulWidget {
  const TambahJadwalOlahraga({super.key});

  @override
  State<TambahJadwalOlahraga> createState() => _TambahJadwalOlahragaState();
}

class _TambahJadwalOlahragaState extends State<TambahJadwalOlahraga> {
  late TextEditingController namakegiatanController;
  late TextEditingController tanggalkegiatanController;
  late TextEditingController lokasikegiatanController;
  File? _imageFile;

  @override
  void initState() {
    super.initState();
    namakegiatanController = TextEditingController();
    tanggalkegiatanController = TextEditingController();
    lokasikegiatanController = TextEditingController();
  }

  @override
  void dispose() {
    namakegiatanController.dispose();
    tanggalkegiatanController.dispose();
    lokasikegiatanController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      setState(() {
        tanggalkegiatanController.text =
            "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      });
    }
  }

  Future<void> _showPickerDialog(BuildContext context) async {
    final pickedFile = await showDialog<XFile?>(
      context: context,
      builder: (BuildContext context) {
        return const ImagePickerDialog();
      },
    );

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final jadwalOlahragaViewModel =
        Provider.of<JadwalOlahragaViewModel>(context, listen: false);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Tambah Jadwal Olahraga",
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
            const SizedBox(height: 50),
            Container(
              alignment: Alignment.topLeft,
              child: const Text(
                "Nama Olahraga",
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
              controller: namakegiatanController,
              hintText: "Masukkan Nama Olahraga",
            ),
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.topLeft,
              child: const Text(
                "Waktu",
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
              controller: tanggalkegiatanController,
              hintText: "Hari, Tgl/Bln/Thn",
              suffixIcon: IconButton(
                onPressed: () {
                  _selectDate(context);
                },
                icon: const Icon(
                  Icons.calendar_today_outlined,
                  color: Color.fromRGBO(1, 188, 177, 1),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.topLeft,
              child: const Text(
                "Lokasi",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: lokasikegiatanController,
              hintText: "Masukkan Lokasi",
            ),
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.topLeft,
              child: const Text(
                "Upload gambar",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromRGBO(169, 169, 169, 1),
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 2,
                  ),
                  const Text(
                    "Tidak ada file yang dipilih",
                    style: TextStyle(
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
              height: 100,
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
                      await jadwalOlahragaViewModel.uploadImageToStorage(
                    _imageFile!,
                    'informasi_${DateTime.now().millisecondsSinceEpoch}.jpg',
                  );

                  await jadwalOlahragaViewModel.addJadwalOlahraga(
                    docId,
                    namakegiatanController.text,
                    DateTime.parse(tanggalkegiatanController.text),
                    lokasikegiatanController.text,
                    imageUrl,
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
