import "package:flutter/material.dart";
import "package:sikode/views/admin/edit_jadwal_olahraga.dart";
import "package:sikode/views/admin/tambah_jadwal_olahraga.dart";

class JadwalOlahragaAdmin extends StatefulWidget {
  const JadwalOlahragaAdmin({super.key});

  @override
  State<JadwalOlahragaAdmin> createState() => _JadwalOlahragaAdminState();
}

class _JadwalOlahragaAdminState extends State<JadwalOlahragaAdmin> {
  @override
  Widget build(BuildContext context) {
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
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Lari Bersama",
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
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
                                  child: Image.asset(
                                    "assets/images/Lari Bersama.jpeg",
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
                                          const SizedBox(
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.calendar_today_outlined,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(
                                                  width: 14,
                                                ),
                                                Text(
                                                  "Minggu, 5 Mei 2024",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'Montserrat',
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
                                                      const EditJadwalOlahraga(),
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
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.location_on_outlined,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 14,
                                          ),
                                          Text(
                                            "Lapangan Sidomulyo",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'Montserrat',
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
