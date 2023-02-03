import 'package:bmi_calculator/pages/widgets/constants.dart';
import 'package:flutter/material.dart';

import 'pages/input_page.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF0a0e21),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0a0e21),
          centerTitle: true,
        ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.red,
          accentColor: Colors.purple,
        ),
        sliderTheme: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.white,
            inactiveTrackColor: inActiveSliderColor,
            overlayColor: sliderThumbColor.withAlpha(0x29),
            thumbColor: sliderThumbColor,
            thumbShape: const RoundSliderThumbShape(
                enabledThumbRadius: 15.0, pressedElevation: 20.0)),
        iconTheme: const IconThemeData(color: Colors.white70),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      home: const InputPage(),
    );
  }
}
