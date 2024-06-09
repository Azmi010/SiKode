import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sikode/viewmodels/jadwal_olahraga_viewmodel.dart';

class JadwalOlahragaWarga extends StatelessWidget {
  const JadwalOlahragaWarga({super.key});

  @override
  Widget build(BuildContext context) {
    final jadwalOlahragaViewModel =
        Provider.of<JadwalOlahragaViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Jadwal Olahraga",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(1, 188, 177, 1),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: jadwalOlahragaViewModel.jadwalOlahragaList.length,
                itemBuilder: (context, index) {
                  final jadwalOlahraga =
                      jadwalOlahragaViewModel.jadwalOlahragaList[index];
                  final formattedWaktu =
                      '${jadwalOlahraga.getDayName()}, ${jadwalOlahraga.waktu.day} ${jadwalOlahraga.getMonthName()} ${jadwalOlahraga.waktu.year}';
                  return Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        jadwalOlahraga.nama,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 375,
                          height: 287,
                          child: Card(
                            color: const Color.fromRGBO(1, 188, 177, 1),
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(15),
                                  ),
                                  child: AspectRatio(
                                    aspectRatio: 16 / 9,
                                    child: Image.network(
                                      jadwalOlahraga.imageUrl,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.calendar_today_outlined,
                                            color: Colors.white,
                                          ),
                                          const SizedBox(
                                            width: 14,
                                          ),
                                          Text(
                                            formattedWaktu,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.location_on_outlined,
                                            color: Colors.white,
                                          ),
                                          const SizedBox(
                                            width: 14,
                                          ),
                                          Text(
                                            jadwalOlahraga.lokasi,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
