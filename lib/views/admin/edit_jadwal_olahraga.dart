import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sikode/utils/elevatedbutton.dart';
import 'package:sikode/utils/imagepicker.dart';
import 'package:sikode/utils/textformfield.dart';
import 'package:sikode/viewmodels/jadwal_olahraga_viewmodel.dart';
import 'package:sikode/views/admin/bottom_navbar_admin.dart';

class EditJadwalOlahraga extends StatefulWidget {
  final String judul;
  final String waktu; // Ensure this is a valid date string
  final String lokasi;
  final String imageUrl;
  final String docId;

  const EditJadwalOlahraga({
    super.key,
    required this.judul,
    required this.waktu,
    required this.lokasi,
    required this.imageUrl,
    required this.docId,
  });

  @override
  State<EditJadwalOlahraga> createState() => _EditJadwalOlahragaState();
}

class _EditJadwalOlahragaState extends State<EditJadwalOlahraga> {
  late TextEditingController namakegiatanController;
  late TextEditingController tanggalkegiatanController;
  late TextEditingController lokasikegiatanController;
  File? _imageFile;

  @override
  void initState() {
    super.initState();
    namakegiatanController = TextEditingController(text: widget.judul);

    // Parse the initial date string to DateTime and format it
    DateTime initialDate = DateFormat("yyyy-MM-dd").parse(widget.waktu); // Adjust the date format to match the input format
    String formattedDate = DateFormat("dd/MM/yyyy").format(initialDate);
    tanggalkegiatanController = TextEditingController(text: formattedDate);

    lokasikegiatanController = TextEditingController(text: widget.lokasi);
  }

  @override
  void dispose() {
    namakegiatanController.dispose();
    tanggalkegiatanController.dispose();
    lokasikegiatanController.dispose();
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
      });
    }
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
            "${pickedDate.day.toString().padLeft(2, '0')}/${pickedDate.month.toString().padLeft(2, '0')}/${pickedDate.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final jadwalOlahragaViewModel = Provider.of<JadwalOlahragaViewModel>(context, listen: false);
  
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "Edit Jadwal Olahraga",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(1, 188, 177, 1),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Opacity(
                      opacity: 0.3,
                      child: Image.network(
                        widget.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  IconButton(
                      iconSize: 26,
                      onPressed: () async {
                        await _showPickerDialog(context);
                      },
                      icon: Image.asset(
                        'assets/images/upload_gambar.png',
                        width: 26,
                      ))
                ],
              ),
              const SizedBox(height: 60),
              CustomTextField(
                controller: namakegiatanController,
              ),
              const SizedBox(height: 40),
              CustomTextField(
                controller: tanggalkegiatanController,
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
              const SizedBox(height: 40),
              CustomTextField(
                controller: lokasikegiatanController,
              ),
              const SizedBox(height: 40),
              CustomButton(
                text: "Simpan",
                backgroundColor: const Color.fromRGBO(1, 188, 177, 1),
                onPressed: () async {
                  try {
                    if (namakegiatanController.text.isEmpty ||
                        tanggalkegiatanController.text.isEmpty ||
                        lokasikegiatanController.text.isEmpty) {
                      print('Semua kolom harus diisi');
                      return;
                    }

                    DateTime parsedDate;
                    try {
                      parsedDate = DateFormat('dd/MM/yyyy').parseStrict(tanggalkegiatanController.text);
                    } catch (e) {
                      print('Format tanggal tidak valid');
                      return;
                    }

                    String imageUrl = widget.imageUrl;
                    if (_imageFile != null) {
                      imageUrl = await jadwalOlahragaViewModel.uploadImageToStorage(
                        _imageFile!,
                        'jadwal_olahraga_${DateTime.now().millisecondsSinceEpoch}.jpg',
                      );
                    }

                    await jadwalOlahragaViewModel.updateJadwalOlahraga(
                      widget.docId,
                      namakegiatanController.text,
                      parsedDate,
                      lokasikegiatanController.text,
                      imageUrl,
                    );

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NavbarAdmin(initialIndex: 0),
                      ),
                    );
                  } catch (e) {
                    print('Error mengedit jadwal: $e');
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
