import 'dart:math';

import 'package:flutter/material.dart';
import 'package:imc_calculator/widgets/imc_radial_gauge.dart';
import 'package:intl/intl.dart';

import '../../widgets/imc_form_field.dart';

class SetStatePage extends StatefulWidget {
  const SetStatePage({Key? key}) : super(key: key);

  @override
  State<SetStatePage> createState() => _SetStatePageState();
}

class _SetStatePageState extends State<SetStatePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _heigthEC = TextEditingController();

  final TextEditingController _weigthEC = TextEditingController();

  double _imc = 0.0;

  Future<void> _calcImc(double weigth, double heigth) async {
    setState(() {
      _imc = 0.0;
    });

    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      _imc = weigth / pow(heigth, 2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMC Set State Page'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: [
                  ImcRadialGauge(
                    imc: _imc,
                  ),
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

                        _calcImc(weigth, heigth);
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
