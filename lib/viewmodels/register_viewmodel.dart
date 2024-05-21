import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sikode/services/auth_service.dart';

class RegisterViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService();
  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<bool> register(
      String email, String password, String name, String role) async {
    _isLoading = true;
    notifyListeners();

    User? user = await _authService.registerWithEmailAndPassword(
        email, password, name, role);

    if (user != null) {
      _errorMessage = null;
    } else {
      _errorMessage = 'Pendaftaran gagal. Coba lagi.';
    }

    _isLoading = false;
    notifyListeners();

    return user != null;
  }
}