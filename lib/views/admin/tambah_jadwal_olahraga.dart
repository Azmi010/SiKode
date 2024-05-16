import 'package:flutter/material.dart';
import 'package:sikode/utils/elevatedbutton.dart';
import 'package:sikode/utils/imagepicker.dart';
import 'package:sikode/utils/textformfield.dart';

class TambahJadwalOlahraga extends StatefulWidget {
  const TambahJadwalOlahraga ({super.key});

  @override
  State<TambahJadwalOlahraga> createState() => _TambahJadwalOlahragaState();
}

class _TambahJadwalOlahragaState extends State<TambahJadwalOlahraga> {
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
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Tambah Jadwal Olahraga",
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
            const SizedBox(height: 50),
            Container(
              alignment: Alignment.topLeft,
              child: const Text(
                "Nama Olahraga",
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
              controller: namakegiatanController,
              hintText: "Masukkan Nama Olahraga",
            ),
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.topLeft,
              child: const Text(
                "Hari, Tgl/Bln/Thn",
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
              controller: tanggalkegiatanController,
              hintText: "Masukkan Deskripsi",
            ),
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.topLeft,
              child: const Text(
                "Lokasi",
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(
              height: 10),
               CustomTextField(
              controller: lokasikegiatanController,
              hintText: "Masukkan Lokasi",
            ),
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.topLeft,
              child: const Text(
                "Masukkan Lokasi",
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
            Container(
              width: 336,
              height: 36,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromRGBO(169, 169, 169, 1),
                ),
              ),
              child: Row(
                children: [
                  const Text(
                    "Tidak ada file yang dipilih",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Color.fromRGBO(1, 193, 139, 1),
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: ElevatedButton(
                      onPressed: () async {
                        await _showPickerDialog(context);
                      },
                      style:
                          ElevatedButton.styleFrom(shape: const LinearBorder()),
                      child: const Text("pilih file"),
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
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}