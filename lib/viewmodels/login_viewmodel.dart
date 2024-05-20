import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sikode/services/auth_service.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService();
  bool _isLoading = false;
  String? _role;

  bool get isLoading => _isLoading;
  String? get role => _role;

  Future<bool> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    User? user = await _authService.signInWithEmailAndPassword(email, password);

    if (user != null) {
      _role = await _authService.getUserRole(user.uid);
    }

    _isLoading = false;
    notifyListeners();

    return user != null;
  }
}
