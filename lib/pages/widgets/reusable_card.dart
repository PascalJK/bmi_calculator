import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Widget? cardChild;
  final Color color;

  const ReusableCard({super.key, this.cardChild, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      child: cardChild,
    );
  }
}
