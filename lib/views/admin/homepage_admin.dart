import 'package:flutter/material.dart';
import 'package:sikode/utils/card_home.dart';
import 'package:sikode/views/admin/jadwal_olahraga_admin.dart';
import 'package:sikode/views/admin/jadwal_ronda_admin.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePageAdmin extends StatefulWidget {
  const HomePageAdmin({super.key});

  @override
  State<HomePageAdmin> createState() => _HomePageAdminState();
}

class _HomePageAdminState extends State<HomePageAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                  color: const Color.fromRGBO(1, 188, 177, 1),
                  width: double.infinity,
                  height: 300,
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image(
                        image: AssetImage('assets/images/profil.png'),
                        width: 67,
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              'Hai, Pengurus Desa',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Selamat datang di Aplikasi SiKode! Kami hadir untuk memudahkan Anda dalam mengelola berbagai kegiatan dan informasi penting untuk kemajuan desa',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(left: 32, top: 70),
                  child: const Text(
                    "Informasi Warga",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomCard(
                      imagePath: 'assets/images/informasi_vaksinasi.png',
                      title: 'Vaksinasi',
                      padding: EdgeInsets.only(left: 30),
                    ),
                    CustomCard(
                      imagePath: 'assets/images/informasi_bansos.png',
                      title: 'Bansos',
                      padding: EdgeInsets.only(right: 30),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TableCalendar(
                    focusedDay: DateTime.now(),
                    firstDay: DateTime.now(),
                    lastDay: DateTime.now(),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 250,
              left: 42,
              child: SizedBox(
                height: 126,
                width: 300,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(17),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const JadwalRondaAdmin()),
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/jadwal_ronda.png',
                              width: 35,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Jadwal Ronda",
                              style: TextStyle(
                                fontFamily: 'montserrat',
                              ),
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const JadwalOlahragaAdmin()),
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/jadwal_olahraga.png',
                              width: 35,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Jadwal Olahraga",
                              style: TextStyle(
                                fontFamily: 'montserrat',
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
