import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sikode/services/auth_service.dart';
import 'package:sikode/viewmodels/homepage_viewmodel.dart';
import 'package:sikode/viewmodels/informasi_viewmodel.dart';
import 'package:sikode/utils/card_home.dart';
import 'package:sikode/views/warga/detail_informasi_warga.dart';
import 'package:sikode/views/warga/jadwal_olahraga_warga.dart';
import 'package:sikode/views/warga/jadwal_ronda_warga.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePageWarga extends StatelessWidget {
  const HomePageWarga({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomePageViewModel(
              Provider.of<AuthService>(context, listen: false)),
        ),
        ChangeNotifierProvider(
          create: (_) => InformasiViewModel()..fetchInformasi(),
        ),
      ],
      child: Consumer2<HomePageViewModel, InformasiViewModel>(
        builder: (context, homeViewModel, informasiViewModel, child) {
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
                                        const SizedBox(height: 30),
                                        Text(
                                          'Hai, ${homeViewModel.userName}',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
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
                            const SizedBox(height: 20),
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
                            Container(
                              height: 180,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    informasiViewModel.informasiList.length,
                                itemBuilder: (context, index) {
                                  final informasi =
                                      informasiViewModel.informasiList[index];
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              DetailInformasiWarga(
                                                  judul: informasi.judul,
                                                  deskripsi:
                                                      informasi.deskripsi,
                                                  imageUrl: informasi.imageUrl,
                                                  docId: informasi.id),
                                        ),
                                      );
                                    },
                                    child: CustomCard(
                                      imagePath: informasi.imageUrl,
                                      title: informasi.judul,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: TableCalendar(
                                headerStyle: const HeaderStyle(
                                  formatButtonVisible: false,
                                  titleCentered: true,
                                ),
                                firstDay: DateTime.utc(1990),
                                lastDay: DateTime.utc(2030),
                                focusedDay:
                                    homeViewModel.selectedDay ?? DateTime.now(),
                                selectedDayPredicate: (day) {
                                  return isSameDay(
                                      homeViewModel.selectedDay, day);
                                },
                                onDaySelected: (selectedDay, focusedDay) {
                                  homeViewModel.selectDay(selectedDay);
                                  _onDaySelected(
                                      context, selectedDay, homeViewModel);
                                },
                                eventLoader: (day) {
                                  return homeViewModel.getEventsForDay(day);
                                },
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
                                      const SizedBox(height: 10),
                                      const Text("Jadwal Ronda"),
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
                                      const SizedBox(height: 10),
                                      const Text("Jadwal Olahraga"),
                                    ],
                                  ),
                                ),
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

  void _onDaySelected(BuildContext context, DateTime selectedDay,
      HomePageViewModel homeViewModel) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    const Icon(Icons.calendar_today, size: 20),
                    const SizedBox(width: 10),
                    Text(
                      '${selectedDay.day} ${_monthName(selectedDay.month)}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ...homeViewModel.getEventsForDay(selectedDay).map((event) {
                  return ListTile(
                    leading: const Icon(
                      Icons.calendar_today,
                      size: 20,
                      color: Color.fromRGBO(1, 188, 177, 1),
                    ),
                    contentPadding: EdgeInsets.zero,
                    title: Text(event.title),
                  );
                }),
                const SizedBox(height: 10),
              ],
            ),
          ),
        );
      },
    );
  }

  String _monthName(int month) {
    switch (month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return '';
    }
  }
}
