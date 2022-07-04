import 'dart:convert';

import 'package:hive/hive.dart';

part 'hive_databse.g.dart';

@HiveType(typeId: 0)
class Model extends HiveObject {
  @HiveField(0)
  late String? name;
  @HiveField(1)
  late String? position;
  @HiveField(2)
  late String? type;
  @HiveField(3)
  late String? gender;
  @HiveField(4)
  late String? postedDate;
  @HiveField(5)
  late String? lastDateApply;
  @HiveField(6)
  late String? closeDate;
  @HiveField(7)
  late String? status ;

  Model({
    this.name,
    this.position,
    this.type,
    this.gender,
    this.postedDate,
    this.lastDateApply,
    this.closeDate,
    this.status,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Name': name,
      'Position': position,
      'Type': type,
      'Gender': gender,
      'PostedDate': postedDate,
      'LastDateApply': lastDateApply,
      'CloseDate': closeDate,
      'Status': status,
    };
  }

  factory Model.fromMap(Map<String, dynamic> map) {
    return Model(
      name: map['Name'],
      position: map['Position'],
      type: map['Type'],
      gender: map['Gender'],
      postedDate: map['PostedDate'] != null ? map['postedDate'] : null,
      lastDateApply: map['LastDateApply'],
      closeDate: map['CloseDate'],
      status: map['Status'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Model.fromJson(String source) =>
      Model.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Model(name: $name, position: $position, type: $type, gender: $gender, postedDate: $postedDate, lastDateApply: $lastDateApply, closeDate: $closeDate, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Model &&
        other.name == name &&
        other.position == position &&
        other.type == type &&
        other.gender == gender &&
        other.postedDate == postedDate &&
        other.lastDateApply == lastDateApply &&
        other.closeDate == closeDate &&
        other.status == status;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        position.hashCode ^
        type.hashCode ^
        gender.hashCode ^
        postedDate.hashCode ^
        lastDateApply.hashCode ^
        closeDate.hashCode ^
        status.hashCode;
  }
}
