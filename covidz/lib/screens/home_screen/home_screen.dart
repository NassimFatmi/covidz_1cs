import 'package:covidz/config/config.dart';
import 'package:covidz/screens/qr_scanner/qr_scanner.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class HomeScreen extends StatefulWidget {
  static const route = '/home';
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTabIndex = 0;
  List<Widget> _tabs = [
    HomeTab(),
    QrTab(),
    Container(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTabIndex,
        selectedItemColor: mainBlue,
        onTap: (index) {
          setState(() {
            _currentTabIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: 'QR code'),
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
      body: _tabs[_currentTabIndex],
    );
  }
}

class HomeTab extends StatelessWidget {
  final List covidCases = [
    {
      'title': 'Confirmed cases',
      'content': 120,
    },
    {
      'title': 'Recovred',
      'content': 238,
    },
    {
      'title': 'Deaths',
      'content': 9,
    },
  ];

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

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: globalePadding,
      height: size.height,
      width: size.width,
      child: ListView(
        children: [
          emergencyCard(),
          // start announcement container
          Container(
            margin: const EdgeInsets.only(bottom: 25),
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
          // end announcement container

          // Start covid cases today
          sectionTitle('Covid cases today'),
          SizedBox(height: 15),
          Container(
            height: size.height * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: covidCases
                  .map((item) => Container(
                        width: size.width * 0.29,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: mainBlue,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              item['title'],
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '${item['content'].toString()}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  'See all',
                  style: TextStyle(color: Colors.black),
                ),
                style: ButtonStyle(),
              ),
            ],
          ),
          // End covid cases today

          // Start Latest updates
          sectionTitle('See latest updates'),
          SizedBox(height: 15),
          Column(
            children: [
              latestUpdate('80% of cases are in Algiers', '45 min ago',
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9c/Covid-19_San_Salvatore_09.jpg/330px-Covid-19_San_Salvatore_09.jpg')
            ],
          ),
          // End Latest updates
        ],
      ),
    );
  }

  Container latestUpdate(String title, String timeAgo, String url) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: grey,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            child: Image.network(url, fit: BoxFit.cover, width: 100,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(),
              );
            }),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                timeAgo,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Text sectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontWeight: FontWeight.normal, fontSize: 22),
    );
  }
}

class QrTab extends StatefulWidget {
  @override
  _QrTabState createState() => _QrTabState();
}

class _QrTabState extends State<QrTab> {
  bool _showQR = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: globalePadding,
      child: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRectButton(
                iconData: Icons.qr_code_scanner_outlined,
                title: 'Scan a QR',
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => QRScanner()));
                },
              ),
              CustomRectButton(
                iconData: Icons.qr_code,
                title: 'Generate your QR',
                color: mainRed,
                onTap: () {
                  setState(() {
                    _showQR = !_showQR;
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 20),
          _showQR
              ? Text(
                  'This is your QR code',
                  style: TextStyle(fontSize: 22),
                )
              : const SizedBox.shrink(),
          const SizedBox(height: 10),
          _showQR
              ? QrImage(
                  data: 'user data',
                  backgroundColor: Colors.white,
                  size: 250,
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
