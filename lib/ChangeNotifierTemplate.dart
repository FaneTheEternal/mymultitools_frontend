import 'dart:collection';

import 'package:flutter/material.dart';

mixin ChangeNotifierListMixin<T> on ChangeNotifier {
  final List<T> _list = [];

  final canAdd = false;
  final canRemove = false;
  final canAt = false;

  bool beInit = false;

  int get count => _list.length;

  init() => _initValue();

  initValue() {return null;}

  _initValue() {
    beInit = true;
    final List<T> init = initValue() ?? [];
    for (T i in init) {
      _list.add(i);
    }
  }

  add(T t) {
    if (!canAdd) throw FlutterError('Cant use add method');
    if (!beInit) _initValue();
    _list.add(t);
    notifyListeners();
  }

  remove(int index) {
    if (!canRemove) throw FlutterError('Cant use remove method');
    if (!beInit) _initValue();
    _list.removeAt(index);
    notifyListeners();
  }

  T at(int index) {
    if (!canAt) throw FlutterError('Cant use at method');
    if (!beInit) _initValue();
    return _list.elementAt(index);
  }

  UnmodifiableListView get list => UnmodifiableListView(_list);
}