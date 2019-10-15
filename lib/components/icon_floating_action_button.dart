import 'package:flutter/material.dart';

class IconFloatingActionButton extends StatelessWidget {
  final Function onPressed;

  final Color color;

  IconFloatingActionButton({@required this.onPressed, this.color});

  @override
  Widget build(BuildContext context) {
    Widget result = RawMaterialButton(
      onPressed: onPressed,
      fillColor: color,
      shape: CircleBorder(),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 70.0,
        height: 70.0,
      ),
      child: Icon(
        Icons.add,
        color: Colors.white,
        size: 50.0,
      ),
    );

    return result;
  }
}
