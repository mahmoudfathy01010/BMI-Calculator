import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class CustomContainer extends StatelessWidget {
  CustomContainer({ this.color, this.containerContent, this.cardOnTap});
  final Color color;
   final Widget containerContent;
   final Function cardOnTap;




  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:cardOnTap,
      child: Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10.0)),
        margin: EdgeInsets.all(15.0),
        child: Center(child: containerContent),
      ),
    );
  }
}
