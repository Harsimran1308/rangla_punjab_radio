import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import './Home.dart';
import './Contact.dart';
import 'package:flutter_radio/flutter_radio.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

_MyAppState myAppState;
void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String textValue = "Text";
  FirebaseMessaging _firebaseMessaging = new FirebaseMessaging();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
  String url = "http://shout.audionow.com:8000/ANPunjab";
  int _selectedTab = 0;
  final _pageOptions = [
    MainPage(),
    ContactPage(),
  ];
  @override
  void initState() {
    var android = new AndroidInitializationSettings('app_logo');
    var ios = new IOSInitializationSettings();
    var platform = new InitializationSettings(android, ios);
    flutterLocalNotificationsPlugin.initialize(platform);
    _firebaseMessaging.configure(
      onLaunch: (Map<String, dynamic> msg){
        print("called");
      },
      onResume: (Map<String, dynamic> msg){
        print("On Resume called");
      },
      onMessage: (Map<String, dynamic> msg){
        print(" onMessage called");
        showNotification(msg);
    }
    );
    _firebaseMessaging.requestNotificationPermissions(
      const IosNotificationSettings(
        sound: true,
        alert: true,
        badge: true,
      )
    );
    _firebaseMessaging.onIosSettingsRegistered.listen((IosNotificationSettings setting) {
      print("Ios Settings Registered");
    });
    _firebaseMessaging.getToken().then((token) {
      update(token);
    });
    super.initState();
    audioStart();
  }
  showNotification(Map<String, dynamic> msg) async {
    var android = new AndroidNotificationDetails("channel_id", "CHANNLE_NAME", "channelDescription");
    var iOS = IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);
    var notification = msg['notification'];
    await flutterLocalNotificationsPlugin.show(0,notification['title'], notification['body'], platform);
  }
  update(String token) {
    print(token);
    textValue = token;
    setState(() {

    });

  }
  _launchURL() async {
    const url = 'http://ranglapunjab.com/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  Future<void> audioStart() async {
    await FlutterRadio.audioStart();
    FlutterRadio.playOrPause(url: url);
    print('Audio Start OK');
  }

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage("assets/images/mail-contact.png"), context);
    precacheImage(AssetImage("assets/images/phone-contact.png"), context);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return new MaterialApp(
        title: 'RANGLA PUNJAB RADIO',
        debugShowCheckedModeBanner: false,
        home: new Scaffold(
          appBar: new AppBar(
            backgroundColor: new Color(0xFF131D4A),
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/app_logo.png',
                  fit: BoxFit.contain,
                  height: 60,
                ),
                Container(
                    padding: const EdgeInsets.all(30.0), child: Column ( children: [
                        Text(
                          'RANGLA PUNJAB RADIO',
                          style: TextStyle(fontFamily: 'Segoe', fontSize: 18 ,color: Color(0xFFBEAB78)),
                        ),
                        Text(
                          'EST : 1997',
                          style: TextStyle(fontFamily: 'Segoe',fontSize: 15,color: Color(0xFFBEAB78)),
                        ),
                    ]),
                ),
            ]
          ),
          ),
          body: _pageOptions[_selectedTab],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedTab,
            onTap: (int index) {
              if(index == 2) {
                _launchURL();
              } else {
                setState(() {
                  _selectedTab = index;
                });
              }
            },
            backgroundColor: new Color(0xFF131D4A),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(

                icon: Icon(Icons.home, color: Color(0xFFea9704),size: 40),
                title: Text(
                  "",
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.perm_phone_msg, color: Color(0xFFea9704),size: 40),
                  title: Text(
                    "",
                  )
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.language,color: Color(0xFFea9704),size: 40),
                title: Text(''),
              ),
            ],
//            currentIndex: _selectedIndex,
//            selectedItemColor: Colors.amber[800],
//            onTap: _onItemTapped,
          ),
        ));
  }
}