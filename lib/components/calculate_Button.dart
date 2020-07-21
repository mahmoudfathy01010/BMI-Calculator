import 'package:flutter/material.dart';

import 'package:bmi_calculator/Constants.dart';
class CalculateButton extends StatelessWidget {
  final String buttonText;
  final Function onPress;

  const CalculateButton({this.buttonText, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        color: Color(KPinkColor),
        child: Center(
            child: Text(
              buttonText,
              style: KCalculateButtomStyle,
            )),
        width: double.infinity,
      ),
    );
  }
}