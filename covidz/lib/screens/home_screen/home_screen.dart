import 'package:covidz/config/config.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const route = '/home';
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    int index = 0;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        selectedItemColor: mainBlue,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: 'Statistiques'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Account'),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
              onPressed: () {}),
        ],
        title: Image(
          image: AssetImage('assets/images/logo.png'),
          width: 120,
        ),
      ),
      body: Container(
        padding: globalePadding,
        height: size.height,
        width: size.width,
        child: ListView(
          children: [
            emergencyCard(),
            Container(
              margin: const EdgeInsets.only(bottom: 30),
              child: Column(
                children: [
                  HomeNotification(
                    title: 'Important Notification !',
                    notifContent:
                        'The presedent has announced a lockdown from 8 May to 16 May to fight surge in Covid 19 cases',
                  ),
                ],
              ),
            ),
            Column(
              children: [
                CustomButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.qr_code_scanner,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'QR',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                CustomButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.description_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'From',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
              ],
            )
          ],
        ),
      ),
    );
  }

  Card emergencyCard() {
    return Card(
      margin: EdgeInsets.only(bottom: 30),
      elevation: 1.5,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Do you feel sick ?',
                    softWrap: true,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'If you find yourself sick with COVID-19 symptomes, call or sms us immediately for assistance.',
                    style: TextStyle(fontSize: 14),
                    softWrap: true,
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                cardButton(Icons.call, 'Call Now', mainRed),
                cardButton(Icons.message, 'Send SMS', mainBlue),
              ],
            )
          ],
        ),
      ),
    );
  }

  CustomButton cardButton(IconData icon, String text, Color color) {
    return CustomButton(
      bgColor: color,
      padding: EdgeInsets.symmetric(horizontal: 25),
      height: 45,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 18,
          ),
          SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
