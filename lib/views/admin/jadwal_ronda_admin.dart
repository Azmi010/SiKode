import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sikode/viewmodels/jadwal_ronda_viewmodel.dart';
import 'package:sikode/views/admin/bottom_navbar_admin.dart';
import 'package:sikode/views/admin/edit_jadwal_ronda.dart';

class JadwalRondaAdmin extends StatefulWidget {
  const JadwalRondaAdmin({super.key});

  @override
  State<JadwalRondaAdmin> createState() => _JadwalRondaAdminState();
}

class _JadwalRondaAdminState extends State<JadwalRondaAdmin> {
  final List<String> _daysOfWeek = [
    'Minggu',
    'Senin',
    'Selasa',
    'Rabu',
    'Kamis',
    'Jumat',
    'Sabtu'
  ];

  int _selectedRW = 1;
  late JadwalRondaViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = JadwalRondaViewModel(_selectedRW);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NavbarAdmin(initialIndex: 0),
              ),
            );
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
        ),
        title: const Text(
          'Jadwal Ronda',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        backgroundColor: const Color.fromRGBO(1, 188, 177, 1),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: const EdgeInsets.only(top: 30),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('jadwal_ronda')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Text("Loading...");
                    }
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }
                    final List<DropdownMenuItem<int>> dropdownItems =
                        snapshot.data!.docs.map((doc) {
                      final String rwNumber = doc.id.split(' ')[1];
                      return DropdownMenuItem<int>(
                        value: int.parse(rwNumber),
                        child: Text('RW $rwNumber'),
                      );
                    }).toList();

                    return DropdownButton<int>(
                      value: _selectedRW,
                      onChanged: (value) {
                        setState(() {
                          _selectedRW = value!;
                          _viewModel = JadwalRondaViewModel(_selectedRW);
                        });
                      },
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      underline: const SizedBox(),
                      items: dropdownItems,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _viewModel.rwStream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text("Loading...");
                  }
                  if (!snapshot.hasData) {
                    return const Text('Data tidak tersedia');
                  }
                  final List<QueryDocumentSnapshot> docs = snapshot.data!.docs;
                  docs.sort((a, b) => _daysOfWeek
                      .indexOf(a.id)
                      .compareTo(_daysOfWeek.indexOf(b.id)));

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: docs.length,
                    itemBuilder: (context, index) {
                      final Map<String, dynamic> hariData =
                          docs[index].data() as Map<String, dynamic>;
                      final String hari = docs[index].id;
                      final int dayIndex = _daysOfWeek.indexOf(hari);
                      if (dayIndex != -1) {
                        return Card(
                          elevation: 2,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          color: Colors.white,
                          child: ListTile(
                            title: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    hari,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.edit_square),
                                  color: const Color.fromRGBO(1, 188, 177, 1),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => EditJadwalRonda(
                                          title: hari,
                                          selectedRW: _selectedRW,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                            subtitle: _buildSubtitle(hariData),
                          ),
                        );
                      } else {
                        return const Text('Hari tidak ditemukan');
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubtitle(Map<String, dynamic> data) {
    final List<Widget> items = [];
    final List<dynamic>? orangList = data['orang'] as List<dynamic>?;

    if (orangList != null && orangList.isNotEmpty) {
      for (final orang in orangList) {
        items.add(
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Text('- $orang'),
          ),
        );
      }
    } else {
      items.add(const Text('Tidak ada data orang yang bertugas'));
    }

    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: items,
    );
  }
}
