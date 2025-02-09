import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
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

  Future<String> uploadImageToStorage(File imageFile, String imageName) async {
    try {
      final Reference storageReference = FirebaseStorage.instance.ref('jadwal_olahraga_thumbnail').child(imageName);
      final UploadTask uploadTask = storageReference.putFile(imageFile);
      final TaskSnapshot taskSnapshot = await uploadTask;
      final String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('Error uploading image: $e');
      throw e;
    }
  }

  Future<void> addJadwalOlahraga(String docId, String nama, DateTime waktu, String lokasi, String imageUrl) async {
    try {
      await FirebaseFirestore.instance.collection('jadwal_olahraga').doc(docId).set({
        'nama': nama,
        'waktu': waktu,
        'lokasi': lokasi,
        'imageUrl': imageUrl,
      });

      await FirebaseFirestore.instance.collection('events').doc(docId).set({
        'title': nama,
        'date': waktu,
      });

      await fetchJadwalOlahraga();
    } catch (e) {
      print('Error adding informasi: $e');
    }
  }

   Future<void> updateJadwalOlahraga(String docId, String nama, DateTime waktu, String lokasi, String imageUrl) async {
    try {
      await FirebaseFirestore.instance.collection('jadwal_olahraga').doc(docId).update({
        'nama': nama,
        'waktu': waktu,
        'lokasi': lokasi,
        'imageUrl': imageUrl,
      });

      await FirebaseFirestore.instance.collection('events').doc(docId).update({
        'title': nama,
        'date': waktu,
      });
      
      await fetchJadwalOlahraga();
    } catch (e) {
      print('Error updating informasi: $e');
    }
  }
}