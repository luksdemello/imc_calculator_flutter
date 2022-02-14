import 'package:flutter/material.dart';
import 'package:imc_calculator/widgets/imc_gauge_range.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ImcRadialGauge extends StatelessWidget {
  final double imc;

  const ImcRadialGauge({
    Key? key,
    required this.imc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: [
        RadialAxis(
          showLabels: false,
          showAxisLine: false,
          showTicks: false,
          minimum: 12.5,
          maximum: 47.9,
          ranges: [
            ImcGaugeRange(
              startValue: 12.5,
              endValue: 18.5,
              color: Colors.yellow,
              label: 'Peso baixo',
            ),
            ImcGaugeRange(
              startValue: 18.5,
              endValue: 24.9,
              color: Colors.green,
              label: 'Peso Normal',
            ),
            ImcGaugeRange(
              startValue: 24.9,
              endValue: 29.9,
              color: Colors.orange,
              label: 'SobrePeso',
            ),
            ImcGaugeRange(
              startValue: 29.9,
              endValue: 34.9,
              color: Colors.red[400]!,
              label: 'Obesidade I',
            ),
            ImcGaugeRange(
              startValue: 34.9,
              endValue: 39.9,
              color: Colors.redAccent,
              label: 'Obesidade II',
            ),
            ImcGaugeRange(
              startValue: 39.9,
              endValue: 47.9,
              color: Colors.red[900]!,
              label: 'Obesidade III',
            )
          ],
          pointers: [
            NeedlePointer(
              value: imc,
              enableAnimation: true,
            )
          ],
        )
      ],
    );
  }
}
