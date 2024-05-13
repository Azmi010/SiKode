import 'package:flutter/material.dart';
import 'package:sikode/views/warga/homepage_warga.dart';
import 'package:sikode/views/warga/informasi_page_warga.dart';
import 'package:sikode/views/warga/profil_page_warga.dart';

class NavbarWarga extends StatefulWidget {
  final int initialIndex;
  const NavbarWarga({super.key, required this.initialIndex});

  @override
  State<NavbarWarga> createState() => _NavbarWargaState();
}

class _NavbarWargaState extends State<NavbarWarga> {
  late int currentPageIndex;

  @override
  void initState() {
    super.initState();
    currentPageIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPageIndex,
        children: const <Widget>[
          HomePageWarga(),
          InformasiWarga(),
          ProfilWarga(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(1, 188, 177, 1),
        currentIndex: currentPageIndex,
        selectedItemColor: Colors.white,
        unselectedLabelStyle: const TextStyle(
          fontFamily: 'Montserrat',
          color: Colors.black,
        ),
        selectedLabelStyle: const TextStyle(
          fontFamily: 'Montserrat',
          color: Colors.white,
        ),
        onTap: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
              size: 30,
            ),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/informasi_unselected.png',
              width: 30,
            ),
            activeIcon: Image.asset(
              'assets/images/informasi_selected.png',
              width: 30,
            ),
            label: 'Informasi',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 30,
            ),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
