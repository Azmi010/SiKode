import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  final String id;
  final String title;
  final DateTime date;

  Event({
    required this.id,
    required this.title,
    required this.date,
  });

  factory Event.fromMap(Map<String, dynamic> map, String id) {
    return Event(
      id: id,
      title: map['title'],
      date: (map['date'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'date': date,
    };
  }
}
