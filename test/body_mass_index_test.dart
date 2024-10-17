import 'package:flutter_test/flutter_test.dart';
import 'package:imc/body_mass_index.dart';

void main() {
  group('BodyMassIndex', () {
    //je groupe tous les tests qui concernent la classe BodyMassIndex

    //Test 1 : Vérifier le calcul correct de l'IMC

    test('calcule correctement l IMC pour une taille et un poids donnes ', () {
      //test est utilisé pour définir un test unitaire.
      final bmiCalculator = BodyMassIndex(height: 180, weight: 75);
      final bmi = bmiCalculator.calculateBMI();
      expect(
          bmi,
          closeTo(23.15,
              0.01)); //expect est utilisé pour vérifier que le résultat est correct. Vérifie que l'IMC est proche de 23.15 avec une petite marge d'erreur de 0.01.
    });

    //Test 2 : Gérer la taille nulle

    test('lance une exception pour une taille nulle', () {
      expect(() => BodyMassIndex(height: 0, weight: 75), throwsArgumentError);
    });

    // Test 3 : Gérer les valeurs négatives

    test('lance une exception pour des valeurs négatives', () {
      expect(
          () => BodyMassIndex(height: -170, weight: -70), throwsArgumentError);
    });
  });
}

















// import 'package:flutter_test/flutter_test.dart';
// import 'package:imc/body_mass_index.dart';

// void main() {
//   group('BodyMassIndex', () {
//     //je groupe tous les tests qui concernent la classe BodyMassIndex

//     //Test 1 : Vérifier le calcul correct de l'IMC

//     test('calcule correctement l IMC pour une taille et un poids donnes ', () {
//       //test est utilisé pour définir un test unitaire.
//       final bmiCalculator = BodyMassIndex(height: 180, weight: 75);
//       final bmi = bmiCalculator.calculateBMI();
//       expect(
//           bmi,
//           closeTo(23.15,
//               0.01)); //expect est utilisé pour vérifier que le résultat est correct. Vérifie que l'IMC est proche de 23.15 avec une petite marge d'erreur de 0.01.
//     });

//     //Test 2 : Gérer la taille nulle

//     test('gère la taille nulle correctement', () {
//       final bmiCalculator = BodyMassIndex(height: 0, weight: 75);
//       final bmi = bmiCalculator.calculateBMI();
//       expect(bmi.isInfinite,
//           true); // Vérifie que l'IMC est infini car diviser par zéro donne un résultat infini en mathématiques.
//     });

//     // Test 3 : Gérer les valeurs négatives

//     test('gère les valeurs négatives', () {
//       final bmiCalculator = BodyMassIndex(height: -170, weight: -70);
//       final bmi = bmiCalculator.calculateBMI();
//       expect(bmi < 0, true); // Vérifie que l'IMC est NaN (Not a Number)
//     });
//   });
// }









// import 'package:flutter_test/flutter_test.dart';
// import 'package:imc/body_mass_index.dart';

// void main() {
//   group('BodyMassIndex', () {
//     //je groupe tous les tests qui concernent la classe BodyMassIndex

//     //Test 1 : Vérifier le calcul correct de l'IMC

//     test('calcule correctement l IMC pour une taille et un poids donnes ', () {
//       //test est utilisé pour définir un test unitaire.
//       final bmiCalculator = BodyMassIndex(height: 180, weight: 75);
//       final bmi = bmiCalculator.calculateBMI();
//       expect(
//           bmi,
//           closeTo(23.15,
//               0.01)); //expect est utilisé pour vérifier que le résultat est correct. Vérifie que l'IMC est proche de 23.15 avec une petite marge d'erreur de 0.01.
//     });

//     //Test 2 : Gérer la taille nulle

//     test('gère la taille nulle correctement', () {
//       final bmiCalculator = BodyMassIndex(height: 0, weight: 75);
//       final bmi = bmiCalculator.calculateBMI();
//       expect(bmi.isInfinite,
//           true); // Vérifie que l'IMC est infini car diviser par zéro donne un résultat infini en mathématiques.
//     });

//     // Test 3 : Gérer les valeurs négatives

//     test('gère les valeurs négatives', () {
//       final bmiCalculator = BodyMassIndex(height: -170, weight: -70);
//       expect(
//           () => bmiCalculator.calculateBMI(),
//           throwsA(
//               isA<Exception>())); // Vérifie que l'IMC est NaN (Not a Number)
//     });
//   });
// }
