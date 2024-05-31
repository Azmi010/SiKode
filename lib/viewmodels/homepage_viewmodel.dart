import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sikode/models/events.dart';
import 'package:sikode/services/auth_service.dart';

class HomePageViewModel extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final AuthService _authService;
  String? userName;
  bool isLoading = true;
  Map<DateTime, List<Event>> events = {};
  DateTime? selectedDay;

  HomePageViewModel(this._authService) {
    _loadUserName();
    _fetchEvents();
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

  Future<void> _fetchEvents() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('events').get();
    for (var doc in snapshot.docs) {
      final event = Event.fromMap(doc.data(), doc.id);
      final date = DateTime(event.date.year, event.date.month, event.date.day);
      if (events[date] != null) {
        events[date]!.add(event);
      } else {
        events[date] = [event];
      }
    }
    notifyListeners();
  }

  Future<void> addEvent(DateTime date, Event event) async {
    final eventDate = DateTime(date.year, date.month, date.day);
    if (events[eventDate] != null) {
      events[eventDate]!.add(event);
    } else {
      events[eventDate] = [event];
    }
    notifyListeners();

    await FirebaseFirestore.instance.collection('events').add(event.toMap());
  }

  List<Event> getEventsForDay(DateTime day) {
    final date = DateTime(day.year, day.month, day.day);
    return events[date] ?? [];
  }

  void selectDay(DateTime day) {
    selectedDay = day;
    notifyListeners();
  }

  void removeEvent(Event event) async {
    final date = DateTime(event.date.year, event.date.month, event.date.day);
    events[date]?.remove(event);
    notifyListeners();
    // Hapus event dari Firebase
    await _firestore.collection('events').doc(event.id).delete();
  }
}
