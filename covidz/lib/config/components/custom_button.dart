import 'package:flutter/material.dart';
import 'package:covidz/config/config.dart';

class CustomButton extends StatelessWidget {
  @required
  final Function onTap;
  final Widget child;
  final Color textColor;
  final Color bgColor;
  final double height;
  final EdgeInsetsGeometry padding;

  const CustomButton({
    this.onTap,
    this.child,
    this.textColor = Colors.white,
    this.bgColor = mainGreen,
    this.height = 50,
    this.padding = const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: padding,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0), color: bgColor),
        child: child,
      ),
    );
  }
}
