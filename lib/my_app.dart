import 'package:flutter/material.dart';

import 'my_home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IMC',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        // Personnalisation des textes, titres et boutons
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
              fontSize: 16.0, color: Colors.black87), //textes principaux
          titleLarge: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.pinkAccent), //titre
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple, // Couleur de fond du bouton
            foregroundColor: Colors.white, // Couleur du texte du bouton
          ),
        ),
      ),
      home: const MyHomePage(title: 'Calcul de IMC'),
    );
  }
}
