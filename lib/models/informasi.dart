class InformasiModel {
  final String id;
  final String judul;
  final String deskripsi;
  final String imageUrl;

  InformasiModel({
    required this.id,
    required this.judul,
    required this.deskripsi,
    required this.imageUrl,
  });

  factory InformasiModel.fromFirestore(Map<String, dynamic> data, String id) {
    return InformasiModel(
      id: id,
      judul: data['judul'],
      deskripsi: data['deskripsi'],
      imageUrl: data['imageUrl'],
    );
  }
}
