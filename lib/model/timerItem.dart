import 'dart:convert';

// this file contains the implementation of the each Timer item

class TimerItem {
  final String id;
  final String name;
  final String start;
  final String end;
  final String isoDate;
  TimerItem({
    required this.id,
    required this.name,
    required this.start,
    required this.end,
    required this.isoDate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'start': start,
      'end': end,
      'isoDate': isoDate,
    };
  }

  factory TimerItem.fromMap(Map<String, dynamic> map) {
    return TimerItem(
      id: map['id'],
      name: map['name'],
      start: map['start'],
      end: map['end'],
      isoDate: map['isoDate'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TimerItem.fromJson(String source) =>
      TimerItem.fromMap(json.decode(source));
}
