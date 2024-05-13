import 'package:flutter/material.dart';
import 'package:sikode/views/warga/bottom_navbar_warga.dart';

class JadwalRondaWarga extends StatefulWidget {
  const JadwalRondaWarga({super.key});

  @override
  State<JadwalRondaWarga> createState() => _JadwalRondaWargaState();
}

class _JadwalRondaWargaState extends State<JadwalRondaWarga> {
  final List<String> _daysOfWeek = [
    'Minggu',
    'Senin',
    'Selasa',
    'Rabu',
    'Kamis',
    'Jumat',
    'Sabtu'
  ];

  final List<String> _sampleData = [
    'Data 1',
    'Data 2',
    'Data 3',
    'Data 4',
    'Data 5',
    'Data 6',
  ];

  int _selectedRW = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NavbarWarga(initialIndex: 0),
              ),
            );
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
        ),
        title: const Text(
          'Jadwal Ronda',
          style: TextStyle(
            fontFamily: 'Montserrat',
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
                child: DropdownButton<int>(
                  value: _selectedRW,
                  onChanged: (value) {
                    setState(() {
                      _selectedRW = value!;
                    });
                  },
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                  ),
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  underline: const SizedBox(),
                  items: List.generate(
                    7,
                    (index) => DropdownMenuItem<int>(
                      value: index + 1,
                      child: Text('RW 0${index + 1}'),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 7,
                itemBuilder: (context, index) {
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
                              _daysOfWeek[index],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      subtitle: _buildSubtitle(_sampleData),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubtitle(List<String> data) {
    final List<Widget> rows = [];
    final int numberOfRows = (data.length / 3).ceil();

    for (int i = 0; i < numberOfRows; i++) {
      final int startIndex = i * 3;
      final int endIndex = startIndex + 3;
      final List<String> rowItems = data.sublist(
          startIndex, endIndex > data.length ? data.length : endIndex);
      final List<Widget> rowWidgets = rowItems
          .map(
            (item) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                item,
                style: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
          .toList();
      rows.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: rowWidgets,
        ),
      );
    }

    return Column(
      children: rows,
    );
  }
}
