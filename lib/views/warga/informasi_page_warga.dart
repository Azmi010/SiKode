import 'package:flutter/material.dart';

class InformasiWarga extends StatefulWidget {
  const InformasiWarga({super.key});

  @override
  State<InformasiWarga> createState() => _InformasiWargaState();
}

class _InformasiWargaState extends State<InformasiWarga> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Text(
        'Ini halaman informasi warga',
      ),
    );
  }
}
