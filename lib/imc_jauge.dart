import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class IMCJauge extends StatelessWidget {
  final double bmi;

  const IMCJauge({super.key, required this.bmi});

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
          minimum: 10,
          maximum: 40,
          ranges: <GaugeRange>[
            GaugeRange(
              startValue: 10,
              endValue: 18.5,
              color: Colors.blue,
              label: 'Underweight',
            ),
            GaugeRange(
              startValue: 18.5,
              endValue: 24.9,
              color: Colors.green,
              label: 'Normal',
            ),
            GaugeRange(
              startValue: 25,
              endValue: 29.9,
              color: Colors.orange,
              label: 'Overweight',
            ),
            GaugeRange(
              startValue: 30,
              endValue: 40,
              color: Colors.red,
              label: 'Obesity',
            ),
          ],
          pointers: <GaugePointer>[
            NeedlePointer(value: bmi),
          ],
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
              widget: Text(
                bmi.toStringAsFixed(2),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              angle: 90,
              positionFactor: 0.5,
            ),
          ],
        ),
      ],
    );
  }
}
