import 'package:flutter/material.dart';
class RoundIconButton extends StatelessWidget {
  final Widget child;
  final Function onPress;

  const RoundIconButton({Key key, this.child, this.onPress}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(shape:CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      child: child,
      constraints: BoxConstraints.tightFor(width: 56.0,height: 56.0),
      onPressed:onPress ,

    );
  }
}
