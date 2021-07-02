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
                        'Se connecter ou Créer compte',
                        style: TextStyle(fontSize: 22),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Un mot de passe de confirmation sera envoyé à votre numéro de téléphone',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 15,
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: 'Numéro de telephone',
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
                            : Text('Se connecter',
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
