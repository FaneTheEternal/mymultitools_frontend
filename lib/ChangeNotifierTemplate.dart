import 'dart:collection';

import 'package:flutter/material.dart';

mixin ChangeNotifierListMixin<T> on ChangeNotifier {
  final List<T> _list = [];

  final canAdd = false;
  final canRemove = false;
  final canAt = false;

  bool beInit = false;

  int get count => _list.length;

  initValue() {
    beInit = true;
  }

  add(T t) {
    if (!canAdd) throw Exception('Cant use add method');
    if (!beInit) initValue();
    _list.add(t);
    notifyListeners();
  }

  remove(int index) {
    if (!canRemove) throw Exception('Cant use remove method');
    if (!beInit) initValue();
    _list.removeAt(index);
    notifyListeners();
  }

  T at(int index) {
    if (!canAt) throw Exception('Cant use at method');
    if (!beInit) initValue();
    return _list.elementAt(index);
  }

  UnmodifiableListView get list => UnmodifiableListView(_list);
}