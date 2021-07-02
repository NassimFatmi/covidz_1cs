import 'package:covidz/config/config.dart';
import 'package:covidz/screens/screens.dart';
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
        selectedItemColor: mainGreen,
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

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List covidCases = [
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

  List notificationsList = [
    {
      'title': 'Important Notification !',
      'content':
          'The presedent has announced a lockdown from 8 May to 16 May to fight surge in Covid 19 cases',
    },
  ];

  Card emergencyCard(String title, String content, Widget child) {
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
                    title,
                    softWrap: true,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    content,
                    style: TextStyle(fontSize: 14),
                    softWrap: true,
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            child,
          ],
        ),
      ),
    );
  }

  CustomButton cardButton(
      IconData icon, String text, Color color, Function onTap) {
    return CustomButton(
      onTap: onTap,
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
          emergencyCard(
            'Do you feel sick ?',
            'If you find yourself sick with COVID-19 symptomes, call or sms us immediately for assistance.',
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                cardButton(Icons.call, 'Call Now', mainRed, () {}),
                cardButton(Icons.message, 'Send SMS', mainGreen, () {}),
              ],
            ),
          ),
          // start notif container
          Container(
            constraints: BoxConstraints(minHeight: 0),
            margin: const EdgeInsets.only(bottom: 25),
            child: Column(
              children: notificationsList
                  .map(
                    (notification) => HomeNotification(
                      onDismissed: (direction) {
                        setState(() {
                          notificationsList.remove(notification);
                        });
                      },
                      title: notification['title'],
                      notifContent: notification['content'],
                    ),
                  )
                  .toList(),
            ),
          ),
          // end notif container

          // Start covid cases today
          sectionTitle('Covid cases today'),
          SizedBox(height: 15),
          Container(
            height: size.height * 0.13,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: covidCases
                  .map((item) => Container(
                        width: size.width * 0.29,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 12),
                        decoration: BoxDecoration(
                          color: mainGreen,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              item['title'],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '${item['content'].toString()}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
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

          // Start form secondary effects

          emergencyCard(
            'Do you have side effects ?',
            'Fill the form and report side effects of the vaccin',
            cardButton(
              Icons.description_outlined,
              'Fill the form',
              mainRed,
              () {
                Navigator.pushNamed(
                  context,
                  SideEffectsForm.route,
                );
              },
            ),
          ),
          // End form secondary effects

          // Start Latest updates
          sectionTitle('See latest updates'),
          SizedBox(height: 15),
          Column(
            children: [
              latestUpdate(context, '80% of cases are in Algiers', '45 min ago',
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9c/Covid-19_San_Salvatore_09.jpg/330px-Covid-19_San_Salvatore_09.jpg'),
              latestUpdate(context, 'New lockdown in 24 Willaya', '1 h ago',
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9c/Covid-19_San_Salvatore_09.jpg/330px-Covid-19_San_Salvatore_09.jpg')
            ],
          ),
          // End Latest updates
        ],
      ),
    );
  }

  Container latestUpdate(
      BuildContext context, String title, String timeAgo, String url) {
    return Container(
      height: 100,
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: grey,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            margin: EdgeInsets.only(right: 8),
            child: Image.network(url, fit: BoxFit.cover, width: 100,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(),
              );
            }),
          ),
          Container(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width - 120),
            child: Column(
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
            ),
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
  bool _isLoading = false;

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
                onTap: () async {
                  if (!_showQR) {
                    setState(() {
                      _isLoading = true;
                    });
                    await Future.delayed(Duration(seconds: 1));
                    setState(() {
                      _isLoading = false;

                      _showQR = !_showQR;
                    });
                  }
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
          _isLoading
              ? Center(child: CircularProgressIndicator())
              : const SizedBox.shrink(),
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
