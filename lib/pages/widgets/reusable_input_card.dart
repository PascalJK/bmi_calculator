import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';
import 'reusable_card.dart';
import 'round_icon_button.dart';

class ReusableInputCard extends StatelessWidget {
  const ReusableInputCard(
      {super.key,
      required this.text,
      required this.value,
      required this.onPlusPressed,
      required this.onMinusPressed});

  final String text;
  final int value;
  final VoidCallback onMinusPressed;
  final VoidCallback onPlusPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ReusableCard(
        cardChild:
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            text.toUpperCase(),
            style: labelTextStyle,
          ),
          Text(
            value.toString(),
            style: numberTextStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundIconButton(
                icon: FontAwesomeIcons.minus,
                onPressed: onMinusPressed,
              ),
              const SizedBox(width: 10),
              RoundIconButton(
                icon: FontAwesomeIcons.plus,
                onPressed: onPlusPressed,
              ),
            ],
          )
        ]),
        color: activeCardColor,
      ),
    );
  }
}
