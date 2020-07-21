import 'package:bmi_calculator/Constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class GenderColumn extends StatelessWidget {
  final IconData icon;
  final String gender;

  GenderColumn(this.icon, this.gender);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [FaIcon(icon,size: 80,),SizedBox(height: 15,), Text(gender,style:KLabelTextStyle ,)],
    );
  }
}
