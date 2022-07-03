// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'drift_database.dart';

// // **************************************************************************
// // MoorGenerator
// // **************************************************************************

// // ignore_for_file: type=lint
// class ModelData extends DataClass implements Insertable<ModelData> {
//   final int id;
//   final String name;
//   final String position;
//   final String type;
//   final String gender;
//   final String postedDate;
//   final String lastDateApply;
//   final String CloseDate;
//   final String Status;
//   ModelData(
//       {required this.id,
//       required this.name,
//       required this.position,
//       required this.type,
//       required this.gender,
//       required this.postedDate,
//       required this.lastDateApply,
//       required this.CloseDate,
//       required this.Status});
//   factory ModelData.fromData(Map<String, dynamic> data, {String? prefix}) {
//     final effectivePrefix = prefix ?? '';
//     return ModelData(
//       id: const IntType()
//           .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
//       name: const StringType()
//           .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
//       position: const StringType()
//           .mapFromDatabaseResponse(data['${effectivePrefix}position'])!,
//       type: const StringType()
//           .mapFromDatabaseResponse(data['${effectivePrefix}type'])!,
//       gender: const StringType()
//           .mapFromDatabaseResponse(data['${effectivePrefix}gender'])!,
//       postedDate: const StringType()
//           .mapFromDatabaseResponse(data['${effectivePrefix}posted_date'])!,
//       lastDateApply: const StringType()
//           .mapFromDatabaseResponse(data['${effectivePrefix}last_date_apply'])!,
//       CloseDate: const StringType()
//           .mapFromDatabaseResponse(data['${effectivePrefix}close_date'])!,
//       Status: const StringType()
//           .mapFromDatabaseResponse(data['${effectivePrefix}status'])!,
//     );
//   }
//   @override
//   Map<String, Expression> toColumns(bool nullToAbsent) {
//     final map = <String, Expression>{};
//     map['id'] = Variable<int>(id);
//     map['name'] = Variable<String>(name);
//     map['position'] = Variable<String>(position);
//     map['type'] = Variable<String>(type);
//     map['gender'] = Variable<String>(gender);
//     map['posted_date'] = Variable<String>(postedDate);
//     map['last_date_apply'] = Variable<String>(lastDateApply);
//     map['close_date'] = Variable<String>(CloseDate);
//     map['status'] = Variable<String>(Status);
//     return map;
//   }

//   ModelCompanion toCompanion(bool nullToAbsent) {
//     return ModelCompanion(
//       id: Value(id),
//       name: Value(name),
//       position: Value(position),
//       type: Value(type),
//       gender: Value(gender),
//       postedDate: Value(postedDate),
//       lastDateApply: Value(lastDateApply),
//       CloseDate: Value(CloseDate),
//       Status: Value(Status),
//     );
//   }

//   factory ModelData.fromJson(Map<String, dynamic> json,
//       {ValueSerializer? serializer}) {
//     serializer ??= driftRuntimeOptions.defaultSerializer;
//     return ModelData(
//       id: serializer.fromJson<int>(json['id']),
//       name: serializer.fromJson<String>(json['name']),
//       position: serializer.fromJson<String>(json['position']),
//       type: serializer.fromJson<String>(json['type']),
//       gender: serializer.fromJson<String>(json['gender']),
//       postedDate: serializer.fromJson<String>(json['postedDate']),
//       lastDateApply: serializer.fromJson<String>(json['lastDateApply']),
//       CloseDate: serializer.fromJson<String>(json['CloseDate']),
//       Status: serializer.fromJson<String>(json['Status']),
//     );
//   }
//   @override
//   Map<String, dynamic> toJson({ValueSerializer? serializer}) {
//     serializer ??= driftRuntimeOptions.defaultSerializer;
//     return <String, dynamic>{
//       'id': serializer.toJson<int>(id),
//       'name': serializer.toJson<String>(name),
//       'position': serializer.toJson<String>(position),
//       'type': serializer.toJson<String>(type),
//       'gender': serializer.toJson<String>(gender),
//       'postedDate': serializer.toJson<String>(postedDate),
//       'lastDateApply': serializer.toJson<String>(lastDateApply),
//       'CloseDate': serializer.toJson<String>(CloseDate),
//       'Status': serializer.toJson<String>(Status),
//     };
//   }

//   ModelData copyWith(
//           {int? id,
//           String? name,
//           String? position,
//           String? type,
//           String? gender,
//           String? postedDate,
//           String? lastDateApply,
//           String? CloseDate,
//           String? Status}) =>
//       ModelData(
//         id: id ?? this.id,
//         name: name ?? this.name,
//         position: position ?? this.position,
//         type: type ?? this.type,
//         gender: gender ?? this.gender,
//         postedDate: postedDate ?? this.postedDate,
//         lastDateApply: lastDateApply ?? this.lastDateApply,
//         CloseDate: CloseDate ?? this.CloseDate,
//         Status: Status ?? this.Status,
//       );
//   @override
//   String toString() {
//     return (StringBuffer('ModelData(')
//           ..write('id: $id, ')
//           ..write('name: $name, ')
//           ..write('position: $position, ')
//           ..write('type: $type, ')
//           ..write('gender: $gender, ')
//           ..write('postedDate: $postedDate, ')
//           ..write('lastDateApply: $lastDateApply, ')
//           ..write('CloseDate: $CloseDate, ')
//           ..write('Status: $Status')
//           ..write(')'))
//         .toString();
//   }

//   @override
//   int get hashCode => Object.hash(id, name, position, type, gender, postedDate,
//       lastDateApply, CloseDate, Status);
//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       (other is ModelData &&
//           other.id == this.id &&
//           other.name == this.name &&
//           other.position == this.position &&
//           other.type == this.type &&
//           other.gender == this.gender &&
//           other.postedDate == this.postedDate &&
//           other.lastDateApply == this.lastDateApply &&
//           other.CloseDate == this.CloseDate &&
//           other.Status == this.Status);
// }

// class ModelCompanion extends UpdateCompanion<ModelData> {
//   final Value<int> id;
//   final Value<String> name;
//   final Value<String> position;
//   final Value<String> type;
//   final Value<String> gender;
//   final Value<String> postedDate;
//   final Value<String> lastDateApply;
//   final Value<String> CloseDate;
//   final Value<String> Status;
//   const ModelCompanion({
//     this.id = const Value.absent(),
//     this.name = const Value.absent(),
//     this.position = const Value.absent(),
//     this.type = const Value.absent(),
//     this.gender = const Value.absent(),
//     this.postedDate = const Value.absent(),
//     this.lastDateApply = const Value.absent(),
//     this.CloseDate = const Value.absent(),
//     this.Status = const Value.absent(),
//   });
//   ModelCompanion.insert({
//     this.id = const Value.absent(),
//     required String name,
//     required String position,
//     required String type,
//     required String gender,
//     required String postedDate,
//     required String lastDateApply,
//     required String CloseDate,
//     required String Status,
//   })  : name = Value(name),
//         position = Value(position),
//         type = Value(type),
//         gender = Value(gender),
//         postedDate = Value(postedDate),
//         lastDateApply = Value(lastDateApply),
//         CloseDate = Value(CloseDate),
//         Status = Value(Status);
//   static Insertable<ModelData> custom({
//     Expression<int>? id,
//     Expression<String>? name,
//     Expression<String>? position,
//     Expression<String>? type,
//     Expression<String>? gender,
//     Expression<String>? postedDate,
//     Expression<String>? lastDateApply,
//     Expression<String>? CloseDate,
//     Expression<String>? Status,
//   }) {
//     return RawValuesInsertable({
//       if (id != null) 'id': id,
//       if (name != null) 'name': name,
//       if (position != null) 'position': position,
//       if (type != null) 'type': type,
//       if (gender != null) 'gender': gender,
//       if (postedDate != null) 'posted_date': postedDate,
//       if (lastDateApply != null) 'last_date_apply': lastDateApply,
//       if (CloseDate != null) 'close_date': CloseDate,
//       if (Status != null) 'status': Status,
//     });
//   }

//   ModelCompanion copyWith(
//       {Value<int>? id,
//       Value<String>? name,
//       Value<String>? position,
//       Value<String>? type,
//       Value<String>? gender,
//       Value<String>? postedDate,
//       Value<String>? lastDateApply,
//       Value<String>? CloseDate,
//       Value<String>? Status}) {
//     return ModelCompanion(
//       id: id ?? this.id,
//       name: name ?? this.name,
//       position: position ?? this.position,
//       type: type ?? this.type,
//       gender: gender ?? this.gender,
//       postedDate: postedDate ?? this.postedDate,
//       lastDateApply: lastDateApply ?? this.lastDateApply,
//       CloseDate: CloseDate ?? this.CloseDate,
//       Status: Status ?? this.Status,
//     );
//   }

//   @override
//   Map<String, Expression> toColumns(bool nullToAbsent) {
//     final map = <String, Expression>{};
//     if (id.present) {
//       map['id'] = Variable<int>(id.value);
//     }
//     if (name.present) {
//       map['name'] = Variable<String>(name.value);
//     }
//     if (position.present) {
//       map['position'] = Variable<String>(position.value);
//     }
//     if (type.present) {
//       map['type'] = Variable<String>(type.value);
//     }
//     if (gender.present) {
//       map['gender'] = Variable<String>(gender.value);
//     }
//     if (postedDate.present) {
//       map['posted_date'] = Variable<String>(postedDate.value);
//     }
//     if (lastDateApply.present) {
//       map['last_date_apply'] = Variable<String>(lastDateApply.value);
//     }
//     if (CloseDate.present) {
//       map['close_date'] = Variable<String>(CloseDate.value);
//     }
//     if (Status.present) {
//       map['status'] = Variable<String>(Status.value);
//     }
//     return map;
//   }

//   @override
//   String toString() {
//     return (StringBuffer('ModelCompanion(')
//           ..write('id: $id, ')
//           ..write('name: $name, ')
//           ..write('position: $position, ')
//           ..write('type: $type, ')
//           ..write('gender: $gender, ')
//           ..write('postedDate: $postedDate, ')
//           ..write('lastDateApply: $lastDateApply, ')
//           ..write('CloseDate: $CloseDate, ')
//           ..write('Status: $Status')
//           ..write(')'))
//         .toString();
//   }
// }

// class $ModelTable extends Model with TableInfo<$ModelTable, ModelData> {
//   @override
//   final GeneratedDatabase attachedDatabase;
//   final String? _alias;
//   $ModelTable(this.attachedDatabase, [this._alias]);
//   final VerificationMeta _idMeta = const VerificationMeta('id');
//   @override
//   late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
//       'id', aliasedName, false,
//       type: const IntType(),
//       requiredDuringInsert: false,
//       defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
//   final VerificationMeta _nameMeta = const VerificationMeta('name');
//   @override
//   late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
//       'name', aliasedName, false,
//       type: const StringType(), requiredDuringInsert: true);
//   final VerificationMeta _positionMeta = const VerificationMeta('position');
//   @override
//   late final GeneratedColumn<String?> position = GeneratedColumn<String?>(
//       'position', aliasedName, false,
//       type: const StringType(), requiredDuringInsert: true);
//   final VerificationMeta _typeMeta = const VerificationMeta('type');
//   @override
//   late final GeneratedColumn<String?> type = GeneratedColumn<String?>(
//       'type', aliasedName, false,
//       type: const StringType(), requiredDuringInsert: true);
//   final VerificationMeta _genderMeta = const VerificationMeta('gender');
//   @override
//   late final GeneratedColumn<String?> gender = GeneratedColumn<String?>(
//       'gender', aliasedName, false,
//       type: const StringType(), requiredDuringInsert: true);
//   final VerificationMeta _postedDateMeta = const VerificationMeta('postedDate');
//   @override
//   late final GeneratedColumn<String?> postedDate = GeneratedColumn<String?>(
//       'posted_date', aliasedName, false,
//       type: const StringType(), requiredDuringInsert: true);
//   final VerificationMeta _lastDateApplyMeta =
//       const VerificationMeta('lastDateApply');
//   @override
//   late final GeneratedColumn<String?> lastDateApply = GeneratedColumn<String?>(
//       'last_date_apply', aliasedName, false,
//       type: const StringType(), requiredDuringInsert: true);
//   final VerificationMeta _CloseDateMeta = const VerificationMeta('CloseDate');
//   @override
//   late final GeneratedColumn<String?> CloseDate = GeneratedColumn<String?>(
//       'close_date', aliasedName, false,
//       type: const StringType(), requiredDuringInsert: true);
//   final VerificationMeta _StatusMeta = const VerificationMeta('Status');
//   @override
//   late final GeneratedColumn<String?> Status = GeneratedColumn<String?>(
//       'status', aliasedName, false,
//       type: const StringType(), requiredDuringInsert: true);
//   @override
//   List<GeneratedColumn> get $columns => [
//         id,
//         name,
//         position,
//         type,
//         gender,
//         postedDate,
//         lastDateApply,
//         CloseDate,
//         Status
//       ];
//   @override
//   String get aliasedName => _alias ?? 'model';
//   @override
//   String get actualTableName => 'model';
//   @override
//   VerificationContext validateIntegrity(Insertable<ModelData> instance,
//       {bool isInserting = false}) {
//     final context = VerificationContext();
//     final data = instance.toColumns(true);
//     if (data.containsKey('id')) {
//       context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
//     }
//     if (data.containsKey('name')) {
//       context.handle(
//           _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
//     } else if (isInserting) {
//       context.missing(_nameMeta);
//     }
//     if (data.containsKey('position')) {
//       context.handle(_positionMeta,
//           position.isAcceptableOrUnknown(data['position']!, _positionMeta));
//     } else if (isInserting) {
//       context.missing(_positionMeta);
//     }
//     if (data.containsKey('type')) {
//       context.handle(
//           _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
//     } else if (isInserting) {
//       context.missing(_typeMeta);
//     }
//     if (data.containsKey('gender')) {
//       context.handle(_genderMeta,
//           gender.isAcceptableOrUnknown(data['gender']!, _genderMeta));
//     } else if (isInserting) {
//       context.missing(_genderMeta);
//     }
//     if (data.containsKey('posted_date')) {
//       context.handle(
//           _postedDateMeta,
//           postedDate.isAcceptableOrUnknown(
//               data['posted_date']!, _postedDateMeta));
//     } else if (isInserting) {
//       context.missing(_postedDateMeta);
//     }
//     if (data.containsKey('last_date_apply')) {
//       context.handle(
//           _lastDateApplyMeta,
//           lastDateApply.isAcceptableOrUnknown(
//               data['last_date_apply']!, _lastDateApplyMeta));
//     } else if (isInserting) {
//       context.missing(_lastDateApplyMeta);
//     }
//     if (data.containsKey('close_date')) {
//       context.handle(_CloseDateMeta,
//           CloseDate.isAcceptableOrUnknown(data['close_date']!, _CloseDateMeta));
//     } else if (isInserting) {
//       context.missing(_CloseDateMeta);
//     }
//     if (data.containsKey('status')) {
//       context.handle(_StatusMeta,
//           Status.isAcceptableOrUnknown(data['status']!, _StatusMeta));
//     } else if (isInserting) {
//       context.missing(_StatusMeta);
//     }
//     return context;
//   }

//   @override
//   Set<GeneratedColumn> get $primaryKey => {id};
//   @override
//   ModelData map(Map<String, dynamic> data, {String? tablePrefix}) {
//     return ModelData.fromData(data,
//         prefix: tablePrefix != null ? '$tablePrefix.' : null);
//   }

//   @override
//   $ModelTable createAlias(String alias) {
//     return $ModelTable(attachedDatabase, alias);
//   }
// }

// abstract class _$AppDatabse extends GeneratedDatabase {
//   _$AppDatabse(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
//   late final $ModelTable model = $ModelTable(this);
//   @override
//   Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
//   @override
//   List<DatabaseSchemaEntity> get allSchemaEntities => [model];
// }
