// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MxTable on MxTablebase, Store {
  late final _$jobnewAtom = Atom(name: 'MxTablebase.jobnew', context: context);

  @override
  List<Map<String, dynamic>> get jobnew {
    _$jobnewAtom.reportRead();
    return super.jobnew;
  }

  @override
  set jobnew(List<Map<String, dynamic>> value) {
    _$jobnewAtom.reportWrite(value, super.jobnew, () {
      super.jobnew = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: 'MxTablebase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$getPostdataAsyncAction =
      AsyncAction('MxTablebase.getPostdata', context: context);

  @override
  Future<dynamic> getPostdata() {
    return _$getPostdataAsyncAction.run(() => super.getPostdata());
  }

  late final _$onAddAsyncAction =
      AsyncAction('MxTablebase.onAdd', context: context);

  @override
  Future<dynamic> onAdd(dynamic context, Job job) {
    return _$onAddAsyncAction.run(() => super.onAdd(context, job));
  }

  @override
  String toString() {
    return '''
jobnew: ${jobnew},
loading: ${loading}
    ''';
  }
}
