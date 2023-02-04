import 'dart:math';

class CalculatorBrain {
  final double height;
  final int weight;

  static Map bmiData = {};

  CalculatorBrain(this.height, this.weight);

  void calculateBMI() {
    var bmi = weight / pow(height / 100, 2);
    if (bmi >= 25) {
      bmiData = {
        "0": "Overweight",
        "1": bmi.toStringAsFixed(1),
        "2": "You have a higher than normal body weight."
      };
    } else if (bmi >= 18.5) {
      bmiData = {
        "0": "Normal",
        "1": bmi.toStringAsFixed(1),
        "2": "You have a normal body weight."
      };
    } else {
      bmiData = {
        "0": "Underweight",
        "1": bmi.toStringAsFixed(1),
        "2": "You have a lower than normal body weight."
      };
    }
  }

  static Map getBmiData() => bmiData;
}
