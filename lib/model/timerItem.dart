import 'dart:convert';

// this file contains the implementation of the each Timer item

class TimerItem {
  final String id;
  final String startTime;
  final String endTime;
  final String description;

  TimerItem(this.id, this.startTime, this.endTime, this.description);
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'startTime': startTime,
      'endTime': endTime,
      'description': description,
    };
  }

  factory TimerItem.fromMap(Map<String, dynamic> map) {
    return TimerItem(
      map['id'],
      map['startTime'],
      map['endTime'],
      map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TimerItem.fromJson(String source) => TimerItem.fromMap(json.decode(source));
}
