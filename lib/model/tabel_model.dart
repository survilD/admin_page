// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Job {
  String? name;
  String? position;
  String? type;
  String? gender;
  DateTime? postedDate;
  DateTime? lastDateApply;
  DateTime? closeDate;
  String? status;
  Job({
    this.name,
    this.position,
    this.type,
    this.gender,
    this.postedDate,
    this.lastDateApply,
    this.closeDate,
    this.status,
  });

  Job copyWith({
    String? name,
    String? position,
    String? type,
    String? gender,
    DateTime? postedDate,
    DateTime? lastDateApply,
    DateTime? closeDate,
    String? status,
  }) {
    return Job(
      name: name ?? this.name,
      position: position ?? this.position,
      type: type ?? this.type,
      gender: gender ?? this.gender,
      postedDate: postedDate ?? this.postedDate,
      lastDateApply: lastDateApply ?? this.lastDateApply,
      closeDate: closeDate ?? this.closeDate,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Name': name,
      'Position': position,
      'Type': type,
      'Gender': gender,
      'PostedDate': postedDate?.millisecondsSinceEpoch,
      'LastDateApply': lastDateApply?.millisecondsSinceEpoch,
      'CloseDate': closeDate?.millisecondsSinceEpoch,
      'Status': status,
    };
  }

  factory Job.fromMap(Map<String, dynamic> map) {
    return Job(
      name: map['name'] != null ? map['name'] as String : null,
      position: map['position'] != null ? map['position'] as String : null,
      type: map['type'] != null ? map['type'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      postedDate: map['postedDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['postedDate'] as int)
          : null,
      lastDateApply: map['lastDateApply'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['lastDateApply'] as int)
          : null,
      closeDate: map['closeDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['closeDate'] as int)
          : null,
      status: map['status'] != null ? map['status'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Job.fromJson(String source) =>
      Job.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Job( name: $name, position: $position, type: $type, gender: $gender, postedDate: $postedDate, lastDateApply: $lastDateApply, closeDate: $closeDate, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Job &&
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
