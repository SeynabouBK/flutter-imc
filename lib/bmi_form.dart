import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imc/body_mass_index.dart';
//import 'package:syncfusion_flutter_gauges/gauges.dart';

class BMIForm extends StatefulWidget {
  final Function(double bmi, String category) onCalculate;

  const BMIForm({super.key, required this.onCalculate});

  @override
  State<BMIForm> createState() => _BMIFormState();
}

class _BMIFormState extends State<BMIForm> {
  final TextEditingController _heightController =
      TextEditingController(); // Contrôleur pour la taille
  final TextEditingController _weightController =
      TextEditingController(); // Contrôleur pour le poids

  String? _heightError; // Message d'erreur pour la taille
  String? _weightError; // Message d'erreur pour le poids

  void _submitForm() {
    final height = double.tryParse(_heightController.text);
    final weight = double.tryParse(_weightController.text);

    setState(() {
      _heightError = height == null || height <= 0
          ? 'Veuillez entrer une taille valide (supérieure à 0) et pas vide.'
          : null;
      _weightError = weight == null || weight <= 0
          ? 'Veuillez entrer un poids valide (supérieur à 0) et pas vide.'
          : null;
    });

    if (height != null && weight != null && height > 0 && weight > 0) {
      final bmiCalculator = BodyMassIndex(height: height, weight: weight);
      final bmi = bmiCalculator.calculateBMI();
      final category = _getBMICategory(bmi);
      widget.onCalculate(bmi, category);
    }
  }

  String _getBMICategory(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'Normal';
    } else if (bmi >= 25 && bmi < 29.9) {
      return 'Overweight';
    } else {
      return 'Obesity';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _heightController,
          decoration: InputDecoration(
            labelText: 'Taille (cm)',
            errorText:
                _heightError, // Affiche le message d'erreur pour la taille
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [
            LengthLimitingTextInputFormatter(
                5), // Limite le nombre de caractères à 5
            FilteringTextInputFormatter
                .digitsOnly, // Autorise uniquement les chiffres
          ],
        ),
        TextField(
          controller: _weightController,
          decoration: InputDecoration(
            labelText: 'Poids (kg)',
            errorText:
                _weightError, // Affiche le message d'erreur pour le poids
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [
            LengthLimitingTextInputFormatter(
                5), // Limite le nombre de caractères à 5
            FilteringTextInputFormatter
                .digitsOnly, // Autorise uniquement les chiffres
          ],
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _submitForm,
          child: const Text('Calculer l IMC'),
        ),

        // //////////////JAUGE///////////////////////////
        // ///
        // if (_heightError == null && _weightError == null && _heightController.text.isNotEmpty &&_weightController.text.isNotEmpty)
        //   const SizedBox(height: 20),
        // if (_heightError == null &&
        //     _weightError == null &&
        //     _heightController.text.isNotEmpty &&
        //     _weightController.text.isNotEmpty)
        //   _buildIMCGauge(double.parse(_weightController.text) /
        //       (double.parse(_heightController.text) / 100) *
        //       2),
      ],
    );
  }
}
