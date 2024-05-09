import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(1, 188, 177, 1),
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            width: 400,
            height: 1000,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            color: const Color.fromRGBO(1, 188, 177, 1),
            width: 400,
            height: 250,
            child: const Stack(
              children: [
                Row(
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
                              fontSize: 20
                            ),
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
                )
              ],
            ),
          ),
          Positioned(
            top: 200,
            left: 42,
            child: Container(
              width: 300,
              height: 126,
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
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.calendar_today_outlined,
                            size: 34,
                            color: Color.fromRGBO(1, 188, 177, 1),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Buat Jadwal",
                            style: TextStyle(
                              fontFamily: 'montserrat',
                            ),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/vector.png',
                            width: 35,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Info Warga",
                            style: TextStyle(
                              fontFamily: 'montserrat',
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
