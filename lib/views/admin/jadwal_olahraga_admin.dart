import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:sikode/viewmodels/jadwal_olahraga_viewmodel.dart";
import "package:sikode/views/admin/edit_jadwal_olahraga.dart";
import "package:sikode/views/admin/tambah_jadwal_olahraga.dart";

class JadwalOlahragaAdmin extends StatelessWidget {
  const JadwalOlahragaAdmin({super.key});

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
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
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
                                  child: Image.network(
                                    jadwalOlahraga.imageUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
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
                                          IconButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      EditJadwalOlahraga(
                                                          judul: jadwalOlahraga
                                                              .nama,
                                                          waktu: jadwalOlahraga
                                                              .waktu
                                                              .toString(),
                                                          lokasi: jadwalOlahraga
                                                              .lokasi,
                                                          imageUrl:
                                                              jadwalOlahraga
                                                                  .imageUrl,
                                                          docId: jadwalOlahraga
                                                              .id),
                                                ),
                                              );
                                            },
                                            icon: const Icon(
                                              Icons.edit_square,
                                              color: Colors.white,
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
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TambahJadwalOlahraga(),
                      ),
                    );
                  }
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(1, 188, 177, 1), // Warna tombol
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white, // Warna ikon di dalam tombol
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
