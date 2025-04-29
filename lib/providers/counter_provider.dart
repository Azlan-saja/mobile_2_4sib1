import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _nilaiCounter = 0;

  void tambahkan() {
    _nilaiCounter++;
    notifyListeners();
  }

  void kurangkan() {
    _nilaiCounter--;
    notifyListeners();
  }

  int get hasil => _nilaiCounter;
}
