import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sikode/services/auth_service.dart';
import 'package:sikode/utils/card_home.dart';
import 'package:sikode/viewmodels/homepage_viewmodel.dart';
import 'package:sikode/views/warga/jadwal_olahraga_warga.dart';
import 'package:sikode/views/warga/jadwal_ronda_warga.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePageWarga extends StatefulWidget {
  const HomePageWarga({super.key});

  @override
  State<HomePageWarga> createState() => _HomePageWargaState();
}

class _HomePageWargaState extends State<HomePageWarga> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) =>
          HomePageViewModel(Provider.of<AuthService>(context, listen: false)),
      child: Consumer<HomePageViewModel>(
        builder: (context, homeViewModel, child) {
          return Scaffold(
            body: homeViewModel.isLoading
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 50),
                              color: const Color.fromRGBO(1, 188, 177, 1),
                              width: MediaQuery.of(context).size.width,
                              height: 300,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Image(
                                    image:
                                        AssetImage('assets/images/profil.png'),
                                    width: 67,
                                  ),
                                  const SizedBox(width: 20),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        Text(
                                          'Hai, ${homeViewModel.userName}',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                        const SizedBox(height: 10),
                                        const Text(
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
                                  imagePath:
                                      'assets/images/informasi_vaksinasi.png',
                                  title: 'Vaksinasi',
                                  padding: EdgeInsets.only(left: 30),
                                ),
                                CustomCard(
                                  imagePath:
                                      'assets/images/informasi_bansos.png',
                                  title: 'Bansos',
                                  padding: EdgeInsets.only(right: 30),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: TableCalendar(
                                focusedDay: DateTime.now(),
                                firstDay: DateTime.now(),
                                lastDay: DateTime.now(),
                              ),
                            ),
                            const SizedBox(height: 30),
                          ],
                        ),
                        Positioned(
                          top: 250,
                          left: MediaQuery.of(context).size.width * 0.5 - 150,
                          child: Container(
                            height: 126,
                            width: 300,
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
                                          builder: (context) =>
                                              const JadwalRondaWarga()),
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
                                      )
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const JadwalOlahragaWarga()),
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
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
