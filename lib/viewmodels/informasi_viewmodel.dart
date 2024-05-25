import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:sikode/models/informasi.dart';

class InformasiViewModel with ChangeNotifier {
  final List<InformasiModel> _informasiList = [];

  List<InformasiModel> get informasiList => _informasiList;

  Future<void> fetchInformasi() async {
    try {
      final snapshot = await FirebaseFirestore.instance.collection('informasi').get();
      _informasiList.clear();
      for (var doc in snapshot.docs) {
        _informasiList.add(InformasiModel.fromFirestore(doc.data(), doc.id));
      }
      notifyListeners();
    } catch (e) {
      print('Error fetching informasi: $e');
    }
  }

  Future<void> updateInformasi(String docId, String judul, String deskripsi, String imageUrl) async {
    try {
      await FirebaseFirestore.instance.collection('informasi').doc(docId).update({
        'judul': judul,
        'deskripsi': deskripsi,
        'imageUrl': imageUrl,
      });
      await fetchInformasi();
    } catch (e) {
      print('Error updating informasi: $e');
    }
  }

  Future<String> uploadImageToStorage(File imageFile, String imageName) async {
    try {
      final Reference storageReference = FirebaseStorage.instance.ref('informasi_thumbnail').child(imageName);
      final UploadTask uploadTask = storageReference.putFile(imageFile);
      final TaskSnapshot taskSnapshot = await uploadTask;
      final String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('Error uploading image: $e');
      throw e;
    }
  }

  Future<void> addInformasi(String docId, String judul, String deskripsi, String imageUrl) async {
    try {
      await FirebaseFirestore.instance.collection('informasi').doc(docId).set({
        'judul': judul,
        'deskripsi': deskripsi,
        'imageUrl': imageUrl,
      });
      await fetchInformasi();
    } catch (e) {
      print('Error adding informasi: $e');
    }
  }
}
