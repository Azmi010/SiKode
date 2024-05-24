import 'package:flutter/material.dart';
import 'package:sikode/models/informasi.dart';
import 'package:sikode/services/informasi_service.dart';

class InformasiViewModel extends ChangeNotifier {
  final InformasiService _service = InformasiService();
  List<InformasiModel> _informasiList = [];
  bool _isLoading = true;

  List<InformasiModel> get informasiList => _informasiList;
  bool get isLoading => _isLoading;

  Future<void> fetchInformasi() async {
    _isLoading = true;
    notifyListeners();

    _informasiList = await _service.fetchInformasi();
    _isLoading = false;
    notifyListeners();
  }
}
