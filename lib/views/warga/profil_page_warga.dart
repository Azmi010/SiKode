import 'package:flutter/material.dart';
import 'package:sikode/utils/elevatedbutton.dart';
import 'package:sikode/utils/imagepicker.dart';
import 'package:sikode/utils/textformfield.dart';
import 'package:sikode/views/auth/login_page.dart';

class ProfilWarga extends StatefulWidget {
  const ProfilWarga({super.key});

  @override
  State<ProfilWarga> createState() => _ProfilWargaState();
}

class _ProfilWargaState extends State<ProfilWarga> {
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
                          await _showPickerDialog(context);
                        },
                        icon: const Icon(
                          Icons.camera_alt_outlined,
                        ),
                      ),
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
                hintText: "Masyarakat",
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
                hintText: "warga01@gmail.com",
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
