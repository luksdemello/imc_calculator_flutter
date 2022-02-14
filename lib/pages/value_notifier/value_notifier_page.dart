import 'dart:math';

import 'package:flutter/material.dart';
import 'package:imc_calculator/widgets/imc_radial_gauge.dart';
import 'package:intl/intl.dart';

import '../../widgets/imc_form_field.dart';

class ValueNotifierPage extends StatefulWidget {
  const ValueNotifierPage({Key? key}) : super(key: key);

  @override
  State<ValueNotifierPage> createState() => _ValueNotifierPageState();
}

class _ValueNotifierPageState extends State<ValueNotifierPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _heigthEC = TextEditingController();

  final TextEditingController _weigthEC = TextEditingController();

  final _imc = ValueNotifier<double>(0.0);

  Future<void> _calcImc(double weigth, double heigth) async {
    _imc.value = 0.0;

    await Future.delayed(const Duration(seconds: 1));

    _imc.value = weigth / pow(heigth, 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMC Value Notifier Page'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: [
                  ValueListenableBuilder<double>(
                      valueListenable: _imc,
                      builder: (context, value, widget) {
                        return ImcRadialGauge(
                          imc: value,
                        );
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
