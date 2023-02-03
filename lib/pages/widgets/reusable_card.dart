import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Widget? cardChild;
  final Color color;

  // Replaced "Function" with "VoidCallback"
  // final Function onPressed; // Very Bad ❌
  // final Function? onPressed; // Bad (Unless you will make it [required]) ❌
  // final void Function()? onPressed; // Good ✅
  // final VoidCallback? onPressed; // Good ✅
  // See: https://stackoverflow.com/questions/64484113/the-argument-type-function-cant-be-assigned-to-the-parameter-type-void-funct
  final void Function()? onTapped;

  const ReusableCard(
      {super.key, this.cardChild, required this.color, this.onTapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        child: cardChild,
      ),
    );
  }
}
