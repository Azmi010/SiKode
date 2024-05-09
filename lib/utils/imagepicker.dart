import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerDialog extends StatelessWidget {
  const ImagePickerDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Pilih Sumber Gambar"),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            GestureDetector(
              child: const Text("Kamera"),
              onTap: () async {
                Navigator.of(context).pop();
                final pickedFile = await ImagePicker().pickImage(
                  source: ImageSource.camera,
                );
                if (pickedFile != null) {
                  
                }
              },
            ),
            const SizedBox(height: 15),
            GestureDetector(
              child: const Text("Galeri"),
              onTap: () async {
                Navigator.of(context).pop();
                final pickedFile = await ImagePicker().pickImage(
                  source: ImageSource.gallery,
                );
                if (pickedFile != null) {

                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
