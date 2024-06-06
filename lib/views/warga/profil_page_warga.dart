import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sikode/services/auth_service.dart';
import 'package:sikode/utils/elevatedbutton.dart';
import 'package:sikode/utils/imagepicker.dart';
import 'package:sikode/utils/popup.dart';
import 'package:sikode/utils/textformfield.dart';
import 'package:sikode/viewmodels/profil_viewmodel.dart';

class ProfilWarga extends StatelessWidget {
  const ProfilWarga({super.key});

  Future<void> _showPickerDialog(BuildContext context) async {
    final pickedImage = await showDialog<File>(
      context: context,
      builder: (BuildContext context) {
        return const ImagePickerDialog();
      },
    );
    if (pickedImage != null) {
      final profileViewModel =
          Provider.of<ProfileViewModel>(context, listen: false);
      profileViewModel.setSelectedImage(pickedImage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileViewModel(
        authService: Provider.of<AuthService>(context, listen: false),
      ),
      child: Consumer<ProfileViewModel>(
        builder: (context, profileViewModel, child) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: const Text(
                "Profil",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              backgroundColor: const Color.fromRGBO(1, 188, 177, 1),
              centerTitle: true,
            ),
            body: profileViewModel.isLoading
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          Stack(
                            children: [
                              Center(
                                child: profileViewModel.selectedImage != null
                                    ? CircleAvatar(
                                        backgroundImage: FileImage(
                                            profileViewModel.selectedImage!),
                                        radius: 100,
                                      )
                                    : profileViewModel.imageUrl != null
                                        ? CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                profileViewModel.imageUrl!),
                                            radius: 100,
                                          )
                                        : const CircleAvatar(
                                            backgroundImage: AssetImage(
                                                'assets/images/profil.png'),
                                            radius: 100,
                                          ),
                              ),
                              Positioned(
                                top: 145,
                                left: 210,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromRGBO(1, 188, 177, 1),
                                  ),
                                  padding: const EdgeInsets.all(3),
                                  child: IconButton(
                                    onPressed: () async {
                                      await _showPickerDialog(context);
                                    },
                                    icon: const Icon(
                                      Icons.camera_alt_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: const Text(
                              "Nama Lengkap",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                            controller: profileViewModel.namaLengkapController,
                            textStyle: const TextStyle(
                              color: Color.fromRGBO(1, 193, 139, 1),
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: const Text(
                              "Alamat Email",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                            controller: profileViewModel.emailController,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          CustomButton(
                            text: "Simpan",
                            backgroundColor:
                                const Color.fromRGBO(1, 193, 139, 1),
                            onPressed: () async {
                              await profileViewModel.updateUserProfile();
                              showCustomDialog(
                                context,
                                icon: Icons.check_circle_outline_sharp,
                                title: "Berhasil",
                                message: "Berhasil Mengubah Profil",
                                onPressed: () {},
                              );
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          CustomButton(
                            text: "Logout",
                            backgroundColor: const Color.fromRGBO(220, 0, 0, 1),
                            onPressed: () async {
                              await profileViewModel.signOut(context);
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
