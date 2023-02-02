import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'widgets/icon_content.dart';
import 'widgets/reusable_card.dart';

const double bottomContainerHeight = 80.0;
const Color bottomContainerColor = Colors.purple;

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
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
              children: const [
                ReusableCard(
                  cardChild: IconContent(
                    iconData: FontAwesomeIcons.mars,
                    text: "Male",
                  ),
                ),
                ReusableCard(
                  cardChild: IconContent(
                    iconData: FontAwesomeIcons.venus,
                    text: "Female",
                  ),
                ),
              ],
            ),
          ),
          const ReusableCard(),
          Expanded(
            child: Row(
              children: const [
                ReusableCard(color: Colors.black12),
                ReusableCard(),
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
