import 'dart:convert';

// this file contains the implementation of the each Timer item

class TimerItem {
  final String id;
  final String startTime;
  final String endTime;
  final String description;
  final String date;

  TimerItem(
    this.id,
    this.startTime,
    this.endTime,
    this.description,
    this.date,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'startTime': startTime,
      'endTime': endTime,
      'description': description,
      'date': date,
    };
  }

  factory TimerItem.fromMap(Map<String, dynamic> map) {
    return TimerItem(
      map['id'],
      map['startTime'],
      map['endTime'],
      map['description'],
      map['date'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TimerItem.fromJson(String source) =>
      TimerItem.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TimerItem(id: $id, startTime: $startTime, endTime: $endTime, description: $description ,date: $date)';
  }

  TimerItem copyWith({
    String? id,
    String? startTime,
    String? endTime,
    String? description,
    String? date,
  }) {
    return TimerItem(
      id ?? this.id,
      startTime ?? this.startTime,
      endTime ?? this.endTime,
      description ?? this.description,
      date ?? this.date,
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

  String getIndex(int index) {
    switch (index) {
      case 0:
        return "13-11-2022";
      case 1:
        return startTime;
      case 2:
        return endTime;
      case 3:
        return id;
      case 4:
        return ((int.parse(this.endTime) - int.parse(this.startTime)) / 100)
            .toString();
      case 5:
        return description + "....";
    }
    return '';
  }
}
