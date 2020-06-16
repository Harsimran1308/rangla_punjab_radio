import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_radio/flutter_radio.dart';
import 'dart:io';
import 'globals.dart' as globals;

class MainPage extends StatefulWidget{
  HomePage createState()=> HomePage();
}

class HomePage extends State<MainPage> {
  String url = "http://shout.audionow.com:8000/ANPunjab";

  bool isVisible = true;
  bool isInternet = true;

  void initState() {
    super.initState();
    _checkInternetNetwork();
  }
  _checkInternetNetwork() async{
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isInternet = true;
        print('Connected');
      }
    } on SocketException catch (_) {
      isInternet = false;
      print('not');
    }
  }
  Future<void> audioStart() async {
    await FlutterRadio.audioStart();
    FlutterRadio.playOrPause(url: url);
    print('Audio Start OK');
  }
  Widget build(BuildContext context) {
    return new Container(
      color: new Color(0xFF131D4A),
      child: new Stack(
        children: <Widget>[
          Positioned(
            height:130,
            child: Image.asset(
              'assets/images/live.png',
              fit: BoxFit.contain,
              height: 130,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top:50,left: 30),
//            alignment: Alignment.center,
//            top:70,
//            left: 30,
            height:400,
            child: Image.asset(
              'assets/images/punjab.png',
              fit: BoxFit.contain,
//                    height: 350,
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 5,top: 300),
              child: Align(
                alignment: FractionalOffset.center,
                child: IconButton(iconSize:80,icon: globals.isPlaying? Icon(
                  Icons.pause_circle_outline,
//                  size: 80,
                  color: Color(0xFFBEAB78),
                )
                    : Icon(
                  Icons.play_circle_outline,
                  color: Color(0xFFBEAB78),
//                  size: 80,
                ),
                  onPressed: (){
                    setState(() {
                      FlutterRadio.playOrPause(url: url);
                      globals.isPlaying = !globals.isPlaying;
                      isVisible = !isVisible;
                    });
                    print('Audio Played');
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 50,)
        ],
      ),
    );
  }
}
