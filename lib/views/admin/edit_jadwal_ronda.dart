import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sikode/utils/elevatedbutton.dart';
import 'package:sikode/utils/popup.dart';
import 'package:sikode/utils/textformfield.dart';

class EditJadwalRonda extends StatefulWidget {
  final String title;
  final int selectedRW;
  const EditJadwalRonda(
      {super.key, required this.title, required this.selectedRW});

  @override
  State<EditJadwalRonda> createState() => _EditJadwalRondaState();
}

class _EditJadwalRondaState extends State<EditJadwalRonda> {
  int _jumlahOrang = 1;
  List<TextEditingController> _namaControllers = [];

  @override
  void initState() {
    super.initState();
    _fetchExistingData();
  }

  @override
  void dispose() {
    for (var controller in _namaControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _fetchExistingData() async {
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('jadwal_ronda')
        .doc('RW 0${widget.selectedRW}')
        .collection('hari')
        .doc(widget.title)
        .get();

    if (doc.exists) {
      List<String> existingData = List<String>.from(doc['orang']);
      setState(() {
        _jumlahOrang = existingData.length;
        _namaControllers = existingData
            .map((name) => TextEditingController(text: name))
            .toList();
      });
    } else {
      setState(() {
        _namaControllers = [TextEditingController()];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hari ${widget.title}',
          style: const TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        backgroundColor: const Color.fromRGBO(1, 188, 177, 1),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Pilih Jumlah Orang',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                border: Border.all(
                    color: const Color.fromRGBO(169, 169, 169, 1), width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButton<int>(
                isExpanded: true,
                value: _jumlahOrang,
                onChanged: (value) {
                  setState(() {
                    _jumlahOrang = value!;
                    _updateCustomTextFields();
                  });
                },
                style: const TextStyle(
                  color: Color.fromRGBO(1, 193, 139, 1),
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
                    child: Text('${index + 1} Orang'),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _namaControllers.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      CustomTextField(
                        controller: _namaControllers[index],
                        hintText: 'Masukkan Nama',
                      ),
                      const SizedBox(height: 30),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              text: 'Simpan',
              backgroundColor: const Color.fromRGBO(1, 193, 139, 1),
              onPressed: _saveData,
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }

  void _updateCustomTextFields() {
    if (_jumlahOrang > _namaControllers.length) {
      for (int i = _namaControllers.length; i < _jumlahOrang; i++) {
        _namaControllers.add(
          TextEditingController(),
        );
      }
    } else if (_jumlahOrang < _namaControllers.length) {
      _namaControllers.removeRange(_jumlahOrang, _namaControllers.length);
    }
  }

  void _saveData() {
    List<String> orangList =
        _namaControllers.map((controller) => controller.text).toList();

    FirebaseFirestore.instance
        .collection('jadwal_ronda')
        .doc('RW 0${widget.selectedRW}')
        .collection('hari')
        .doc(widget.title)
        .update({'orang': orangList});

    showCustomDialog(context,
        icon: Icons.check_circle_outline_sharp,
        title: "Berhasil",
        message: "Berhasil Menambahkan Data", onPressed: () {
      Navigator.of(context).pop();
    });
  }
}
