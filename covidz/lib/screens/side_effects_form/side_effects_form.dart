import 'package:covidz/config/colors/palette.dart';
import 'package:flutter/material.dart';
import 'package:covidz/config/config.dart';
import 'package:flutter/services.dart';

class SideEffectsForm extends StatefulWidget {
  static const route = "/home/form";

  const SideEffectsForm({Key key}) : super(key: key);

  @override
  _SideEffectsFormState createState() => _SideEffectsFormState();
}

class _SideEffectsFormState extends State<SideEffectsForm> {
  int currentTab = 0;
  List tabs = [
    PageOne(),
    PageTwo(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
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
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: mainGreen,
        onTap: (index) {
          if (index == 1)
            setState(() {
              currentTab = 1;
            });
          else
            setState(() {
              currentTab = 0;
            });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back_ios),
            label: 'Précédant',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.arrow_forward_ios,
            ),
            label: 'Suivant',
          ),
        ],
      ),
      body: tabs[currentTab],
    );
  }
}

class PageOne extends StatefulWidget {
  const PageOne({Key key}) : super(key: key);

  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  var _formkey = GlobalKey<FormState>();

  Text sectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontWeight: FontWeight.normal, fontSize: 22),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: globalePadding,
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12),
              sectionTitle('Information générales'),
              SizedBox(height: 12),
              CustomTextField(
                hintText: 'Nom',
                iconData: Icons.person,
                keyBoardType: TextInputType.name,
              ),
              SizedBox(height: 10),
              CustomTextField(
                hintText: 'Prenom',
                iconData: Icons.person,
                keyBoardType: TextInputType.name,
              ),
              SizedBox(height: 10),
              CustomTextField(
                hintText: 'Age',
                iconData: Icons.calendar_today_outlined,
                keyBoardType: TextInputType.number,
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: DropdownButton(
                    hint: Text('Sexe      '),
                    onChanged: (value) {},
                    items: [
                      DropdownMenuItem(
                        child: Text('male'),
                      ),
                      DropdownMenuItem(
                        child: Text('male'),
                      ),
                    ]),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.location_city),
                  SizedBox(width: 15),
                  DropdownButton(
                      hint: Text('Willaya   '),
                      onChanged: (value) {},
                      items: [
                        DropdownMenuItem(
                          child: Text('Algiers'),
                        ),
                        DropdownMenuItem(
                          child: Text('Constantine'),
                        ),
                      ]),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.location_on),
                  SizedBox(width: 15),
                  DropdownButton(
                      hint: Text('Commune   '),
                      onChanged: (value) {},
                      items: [
                        DropdownMenuItem(
                          child: Text('Algiers'),
                        ),
                        DropdownMenuItem(
                          child: Text('Constantine'),
                        ),
                      ]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PageTwo extends StatefulWidget {
  const PageTwo({Key key}) : super(key: key);

  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  Text sectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontWeight: FontWeight.normal, fontSize: 22),
    );
  }

  bool _isLoading = false;
  bool _sent = false;

  bool isFievre = false;
  bool isTouxSeche = false;
  bool isPerdsOd = false;
  bool isFrissons = false;
  bool isDiarrhee = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: globalePadding,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 12),
            sectionTitle(
                'Choisissez les effets secondaire que vous avez rencontré'),
            SizedBox(height: 12),
            CheckboxListTile(
              activeColor: mainGreen,
              tileColor: Colors.grey[100],
              title: Text(
                'Fievre',
                style: TextStyle(fontSize: 20),
              ),
              value: isFievre,
              onChanged: (value) {
                setState(() => isFievre = !isFievre);
              },
            ),
            SizedBox(height: 8),
            CheckboxListTile(
              activeColor: mainGreen,
              tileColor: Colors.grey[100],
              title: Text(
                'Toux seche',
                style: TextStyle(fontSize: 20),
              ),
              value: isTouxSeche,
              onChanged: (value) {
                setState(() => isTouxSeche = !isTouxSeche);
              },
            ),
            SizedBox(height: 8),
            CheckboxListTile(
              activeColor: mainGreen,
              tileColor: Colors.grey[100],
              title: Text(
                "Perds de l'odorat",
                style: TextStyle(fontSize: 20),
              ),
              value: isPerdsOd,
              onChanged: (value) {
                setState(() => isPerdsOd = !isPerdsOd);
              },
            ),
            SizedBox(height: 8),
            CheckboxListTile(
              activeColor: mainGreen,
              tileColor: Colors.grey[100],
              title: Text(
                'Frissons',
                style: TextStyle(fontSize: 20),
              ),
              value: isFrissons,
              onChanged: (value) {
                setState(() => isFrissons = !isFrissons);
              },
            ),
            SizedBox(height: 8),
            CheckboxListTile(
              activeColor: mainGreen,
              tileColor: Colors.grey[100],
              title: Text(
                'Diarrhée',
                style: TextStyle(fontSize: 20),
              ),
              value: isDiarrhee,
              onChanged: (value) {
                setState(() => isDiarrhee = !isDiarrhee);
              },
            ),
            SizedBox(height: 30),
            TextFormField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                hintText: 'Autre effets',
              ),
            ),
            SizedBox(height: 50),
            CustomButton(
              onTap: () async {
                setState(() {
                  _isLoading = true;
                });
                await Future.delayed(Duration(seconds: 2));
                setState(() {
                  _isLoading = false;
                  _sent = true;
                });
                await Future.delayed(Duration(seconds: 1));
                Navigator.pop(context);
              },
              child: _isLoading
                  ? Container(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      ),
                    )
                  : _sent
                      ? Icon(
                          Icons.check,
                          size: 30,
                          color: Colors.white,
                        )
                      : Text(
                          'Envoyer',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
            )
          ],
        ),
      ),
    );
  }
}
