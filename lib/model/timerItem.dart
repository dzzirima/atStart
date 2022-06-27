import 'dart:convert';

// this file contains the implementation of the each Timer item

class TimerItem {
  final String id;
  final String startTime;
  final String endTime;
  final String description;

  TimerItem(
    this.id,
    this.startTime,
    this.endTime,
    this.description,
  );

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

  factory TimerItem.fromJson(String source) =>
      TimerItem.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TimerItem(id: $id, startTime: $startTime, endTime: $endTime, description: $description)';
  }

  TimerItem copyWith({
    String? id,
    String? startTime,
    String? endTime,
    String? description,
  }) {
    return TimerItem(
      id ?? this.id,
      startTime ?? this.startTime,
      endTime ?? this.endTime,
      description ?? this.description,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is TimerItem &&
      other.id == id &&
      other.startTime == startTime &&
      other.endTime == endTime &&
      other.description == description;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      startTime.hashCode ^
      endTime.hashCode ^
      description.hashCode;
  }
}
