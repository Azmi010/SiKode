import 'package:cloud_firestore/cloud_firestore.dart';

class JadwalOlahragaModel {
  final String id;
  final String nama;
  final DateTime waktu;
  final String lokasi;
  final String imageUrl;

  JadwalOlahragaModel({
    required this.id,
    required this.nama,
    required this.waktu,
    required this.lokasi,
    required this.imageUrl,
  });

  factory JadwalOlahragaModel.fromFirestore(Map<String, dynamic> data, String id) {
    final waktuTimestamp = (data['waktu'] as Timestamp).toDate();
    // final formattedWaktu = '${_getDayName(waktuTimestamp.weekday)}, ${waktuTimestamp.day} ${_getMonthName(waktuTimestamp.month)}';
    
    return JadwalOlahragaModel(
      id: id,
      nama: data['nama'],
      waktu: waktuTimestamp,
      lokasi: data['lokasi'],
      imageUrl: data['imageUrl'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'nama': nama,
      'waktu': Timestamp.fromDate(waktu),
      'lokasi': lokasi,
      'imageUrl': imageUrl,
    };
  }

  String getDayName() {
    switch (waktu.weekday) {
      case 1:
        return 'Senin';
      case 2:
        return 'Selasa';
      case 3:
        return 'Rabu';
      case 4:
        return 'Kamis';
      case 5:
        return 'Jumat';
      case 6:
        return 'Sabtu';
      case 7:
        return 'Minggu';
      default:
        return '';
    }
  }

  String getMonthName() {
    switch (waktu.month) {
      case 1:
        return 'Januari';
      case 2:
        return 'Februari';
      case 3:
        return 'Maret';
      case 4:
        return 'April';
      case 5:
        return 'Mei';
      case 6:
        return 'Juni';
      case 7:
        return 'Juli';
      case 8:
        return 'Agustus';
      case 9:
        return 'September';
      case 10:
        return 'Oktober';
      case 11:
        return 'November';
      case 12:
        return 'Desember';
      default:
        return '';
    }
  }
}
