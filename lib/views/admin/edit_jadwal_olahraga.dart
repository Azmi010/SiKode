import "package:flutter/material.dart";
import 'package:sikode/utils/elevatedbutton.dart';
import 'package:sikode/utils/imagepicker.dart';
import 'package:sikode/utils/textformfield.dart';

class EditJadwalOlahraga extends StatefulWidget {
  const EditJadwalOlahraga({super.key});

  @override
  State<EditJadwalOlahraga> createState() => _EditJadwalOlahragaState();
}

class _EditJadwalOlahragaState extends State<EditJadwalOlahraga> {
  late TextEditingController namakegiatanController;
  late TextEditingController tanggalkegiatanController;
  late TextEditingController lokasikegiatanController;

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
        appBar: AppBar(
          title: const Text(
            "Edit Jadwal Olahraga",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color.fromRGBO(1, 188, 177, 1),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: Padding(
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
                      child: Image.asset(
                        "assets/images/Lari Bersama.jpeg",
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
                hintText: "Lari Bersama",
              ),
              const SizedBox(height: 40),
              CustomTextField(
                controller: tanggalkegiatanController,
                hintText: "Minggu, 5 Mei 2023",
              ),
              const SizedBox(height: 40),
              CustomTextField(
                controller: lokasikegiatanController,
                hintText: "Lapangan Sidomulyo",
              ),
              const SizedBox(height: 40),
              CustomButton(
                text: "Simpan",
                backgroundColor: const Color.fromRGBO(1, 188, 177, 1),
                onPressed: () {
                  // Simpan action
                },
              )
            ],
          ),
        ));
  }
}
