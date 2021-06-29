import 'package:flutter/material.dart';

class Auth extends ChangeNotifier{
  bool _isAuth = false;
  String _token;

  bool get isAuth => _isAuth;
  String get token => _token;


}