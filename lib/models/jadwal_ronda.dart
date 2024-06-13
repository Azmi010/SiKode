class Jadwal {
  final String hari;
  final List<String> orang;

  Jadwal({required this.hari, required this.orang});

  factory Jadwal.fromFirestore(Map<String, dynamic> data) {
    return Jadwal(
      hari: data['hari'] ?? '',
      orang: List<String>.from(data['orang'] ?? []),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'hari': hari,
      'orang': orang,
    };
  }
}