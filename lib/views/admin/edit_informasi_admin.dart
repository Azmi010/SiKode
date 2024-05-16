import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sikode/utils/elevatedbutton.dart';
import 'package:sikode/utils/imagepicker.dart';
import 'package:sikode/utils/textformfield.dart';

class EditInformasiAdmin extends StatefulWidget {
  const EditInformasiAdmin({super.key});

  @override
  State<EditInformasiAdmin> createState() => _EditInformasiAdminState();
}

class _EditInformasiAdminState extends State<EditInformasiAdmin> {
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
            "Edit Vaksinasi Covid-19",
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w600),
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
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: deskripsicontroller,
                hintText:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              ),
              const SizedBox(height: 40),
              Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Opacity(
                      opacity: 0.3,
                      child: Image.asset(
                        "assets/images/informasi_vaksinasi.png",
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
                onPressed: () {
                  // Simpan action
                },
              )
            ],
          ),
        ));
  }
}
