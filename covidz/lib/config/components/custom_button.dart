import 'package:flutter/material.dart';
import 'package:covidz/config/config.dart';

class CustomButton extends StatelessWidget {
  @required
  final Function onTap;
  final Widget child;
  final Color textColor;
  final Color bgColor;

  const CustomButton(
      {this.onTap,
      this.child,
      this.textColor = Colors.white,
      this.bgColor = mainGreen});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0), color: bgColor),
        child: child,
      ),
    );
  }
}
