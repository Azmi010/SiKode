import 'package:flutter/material.dart';
import 'package:sikode/views/auth/login_page.dart';

void main() {
  runApp(const SiKode());
}

class SiKode extends StatelessWidget {
  const SiKode({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Montserrat'),
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}