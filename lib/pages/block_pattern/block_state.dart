class BlockState {
  final double imc;

  BlockState({required this.imc});
}

class BlockStateLoading extends BlockState {
  BlockStateLoading() : super(imc: 0.0);
}
