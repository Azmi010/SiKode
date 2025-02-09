import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sikode/models/events.dart';
import 'package:sikode/services/auth_service.dart';
import 'package:sikode/viewmodels/homepage_viewmodel.dart';
import 'package:sikode/viewmodels/informasi_viewmodel.dart';
import 'package:sikode/utils/card_home.dart';
import 'package:sikode/views/admin/detail_informasi_admin.dart';
import 'package:sikode/views/admin/jadwal_olahraga_admin.dart';
import 'package:sikode/views/admin/jadwal_ronda_admin.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePageAdmin extends StatelessWidget {
  const HomePageAdmin({super.key});

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
                                              DetailInformasiAdmin(
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
                                              const JadwalRondaAdmin()),
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
                                              const JadwalOlahragaAdmin()),
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
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.edit,
                            color: Color.fromRGBO(1, 188, 177, 1),
                          ),
                          onPressed: () {
                            _showEditEventDialog(
                                context, selectedDay, homeViewModel, event);
                          },
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Color.fromRGBO(1, 188, 177, 1),
                          ),
                          onPressed: () async {
                            homeViewModel.removeEvent(event);
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                }),
                const SizedBox(height: 10),
                Center(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.add),
                    label: const Text('Add Event'),
                    onPressed: () {
                      Navigator.pop(context);
                      _showAddEventDialog(context, selectedDay, homeViewModel);
                    },
                  ),
                ),
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

  void _showAddEventDialog(BuildContext context, DateTime selectedDay,
      HomePageViewModel homeViewModel) {
    TextEditingController eventController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Event'),
        content: TextField(
          controller: eventController,
          decoration: const InputDecoration(hintText: 'Event Title'),
        ),
        actions: [
          TextButton(
            child: const Text('Add'),
            onPressed: () async {
              if (eventController.text.isNotEmpty) {
                final newEvent = Event(
                  title: eventController.text,
                  date: selectedDay,
                  id: '',
                );
                homeViewModel.addEvent(selectedDay, newEvent);
                Navigator.pop(context);
              }
            },
          ),
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  void _showEditEventDialog(BuildContext context, DateTime selectedDay,
      HomePageViewModel homeViewModel, Event event) {
    final titleController = TextEditingController(text: event.title);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Event'),
          content: TextField(
            controller: titleController,
            decoration: const InputDecoration(labelText: 'Event Title'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                final updatedEvent = Event(
                  id: event.id,
                  title: titleController.text,
                  date: event.date,
                );
                await homeViewModel.editEvent(updatedEvent);
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
