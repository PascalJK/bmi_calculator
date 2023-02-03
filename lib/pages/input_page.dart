import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'widgets/constants.dart';
import 'widgets/icon_content.dart';
import 'widgets/reusable_card.dart';

enum Gender { male, female }

double height = 180;

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
                      text: "Male",
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
                      text: "Female",
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
                    "Height",
                    style: labelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toStringAsFixed(2),
                        style: numberTextStyle,
                      ),
                      const Text(
                        "cm",
                        style: labelTextStyle,
                      ),
                    ],
                  ),
                  Slider(
                    value: height,
                    min: minHieght,
                    max: maxHieght,
                    activeColor: activeSliderColor,
                    inactiveColor: inActiveSliderColor,
                    onChanged: (value) {
                      setState(() => height = value);
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: const [
                Expanded(child: ReusableCard(color: activeCardColor)),
                Expanded(
                  child: ReusableCard(
                    color: activeCardColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: bottomContainerColor,
            height: bottomContainerHeight,
            margin: const EdgeInsets.only(top: 10),
          )
        ],
      ),
    );
  }
}
