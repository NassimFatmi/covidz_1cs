import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData iconData;
  final TextInputType keyBoardType;

  const CustomTextField({
    @required this.hintText,
    @required this.iconData,
    @required this.keyBoardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.name,
      validator: (value) => value.isEmpty ? 'Entrez votre $hintText' : null,
      decoration: InputDecoration(
        hintText: hintText,
        icon: Icon(
          iconData,
          color: Colors.black,
        ),
      ),
    );
  }
}
