import 'package:covidz/screens/home_screen/home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:covidz/config/config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthScreen extends StatefulWidget {
  static const route = '/auth_page';
  const AuthScreen({Key key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Container(
            height: size.height,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Image(
                        image: AssetImage('assets/images/logo.png'),
                      ),
                      SizedBox(height: 20),
                      SvgPicture.asset(
                        'assets/images/bg.svg',
                        semanticsLabel: 'doctors',
                        height: 250,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Login or Sign up',
                        style: TextStyle(fontSize: 22),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'A one-time password will be send to your\nphone number',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 15,
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Enter phone number',
                          prefix: Text('(+213) '),
                        ),
                      ),
                      SizedBox(height: 20),
                      CustomButton(
                        child: _isLoading
                            ? Container(
                                height: 30,
                                width: 30,
                                child: CircularProgressIndicator(
                                  backgroundColor: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : Text('Connect',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                )),
                        onTap: () async {
                          setState(() {
                            _isLoading = true;
                          });
                          await Future.delayed(Duration(seconds: 1));
                          setState(() {
                            _isLoading = false;
                          });
                          Navigator.pushReplacementNamed(
                              context, HomeScreen.route);
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
