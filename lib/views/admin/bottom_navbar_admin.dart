import 'package:flutter/material.dart';
// import 'package:sikode/views/admin/homepage.dart';
import 'package:sikode/views/admin/homepage_admin.dart';
import 'package:sikode/views/admin/informasi_page.dart';
import 'package:sikode/views/admin/profil_page.dart';

class NavbarAdmin extends StatefulWidget {
  const NavbarAdmin({super.key});

  @override
  State<NavbarAdmin> createState() => _NavbarAdminState();
}

class _NavbarAdminState extends State<NavbarAdmin> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPageIndex,
        children: const <Widget>[
          HomePageAdmin(),
          Informasi(),
          Profil(),
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
