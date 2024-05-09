import 'package:flutter/material.dart';
import 'package:sikode/views/homepage.dart';
import 'package:sikode/views/informasi_page.dart';
import 'package:sikode/views/profil_page.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPageIndex,
        children: const <Widget>[
          HomePage(),
          Informasi(),
          Profil(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(1, 188, 177, 1),
        currentIndex: currentPageIndex,
        onTap: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: 34,
              color: Colors.white,
            ),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/informasi.png',
              width: 35,
            ),
            label: 'Informasi',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 34,
              color: Colors.white,
            ),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
