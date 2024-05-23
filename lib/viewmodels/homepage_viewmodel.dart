import 'package:flutter/material.dart';
import 'package:sikode/services/auth_service.dart';

class HomePageViewModel extends ChangeNotifier {
  final AuthService _authService;
  String? userName;
  bool isLoading = true;

  HomePageViewModel(this._authService) {
    _loadUserName();
  }

  Future<void> _loadUserName() async {
    final userProfile = await _authService.getUserProfile();
    userName = userProfile?['nama'] ?? 'Pengurus Desa';
    isLoading = false;
    notifyListeners();
  }

  void updateUserName(String newName) {
    userName = newName;
    notifyListeners();
  }
}