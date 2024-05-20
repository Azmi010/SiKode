import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sikode/firebase_options.dart';
import 'package:sikode/views/auth/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
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