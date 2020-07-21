import 'package:bmi_calculator/Constants.dart';
import 'package:bmi_calculator/calculator_brain.dart';
import 'file:///G:/FlutterProjects/bmi-calculator-flutter/lib/components/CustomContainer.dart';
import 'package:bmi_calculator/components/RoundIconButton.dart';
import 'package:bmi_calculator/components/calculate_Button.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'file:///G:/FlutterProjects/bmi-calculator-flutter/lib/components/GenderColumn.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  var selectedGender;
  int height = 120;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: CustomContainer(
                      color: Color(selectedGender == Gender.male
                          ? KActiveCardColor
                          : KInActiveCardColor),
                      containerContent: GenderColumn(
                        FontAwesomeIcons.mars,
                        "MALE",
                      ),
                      cardOnTap: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      }),
                ),
                Expanded(
                  flex: 3,
                  child: CustomContainer(
                      color: Color(selectedGender == Gender.female
                          ? KActiveCardColor
                          : KInActiveCardColor),
                      containerContent: GenderColumn(
                        FontAwesomeIcons.venus,
                        "Female",
                      ),
                      cardOnTap: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      }),
                ),
              ],
            ),
          ),
          Expanded(
              flex: 3,
              child: CustomContainer(
                color: Color(KActiveCardColor),
                containerContent: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Height", style: KLabelTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: KNumberStyle,
                        ),
                        Text(
                          "cm",
                          style: KLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbColor: Color(KPinkColor),
                        overlayColor: Color(0x15EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                        activeTrackColor: Colors.white,
                        trackHeight: 1.0,
                        inactiveTrackColor: Color(0xFF8D8E98),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        divisions: 100,
                        onChanged: (double newVale) {
                          setState(() {
                            height = newVale.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
              )),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: CustomContainer(
                    color: Color(KActiveCardColor),
                    containerContent: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: KLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: KNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              child: Icon(FontAwesomeIcons.plus),
                              onPress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                                child: Icon(FontAwesomeIcons.minus),
                                onPress: () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: CustomContainer(
                    color: Color(KActiveCardColor),
                    containerContent: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: KLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: KNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              child: Icon(FontAwesomeIcons.plus),
                              onPress: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                                child: Icon(FontAwesomeIcons.minus),
                                onPress: () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: CalculateButton(
              buttonText: "CALCULATE",
              onPress: () {
                CalculatorBrain calc = CalculatorBrain(height, weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(
                              bmiResult: calc.calculateBMI(),
                              resultText: calc.getResult(),
                              interpretation: calc.getInterpretation(),
                            )));
              },
            ),
          )
        ],
      ),
    );
  }
}
