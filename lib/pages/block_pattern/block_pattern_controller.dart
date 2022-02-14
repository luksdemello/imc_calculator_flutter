import 'dart:async';
import 'dart:math';

import 'package:imc_calculator/pages/block_pattern/block_state.dart';

class BlockPatternController {
  final _streamController = StreamController<BlockState>.broadcast();

  Stream<BlockState> get streamOut => _streamController.stream;

  Future<void> calcImc(double weigth, double heigth) async {
    _streamController.add(BlockStateLoading());

    await Future.delayed(const Duration(seconds: 1));

    final imc = weigth / pow(heigth, 2);

    _streamController.add(BlockState(imc: imc));
  }

  void dispose() {
    _streamController.close();
  }
}
