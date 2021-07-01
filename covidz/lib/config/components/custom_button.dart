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

class CustomRectButton extends StatelessWidget {
  final Function onTap;
  final Color color;
  final String title;
  final IconData iconData;
  const CustomRectButton({
    @required this.onTap,
    this.color = mainBlue,
    @required this.iconData,
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: BoxConstraints(maxWidth: 130, maxHeight: 130),
        padding: const EdgeInsets.all(20),
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: Colors.white,
              size: 40,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
