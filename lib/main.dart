import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sikode/firebase_options.dart';
import 'package:sikode/services/auth_service.dart';
import 'package:sikode/viewmodels/informasi_viewmodel.dart';
import 'package:sikode/viewmodels/login_viewmodel.dart';
import 'package:sikode/viewmodels/register_viewmodel.dart';
import 'package:sikode/views/auth/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => LoginViewModel()),
      ChangeNotifierProvider(create: (_) => RegisterViewModel()),
      ChangeNotifierProvider(create: (_) => InformasiViewModel()),
      Provider(create: (_) => AuthService()),
      Provider<AuthService>(
        create: (_) => AuthService(),
      ),
    ], child: const SiKode()),
  );
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
