class BodyMassIndex {
  final double height; // Taille en cm
  final double weight; // Poids en kg

  BodyMassIndex({required this.height, required this.weight}) {
    if (height <= 0) {
      throw ArgumentError('La taille doit être supérieure à 0.');
    }
    if (weight <= 0) {
      throw ArgumentError('Le poids doit être supérieur à 0.');
    }
  }

  double calculateBMI() {
    // Méthode pour calculer l'IMC
    final heightEnMetres = height / 100; // Conversion de la taille en mètres
    if (heightEnMetres == 0) {
      throw ArgumentError(
          'La taille ne peut pas être zéro pour le calcul de l IMC.');
    }
    return weight / (heightEnMetres * heightEnMetres); // Calcul de l'IMC
  }
}







// class BodyMassIndex {
//   final double height; // Taille en cm
//   final double weight; // Poids en kg

//   BodyMassIndex({required this.height, required this.weight});

//   double calculateBMI() {
//     // Méthode pour calculer l'IMC
//     final heightEnMetres = height / 100; // Conversion de la taille en mètres

//     if (heightEnMetres <= 0 || weight <= 0) {
//       throw Exception('height and/or weight should be > 0');
//     }

//     return weight / (heightEnMetres * heightEnMetres); // Calcul de l'IMC
//   }
// }
