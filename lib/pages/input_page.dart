import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'widgets/icon_content.dart';
import 'widgets/reusable_card.dart';

const double bottomContainerHeight = 80.0;
const Color bottomContainerColor = Colors.purple;
const Color activeCardColor = Color(0xFF1d1e33);
const Color inActiveCardColor = Color(0xFF111328);

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inActiveCardColor;
  Color femaleCardColor = inActiveCardColor;

  void updateCardColor(String gender) {
    if (gender == "m") {
      if (maleCardColor == inActiveCardColor) {
        maleCardColor = activeCardColor;
      } else {
        maleCardColor = inActiveCardColor;
      }
      femaleCardColor = inActiveCardColor;
    } else {
      if (femaleCardColor == inActiveCardColor) {
        femaleCardColor = activeCardColor;
      } else {
        femaleCardColor = inActiveCardColor;
      }
      maleCardColor = inActiveCardColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => updateCardColor("m")),
                    child: ReusableCard(
                      cardChild: const IconContent(
                        iconData: FontAwesomeIcons.mars,
                        text: "Male",
                      ),
                      color: maleCardColor,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => updateCardColor("f")),
                    child: ReusableCard(
                      cardChild: const IconContent(
                        iconData: FontAwesomeIcons.venus,
                        text: "Female",
                      ),
                      color: femaleCardColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
            child: ReusableCard(
              color: activeCardColor,
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
