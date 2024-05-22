import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImagePickerDialog extends StatelessWidget {
  const ImagePickerDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Pilih Sumber Gambar"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: const Text("Galeri"),
            onTap: () async {
              final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
              if (pickedFile != null) {
                Navigator.of(context).pop(File(pickedFile.path));
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text("Kamera"),
            onTap: () async {
              final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
              if (pickedFile != null) {
                Navigator.of(context).pop(File(pickedFile.path));
              }
            },
          ),
        ],
      ),
    );
  }
}
