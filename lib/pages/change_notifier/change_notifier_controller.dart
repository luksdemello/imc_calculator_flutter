import 'dart:math';

import 'package:flutter/widgets.dart';

class ChangeNotifierController extends ChangeNotifier {
  double imc = 0.0;

  Future<void> calcImc(double weigth, double heigth) async {
    imc = 0.0;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));

    imc = weigth / pow(heigth, 2);
    notifyListeners();
  }
}
