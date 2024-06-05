import 'package:cloud_firestore/cloud_firestore.dart';

class JadwalRondaViewModel {
  late Stream<QuerySnapshot> rwStream;

  JadwalRondaViewModel(int selectedRW) {
    rwStream = FirebaseFirestore.instance
        .collection('jadwal_ronda')
        .doc('RW 0$selectedRW')
        .collection('hari')
        .snapshots();
  }
}
