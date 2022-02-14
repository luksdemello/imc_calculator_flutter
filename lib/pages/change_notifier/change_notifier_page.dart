import 'package:flutter/material.dart';
import 'package:imc_calculator/pages/change_notifier/change_notifier_controller.dart';
import 'package:imc_calculator/widgets/imc_radial_gauge.dart';
import 'package:intl/intl.dart';

import '../../widgets/imc_form_field.dart';

class ChangeNotifierPage extends StatefulWidget {
  const ChangeNotifierPage({Key? key}) : super(key: key);

  @override
  State<ChangeNotifierPage> createState() => _ChangeNotifierPageState();
}

class _ChangeNotifierPageState extends State<ChangeNotifierPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _heigthEC = TextEditingController();

  final TextEditingController _weigthEC = TextEditingController();

  final _controller = ChangeNotifierController();

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
        title: const Text('IMC Change Notifier Page'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: [
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, widget) {
                      return ImcRadialGauge(
                        imc: _controller.imc,
                      );
                    },
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
