import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sikode/models/informasi.dart';

class InformasiService {
  final CollectionReference _informasiCollection =
      FirebaseFirestore.instance.collection('informasi');

  Future<List<InformasiModel>> fetchInformasi() async {
    QuerySnapshot snapshot = await _informasiCollection.get();
    return snapshot.docs
        .map((doc) => InformasiModel.fromFirestore(doc.data() as Map<String, dynamic>, doc.id))
        .toList();
  }
}
