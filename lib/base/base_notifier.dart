import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';

abstract class BaseNotifier<T> extends ChangeNotifier {
  BaseNotifier(T value) {
    this._value = value;
  }
/// constructor khoi tao

  T _value;
  /// bien

  T get value => _value;
  /// ham get value

/// ham set value
  set value(T value) {
    if (_value != value) {
      _value = value;
      notifyListeners();
    }
  }

/// method abstrct dc import tu thu vien provider va 
/// tra ve kieu du lieu SingleChildWidget
  SingleChildWidget provider();
}
