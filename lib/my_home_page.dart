import 'package:flutter/material.dart';
import 'package:imc/bmi_form.dart';
import 'imc_jauge.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required String title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double? _bmi; // Variable pour stocker l'IMC
  String? _bmiCategory; // Variable pour stocker la catégorie de l'IMC

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculateur d IMC',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              BMIForm(
                onCalculate: (bmi, category) {
                  setState(() {
                    _bmi = bmi;
                    _bmiCategory = category;
                  });
                },
              ),
              const SizedBox(height: 20),
              if (_bmi != null)
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    children: [
                      Text(
                        'Votre IMC est: ${_bmi!.toStringAsFixed(2)}',
                        style: const TextStyle(fontSize: 24),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Catégorie: $_bmiCategory',
                        style: const TextStyle(fontSize: 24),
                      ),
                      const SizedBox(height: 20),
                      IMCJauge(bmi: _bmi!),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
