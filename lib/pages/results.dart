import 'package:bmi_calculator/pages/widgets/constants.dart';
import 'package:bmi_calculator/pages/widgets/reusable_card.dart';
import 'package:flutter/material.dart';

import 'widgets/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});

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
                children: const [
                  Text("OVER-WEIGHT", style: resultTextStyle),
                  Text("26.7",
                      textAlign: TextAlign.center, style: kBMITextStyle),
                  Text(
                    "You have a higher than normal body weight. Try to exercise more.😉",
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
