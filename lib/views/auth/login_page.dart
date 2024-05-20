import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sikode/viewmodels/login_viewmodel.dart';
import 'package:sikode/utils/elevatedbutton.dart';
import 'package:sikode/utils/textformfield.dart';
import 'package:sikode/views/admin/bottom_navbar_admin.dart';
import 'package:sikode/views/auth/lupa_sandi.dart';
import 'package:sikode/views/auth/register.dart';
import 'package:sikode/views/warga/bottom_navbar_warga.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController emailController;
  late TextEditingController kataSandiController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    kataSandiController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    kataSandiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginViewModel = Provider.of<LoginViewModel>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 100),
                  child: const Image(
                    image: AssetImage('assets/images/logo.png'),
                    width: 130,
                  ),
                ),
                const Text(
                  'SiKode',
                  style: TextStyle(
                    fontFamily: 'NerkoOne',
                    color: Color.fromRGBO(1, 188, 177, 1),
                    fontSize: 40,
                  ),
                ),
                const SizedBox(
                  height: 60,
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
                  height: 10,
                ),
                Container(
                  alignment: Alignment.topRight,
                  margin: const EdgeInsets.only(top: 5),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LupaSandi()));
                    },
                    child: const Text(
                      'Lupa kata sandi?',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                if (loginViewModel.isLoading)
                  const CircularProgressIndicator()
                else
                  CustomButton(
                    text: "Masuk",
                    backgroundColor: const Color.fromRGBO(1, 193, 139, 1),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        bool success = await loginViewModel.login(
                            emailController.text, kataSandiController.text);
                        if (success) {
                          if (loginViewModel.role == 'admin') {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const NavbarAdmin(
                                          initialIndex: 0,
                                        )),
                                (route) => false);
                          } else if (loginViewModel.role == 'warga') {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const NavbarWarga(
                                          initialIndex: 0,
                                        )),
                                (route) => false);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Peran pengguna tidak dikenali.')));
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Login gagal. Cek kembali email dan kata sandi.')));
                        }
                      }
                    },
                  ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Belum memiliki akun?',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomButton(
                  text: "Daftar",
                  backgroundColor: const Color.fromRGBO(160, 130, 201, 1),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Daftar()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
