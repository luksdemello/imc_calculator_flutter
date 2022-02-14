import 'package:flutter/material.dart';

import 'package:imc_calculator/widgets/imc_radial_gauge.dart';
import 'package:intl/intl.dart';

import '../../widgets/imc_form_field.dart';
import 'bloc_pattern_controller.dart';
import 'bloc_state.dart';

class BlocPatternPage extends StatefulWidget {
  const BlocPatternPage({Key? key}) : super(key: key);

  @override
  State<BlocPatternPage> createState() => _BlocPatternPageState();
}

class _BlocPatternPageState extends State<BlocPatternPage> {
  final _controller = BlocPatternController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _heigthEC = TextEditingController();

  final TextEditingController _weigthEC = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    _heigthEC.dispose();
    _weigthEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMC Block Pattern Page'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: [
                  StreamBuilder<BlocState>(
                      stream: _controller.streamOut,
                      initialData: BlocState(imc: 0.0),
                      builder: (context, snapshot) {
                        var imc = snapshot.data?.imc ?? 0.0;

                        return ImcRadialGauge(
                          imc: imc,
                        );
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  StreamBuilder<BlocState>(
                      stream: _controller.streamOut,
                      builder: (context, snapshot) {
                        final dataValue = snapshot.data;

                        if (dataValue is BlocStateLoading) {
                          return const CircularProgressIndicator();
                        }

                        return const SizedBox.shrink();
                      }),
                  ImcFormField(
                    controller: _weigthEC,
                    label: 'Peso',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ImcFormField(
                    controller: _heigthEC,
                    label: 'Altura',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    child: const Text('Calcular IMC'),
                    onPressed: () {
                      final formValid =
                          _formKey.currentState?.validate() ?? false;

                      if (formValid) {
                        final formatter = NumberFormat.simpleCurrency(
                          decimalDigits: 2,
                          locale: 'pt_br',
                        );
                        final weigth =
                            formatter.parse(_weigthEC.text) as double;
                        final double heigth =
                            formatter.parse(_heigthEC.text) as double;

                        _controller.calcImc(weigth, heigth);
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
