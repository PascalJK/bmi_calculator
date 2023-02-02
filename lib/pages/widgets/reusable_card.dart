import 'package:flutter/material.dart';

const Color activeCardColor = Color(0xFF1d1e33);

class ReusableCard extends StatelessWidget {
  final Widget? cardChild;
  final Color color;

  const ReusableCard({super.key, this.cardChild, this.color = activeCardColor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        child: cardChild,
      ),
    );
  }
}
