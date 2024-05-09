import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sikode/utils/elevatedbutton.dart';
import 'package:sikode/utils/textformfield.dart';
import 'package:sikode/views/login_page.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  late TextEditingController namaLengkapController;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    namaLengkapController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    namaLengkapController.dispose();
    emailController.dispose();
    super.dispose();
  }

  Future<void> _showPickerDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Pilih Sumber Gambar"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: const Text("Kamera"),
                  onTap: () async {
                    Navigator.of(context).pop();
                    final pickedFile = await ImagePicker().pickImage(
                      source: ImageSource.camera,
                    );
                    if (pickedFile != null) {
                      setState(() {
                      });
                    }
                  },
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  child: const Text("Galeri"),
                  onTap: () async {
                    Navigator.of(context).pop();
                    final pickedFile = await ImagePicker().pickImage(
                      source: ImageSource.gallery,
                    );
                    if (pickedFile != null) {
                      setState(() {
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Profil",
          style: TextStyle(
            fontFamily: "Montserrat",
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: const Color.fromRGBO(1, 188, 177, 1),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Stack(
                children: [
                  const Center(
                    child: Image(
                      image: AssetImage('assets/images/profil.png'),
                      width: 219,
                    ),
                  ),
                  Positioned(
                    top: 165,
                    left: 215,
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(1, 188, 177, 1),
                      ),
                      padding: const EdgeInsets.all(3),
                      child: IconButton(
                          onPressed: () async {
                            await _showPickerDialog();
                          },
                          icon: const Icon(
                            Icons.camera_alt_outlined,
                          )),
                      // child: IconButton(
                      //   Icons.camera_alt_outlined,
                      //   color: Colors.white,
                      //   size: 30,
                      // ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: const Text(
                  "Nama Lengkap",
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
                controller: namaLengkapController,
                hintText: "Pengurus Desa",
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: const Text(
                  "Alamat Email",
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
                controller: namaLengkapController,
                hintText: "sidomulyo10@gmail.com",
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                text: "Simpan",
                backgroundColor: const Color.fromRGBO(1, 193, 139, 1),
                onPressed: () {},
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                text: "Logout",
                backgroundColor: const Color.fromRGBO(220, 0, 0, 1),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
