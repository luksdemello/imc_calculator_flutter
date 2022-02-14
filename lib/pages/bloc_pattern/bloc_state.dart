class BlocState {
  final double imc;

  BlocState({required this.imc});
}

class BlocStateLoading extends BlocState {
  BlocStateLoading() : super(imc: 0.0);
}
