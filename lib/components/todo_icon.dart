import 'package:flutter/material.dart';

class TodoIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.0,
      height: 90.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: Icon(
        Icons.format_list_bulleted,
        color: Colors.lightBlueAccent,
        size: 50.0,
      ),
    );
  }
}
