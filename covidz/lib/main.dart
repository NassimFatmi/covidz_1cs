import 'package:covidz/screens/screens.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Covidz());
}

class Covidz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'COVIDZ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Montserrat'),
      routes: {
        AuthScreen.route: (_) => AuthScreen(),
        HomeScreen.route: (_) => HomeScreen(),
        SideEffectsForm.route: (_) => SideEffectsForm(),
      },
      home: AuthScreen(),
    );
  }
}
