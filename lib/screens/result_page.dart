import 'file:///G:/FlutterProjects/bmi-calculator-flutter/lib/components/CustomContainer.dart';
import 'package:bmi_calculator/components/calculate_Button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Constants.dart';


class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  const ResultPage({@required this.bmiResult,@required this.resultText,@required this.interpretation});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.all(15),
              width: double.infinity,
              child: Text(
                "Your Result",
                style: KTitleTextStyle,
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: CustomContainer(
              color: Color(KActiveCardColor),
              containerContent: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: KResultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: KBMITextStyle,
                  ),
                  Text(interpretation,style: KAdviceTextStyle,textAlign: TextAlign.center,)
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: CalculateButton(buttonText: "RECALCULATE",onPress: (){Navigator.pop(context);},),
          )
        ],
      ),
    );
  }
}
