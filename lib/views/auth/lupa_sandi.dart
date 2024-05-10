import 'package:flutter/material.dart';
import 'package:sikode/utils/elevatedbutton.dart';
import 'package:sikode/utils/textformfield.dart';
import 'package:sikode/views/auth/login_page.dart';

class LupaSandi extends StatefulWidget {
  const LupaSandi({super.key});

  @override
  State<LupaSandi> createState() => _LupaSandiState();
}

class _LupaSandiState extends State<LupaSandi> {
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Lupa Kata Sandi",
          style: TextStyle(
            fontFamily: "Montserrat",
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(1, 188, 177, 1),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Ubah Kata Sandi",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: const Text(
                "Masukkan Alamat Email",
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              controller: emailController,
              hintText: "Alamat Email",
            ),
            const SizedBox(
              height: 50,
            ),
            CustomButton(
              text: "Kirim Kode OTP",
              backgroundColor: const Color.fromRGBO(1, 193, 139, 1),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const OTP()));
              },
            )
          ],
        ),
      ),
    );
  }
}

class OTP extends StatefulWidget {
  const OTP({super.key});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  late TextEditingController otpController;

  @override
  void initState() {
    super.initState();
    otpController = TextEditingController();
  }

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Lupa Kata Sandi",
          style: TextStyle(
            fontFamily: "Montserrat",
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(1, 188, 177, 1),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Ubah Kata Sandi",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: const Text(
                "Masukkan Kode OTP",
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              controller: otpController,
              hintText: "Kode OTP",
            ),
            const SizedBox(
              height: 50,
            ),
            CustomButton(
              text: "Verifikasi",
              backgroundColor: const Color.fromRGBO(1, 193, 139, 1),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const UbahSandi()));
              },
            )
          ],
        ),
      ),
    );
  }
}

class UbahSandi extends StatefulWidget {
  const UbahSandi({super.key});

  @override
  State<UbahSandi> createState() => _UbahSandiState();
}

class _UbahSandiState extends State<UbahSandi> {
  late TextEditingController kataSandiBaruController;
  late TextEditingController konfirmasiKataSandiBaruController;

  @override
  void initState() {
    super.initState();
    kataSandiBaruController = TextEditingController();
    konfirmasiKataSandiBaruController = TextEditingController();
  }

  @override
  void dispose() {
    kataSandiBaruController.dispose();
    konfirmasiKataSandiBaruController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Lupa Kata Sandi",
          style: TextStyle(
            fontFamily: "Montserrat",
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(1, 188, 177, 1),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Ubah Kata Sandi",
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: const Text(
                  "Masukkan Kata Sandi Baru",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                controller: kataSandiBaruController,
                hintText: "Kata Sandi Baru",
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: const Text(
                  "Konfirmasi Kata Sandi Baru",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                controller: kataSandiBaruController,
                hintText: "Konfirmasi Kata Sandi Baru",
              ),
              const SizedBox(
                height: 50,
              ),
              CustomButton(
                text: "Simpan",
                backgroundColor: const Color.fromRGBO(1, 193, 139, 1),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const LoginPage()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
