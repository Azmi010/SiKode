import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sikode/models/jadwal_olahraga.dart';

class JadwalOlahragaViewModel extends ChangeNotifier {
  final List<JadwalOlahragaModel> _jadwalOlahragaList = [];

  List<JadwalOlahragaModel> get jadwalOlahragaList => _jadwalOlahragaList;

  Future<void> fetchJadwalOlahraga() async {
    try {
      final snapshot = await FirebaseFirestore.instance.collection('jadwal_olahraga').get();
      _jadwalOlahragaList.clear();
      for (var doc in snapshot.docs) {
        _jadwalOlahragaList.add(JadwalOlahragaModel.fromFirestore(doc.data(), doc.id));
      }
      notifyListeners();
    } catch (e) {
      print('Error fetching informasi: $e');
    }
  }
}