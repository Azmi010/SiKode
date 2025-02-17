import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sikode/utils/elevatedbutton.dart';
import 'package:sikode/utils/textformfield.dart';
import 'package:sikode/viewmodels/register_viewmodel.dart';
import 'package:sikode/views/auth/login_page.dart';
import 'package:sikode/views/warga/bottom_navbar_warga.dart';

class Daftar extends StatefulWidget {
  const Daftar({super.key});

  @override
  State<Daftar> createState() => _DaftarState();
}

class _DaftarState extends State<Daftar> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController namaLengkapController;
  late TextEditingController emailController;
  late TextEditingController kataSandiController;
  late TextEditingController konfirmasiKataSandiController;

  @override
  void initState() {
    super.initState();
    namaLengkapController = TextEditingController();
    emailController = TextEditingController();
    kataSandiController = TextEditingController();
    konfirmasiKataSandiController = TextEditingController();
  }

  @override
  void dispose() {
    namaLengkapController.dispose();
    emailController.dispose();
    kataSandiController.dispose();
    konfirmasiKataSandiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final registerViewModel = Provider.of<RegisterViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pendaftaran",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromRGBO(1, 188, 177, 1),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "Pendaftaran",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomTextField(
                  controller: namaLengkapController,
                  hintText: "Nama Lengkap",
                  label: "Nama Lengkap",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Data harus diisi';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: emailController,
                  hintText: "Email",
                  label: "Email",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Data harus diisi';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: kataSandiController,
                  hintText: "Kata Sandi",
                  label: "Kata Sandi",
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Data harus diisi';
                    }
                    return null;
                  },
                  maxLines: 1,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: konfirmasiKataSandiController,
                  hintText: "Konfirmasi Kata Sandi",
                  label: "Konfirmasi Kata Sandi",
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Data harus diisi';
                    }
                    return null;
                  },
                  maxLines: 1,
                ),
                const SizedBox(
                  height: 30,
                ),
                if (registerViewModel.isLoading)
                  const CircularProgressIndicator()
                else
                  CustomButton(
                    text: "Daftar",
                    backgroundColor: const Color.fromRGBO(1, 193, 139, 1),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        bool success = await registerViewModel.register(
                          emailController.text,
                          kataSandiController.text,
                          namaLengkapController.text,
                          'warga',
                        );
                        if (success) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const NavbarWarga(initialIndex: 0),
                              ),
                              (route) => false);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Gagal Melakukan Pendaftaran!",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              backgroundColor: Colors.black,
                            ),
                          );
                        }
                      }
                    },
                  ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Sudah memiliki akun?",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomButton(
                  text: "Masuk",
                  backgroundColor: const Color.fromRGBO(160, 130, 201, 1),
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
      ),
    );
  }
}
