import 'package:flutter/material.dart';

import 'constants.dart';

class ReusableBottomButton extends StatelessWidget {
  const ReusableBottomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        color: bottomContainerColor,
        height: bottomContainerHeight,
        margin: const EdgeInsets.only(top: 10),
        child: Text(
          text.toUpperCase(),
          style: largeButtonTextStyle,
        ),
      ),
    );
  }
}
