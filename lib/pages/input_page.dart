import 'package:flutter/material.dart';

const Color activeCardColor = Color(0xFF1d1e33);
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
              children: [
                _reusableCardWidget(),
                _reusableCardWidget(),
              ],
            ),
          ),
          _reusableCardWidget(),
          Expanded(
            child: Row(
              children: [
                _reusableCardWidget(color: Colors.black12),
                _reusableCardWidget(),
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

  Expanded _reusableCardWidget({Color color = activeCardColor}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
