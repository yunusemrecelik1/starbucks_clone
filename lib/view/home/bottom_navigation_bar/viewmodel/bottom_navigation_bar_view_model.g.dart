// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bottom_navigation_bar_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BottomNavigationBarViewModel
    on _BottomNavigationBarViewModelBase, Store {
  final _$pageIndexAtom =
      Atom(name: '_BottomNavigationBarViewModelBase.pageIndex');

  @override
  int get pageIndex {
    _$pageIndexAtom.reportRead();
    return super.pageIndex;
  }

  @override
  set pageIndex(int value) {
    _$pageIndexAtom.reportWrite(value, super.pageIndex, () {
      super.pageIndex = value;
    });
  }

  final _$_BottomNavigationBarViewModelBaseActionController =
      ActionController(name: '_BottomNavigationBarViewModelBase');

  @override
  void changeIndex(int index) {
    final _$actionInfo = _$_BottomNavigationBarViewModelBaseActionController
        .startAction(name: '_BottomNavigationBarViewModelBase.changeIndex');
    try {
      return super.changeIndex(index);
    } finally {
      _$_BottomNavigationBarViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pageIndex: ${pageIndex}
    ''';
  }
}
