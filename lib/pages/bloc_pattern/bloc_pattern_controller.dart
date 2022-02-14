import 'dart:async';
import 'dart:math';

import 'bloc_state.dart';

class BlocPatternController {
  final _streamController = StreamController<BlocState>.broadcast();

  Stream<BlocState> get streamOut => _streamController.stream;

  Future<void> calcImc(double weigth, double heigth) async {
    _streamController.add(BlocStateLoading());

    await Future.delayed(const Duration(seconds: 1));

    final imc = weigth / pow(heigth, 2);

    _streamController.add(BlocState(imc: imc));
  }

  void dispose() {
    _streamController.close();
  }
}
