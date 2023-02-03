import 'package:bmi_calculator/pages/widgets/reusable_input_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                        _heightValue.toStringAsFixed(2),
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
          GestureDetector(
            child: Container(
              alignment: Alignment.center,
              color: bottomContainerColor,
              height: bottomContainerHeight,
              margin: const EdgeInsets.only(top: 10),
              child: const Text(
                "Get Results",
                style: numberTextStyle,
              ),
            ),
            onTap: () => Navigator.pushNamed(context, "results"),
          )
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final void Function() onPressed;

  const RoundIconButton(
      {super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6,
      constraints: const BoxConstraints.tightFor(width: 50, height: 50),
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
