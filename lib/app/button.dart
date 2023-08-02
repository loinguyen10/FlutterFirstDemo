import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor, foregroundColor;
  final double paddingValue, marginValue;

  const AppButton(
      {required this.text,
      required this.onPressed,
      this.backgroundColor = Colors.white,
      this.foregroundColor = Colors.black,
      this.paddingValue = 8.0,
      this.marginValue = 0.0});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(marginValue),
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(text),
          style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              foregroundColor: foregroundColor,
              padding: EdgeInsets.all(paddingValue)),
        ));
  }
}
