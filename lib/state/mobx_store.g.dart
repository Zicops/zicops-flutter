// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobx_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ZStore on _ZStore, Store {
  late final _$userDetailsModelAtom =
      Atom(name: '_ZStore.userDetailsModel', context: context);

  @override
  UserDetailsModel get userDetailsModel {
    _$userDetailsModelAtom.reportRead();
    return super.userDetailsModel;
  }

  @override
  set userDetailsModel(UserDetailsModel value) {
    _$userDetailsModelAtom.reportWrite(value, super.userDetailsModel, () {
      super.userDetailsModel = value;
    });
  }

  @override
  String toString() {
    return '''
userDetailsModel: ${userDetailsModel}
    ''';
  }
}
