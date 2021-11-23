
import 'package:flutter/material.dart';

class MenuModelProvider extends ChangeNotifier {

  int _itemSeleccionado = 0;
  double _page = 0;

  int get itemSeleccionado => _itemSeleccionado;
  double get page => _page;

  set setItemSeleccionado(int item) {
    _itemSeleccionado = item;
    notifyListeners();
  }
  set setPage(double page) {
    _page = page;
    notifyListeners();
  }

}