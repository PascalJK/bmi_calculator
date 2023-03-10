import 'package:bmi_calculator/core/calculator_brain.dart';
import 'package:bmi_calculator/pages/widgets/reusable_input_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'widgets/bottom_button.dart';
import 'widgets/constants.dart';
import 'widgets/icon_content.dart';
import 'widgets/reusable_card.dart';

enum Gender { male, female }

double _heightValue = 180;
int _weightValue = 60;
int _ageValue = 18;

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;

  void setSelectedGender(Gender genderType) => selectedGender = genderType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onTapped: () =>
                        setState(() => setSelectedGender(Gender.male)),
                    cardChild: const IconContent(
                      iconData: FontAwesomeIcons.mars,
                      text: "MALE",
                    ),
                    color: selectedGender == Gender.male
                        ? activeCardColor
                        : inActiveCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onTapped: () =>
                        setState(() => setSelectedGender(Gender.female)),
                    cardChild: const IconContent(
                      iconData: FontAwesomeIcons.venus,
                      text: "FEMALE",
                    ),
                    color: selectedGender == Gender.female
                        ? activeCardColor
                        : inActiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "HEIGHT",
                    style: labelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        _heightValue.toStringAsFixed(1),
                        style: numberTextStyle,
                      ),
                      const Text(
                        "cm",
                        style: labelTextStyle,
                      ),
                    ],
                  ),
                  Slider(
                    value: _heightValue,
                    min: minHieght,
                    max: maxHieght,
                    onChanged: (value) => setState(() => _heightValue = value),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                ReusableInputCard(
                  text: "Weight",
                  value: _weightValue,
                  onMinusPressed: () => setState(() => _weightValue--),
                  onPlusPressed: () => setState(() => _weightValue++),
                ),
                ReusableInputCard(
                  text: "Age",
                  value: _ageValue,
                  onMinusPressed: () => setState(() => _ageValue--),
                  onPlusPressed: () => setState(() => _ageValue++),
                ),
              ],
            ),
          ),
          ReusableBottomButton(
            text: "Calculate",
            onPressed: () {
              var calc = CalculatorBrain(_heightValue, _weightValue);
              calc.calculateBMI();
              Navigator.pushNamed(context, "results");
            },
          )
        ],
      ),
    );
  }
}
