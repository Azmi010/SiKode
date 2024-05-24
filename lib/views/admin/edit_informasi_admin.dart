import 'package:flutter/material.dart';
import 'package:sikode/utils/elevatedbutton.dart';
import 'package:sikode/utils/imagepicker.dart';
import 'package:sikode/utils/textformfield.dart';

class EditInformasiAdmin extends StatefulWidget {
  final String judul;
  final String deskripsi;
  final String imageUrl;

  const EditInformasiAdmin({
    super.key,
    required this.judul,
    required this.deskripsi,
    required this.imageUrl,
  });

  @override
  State<EditInformasiAdmin> createState() => _EditInformasiAdminState();
}

class _EditInformasiAdminState extends State<EditInformasiAdmin> {
  late TextEditingController judulcontroller;
  late TextEditingController deskripsicontroller;

  @override
  void initState() {
    super.initState();
    judulcontroller = TextEditingController(text: widget.judul);
    deskripsicontroller = TextEditingController(text: widget.deskripsi);
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
            "Edit Vaksinasi Covid-19",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
          backgroundColor: const Color.fromRGBO(1, 188, 177, 1),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
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
                const SizedBox(height: 10),
                CustomTextField(
                  controller: judulcontroller,
                  hintText: "Vaksinasi Covid-19",
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
                const SizedBox(height: 10),
                CustomTextField(
                  controller: deskripsicontroller,
                  maxLines: 10,
                  minLines: 1,
                ),
                const SizedBox(height: 40),
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
                    GestureDetector(
                      onTap: () async {
                        await _showPickerDialog(context);
                      },
                      child: Container(
                        width: 100,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white, // Warna tombol
                        ),
                        child: Image.asset(
                          "assets/images/upload_gambar.png",
                          width: 26,
                          height: 26,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                CustomButton(
                  text: "Simpan",
                  backgroundColor: const Color.fromRGBO(1, 188, 177, 1),
                  onPressed: () {},
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ));
  }
}
