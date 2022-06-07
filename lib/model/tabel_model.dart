// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Table {
  int? number;
  String? position;
  String? type;
  DateTime? postedDate;
  DateTime? lastDateApply;
  DateTime? closeDate;
  String? status;
  String? action;
  Table({
    this.number,
    this.position,
    this.type,
    this.postedDate,
    this.lastDateApply,
    this.closeDate,
    this.status,
    this.action,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'number': number,
      'position': position,
      'type': type,
      'postedDate': postedDate?.millisecondsSinceEpoch,
      'lastDateApply': lastDateApply?.millisecondsSinceEpoch,
      'closeDate': closeDate?.millisecondsSinceEpoch,
      'status': status,
      'action': action,
    };
  }

  factory Table.fromMap(Map<String, dynamic> map) {
    return Table(
      number: map['number'] != null ? map['number'] as int : null,
      position: map['position'] != null ? map['position'] as String : null,
      type: map['type'] != null ? map['type'] as String : null,
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
      action: map['action'] != null ? map['action'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Table.fromJson(String source) =>
      Table.fromMap(json.decode(source) as Map<String, dynamic>);
}
