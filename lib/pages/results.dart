import 'package:bmi_calculator/core/calculator_brain.dart';
import 'package:bmi_calculator/pages/widgets/constants.dart';
import 'package:bmi_calculator/pages/widgets/reusable_card.dart';
import 'package:flutter/material.dart';

import 'widgets/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({super.key});
  final result = CalculatorBrain.getBmiData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            "Your Result",
            style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ReusableCard(
              color: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(result["0"], style: resultTextStyle),
                  Text(result["1"],
                      textAlign: TextAlign.center, style: kBMITextStyle),
                  Text(
                    result["2"],
                    textAlign: TextAlign.center,
                    style: bodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          ReusableBottomButton(
            text: "RE-Calculate",
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
