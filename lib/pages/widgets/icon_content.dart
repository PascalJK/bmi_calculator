import 'package:flutter/material.dart';

const double _iconSize = 80.0;
const _labelTextStyle = TextStyle(fontSize: 18, color: Color(0xFF8D8e98));

class IconContent extends StatelessWidget {
  const IconContent({
    super.key,
    required this.text,
    required this.iconData,
  });

  final String text;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: _iconSize,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: _labelTextStyle,
        ),
      ],
    );
  }
}
