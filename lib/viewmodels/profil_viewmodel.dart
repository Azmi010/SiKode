import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sikode/services/auth_service.dart';
import 'package:sikode/views/auth/login_page.dart';

class ProfileViewModel extends ChangeNotifier {
  final AuthService authService;
  late TextEditingController namaLengkapController;
  late TextEditingController emailController;
  String? imageUrl;
  File? selectedImage;
  bool isLoading = true;

  ProfileViewModel({required this.authService}) {
    namaLengkapController = TextEditingController();
    emailController = TextEditingController();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    final userProfile = await authService.getUserProfile();
    if (userProfile != null) {
      namaLengkapController.text = userProfile['nama'] ?? '';
      emailController.text = userProfile['email'] ?? '';
      imageUrl = userProfile['imageUrl'];
    }
    isLoading = false;
    notifyListeners();
  }

  void setSelectedImage(File image) {
    selectedImage = image;
    notifyListeners();
  }

  Future<void> updateUserProfile() async {
    if (selectedImage != null) {
      imageUrl = await authService.uploadImage(selectedImage!);
      selectedImage = null;
    }
    await authService.updateUserProfile(
      namaLengkapController.text,
      emailController.text,
      imageUrl,
    );
    notifyListeners();
  }

  Future<void> signOut(BuildContext context) async {
    await authService.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
  }
}
