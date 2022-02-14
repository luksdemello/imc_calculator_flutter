import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';

class ImcFormField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  const ImcFormField({
    Key? key,
    required this.label,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
      ),
      keyboardType: TextInputType.number,
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return '$label é obrigatório';
        }
        return null;
      },
      inputFormatters: [
        CurrencyTextInputFormatter(
          decimalDigits: 2,
          turnOffGrouping: true,
          symbol: '',
          locale: 'pt_br',
        )
      ],
    );
  }
}
