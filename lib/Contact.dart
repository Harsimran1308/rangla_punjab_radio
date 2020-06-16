import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget{

  Widget build(BuildContext context) {
    return new Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: new Color(0xFF131D4A),
      child: new ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top:20.0), child: Column ( children: [
            Text(
              'For Any Enquiries',
              style: TextStyle(letterSpacing: 1,fontFamily: 'TimeNewRoman', fontSize: 25 ,color: Color(0xFFBEAB78)),
            ),
            Padding(padding: EdgeInsets.only(top: 10.0)),
            Text(
              'Reach Us At',
              style: TextStyle(fontFamily: 'TimeNewRoman',fontSize: 25,color: Color(0xFFBEAB78)),
            ),
          ]),
          ),
          Container(
            padding: const EdgeInsets.only(top:40.0), child: Column ( children: [
            Text(
              'Dilbag Chawla',
              style: TextStyle(letterSpacing: 1,fontFamily: 'TimeNewRoman', fontSize: 25 ,color: Color(0xFFBEAB78)),
            ),
            Padding(
              padding:EdgeInsets.only(top:5.0),
              child:Container(
                height:2.0,
                width:170.0,
                color:Color(0xFFBEAB78),),),
            Container(
              padding: EdgeInsets.only(top:20.0,left: 40.0),
              child: Row (mainAxisAlignment: MainAxisAlignment.start,children: [
                Image.asset(
                  'assets/images/phone-contact.png',
                  fit: BoxFit.contain,
                  height: 40,
                ),
                Padding(padding: EdgeInsets.only(left: 40.0)),
                Text(
                  '416-716-7794',
                   style: TextStyle(fontFamily: 'TimeNewRoman',fontSize: 20,color: Color(0xFFBEAB78)),

                )
              ],
              ),

            ),
            Container(
              padding: EdgeInsets.only(top:10.0,left: 40.0),
              child: Row (mainAxisAlignment: MainAxisAlignment.start,children: [
                Image.asset(
                  'assets/images/mail-contact.png',
                  fit: BoxFit.contain,
                  height: 40,
                ),
                Padding(padding: EdgeInsets.only(left: 30.0)),
                Text(
                  'Dilbagchawla@rogers.com',
                  style: TextStyle(fontFamily: 'TimeNewRoman',fontSize: 20,color: Color(0xFFBEAB78)),

                )
              ],
              ),
            )
          ]),
          ),
          Padding(padding: EdgeInsets.only(top: 10.0)),
          Container(
            padding: const EdgeInsets.only(top:40.0), child: Column ( children: [
            Text(
              'Arsh Chawla',
              style: TextStyle(letterSpacing: 1,fontFamily: 'TimeNewRoman', fontSize: 25 ,color: Color(0xFFBEAB78)),
            ),
            Padding(
              padding:EdgeInsets.only(top:5.0),
              child:Container(
                height:2.0,
                width:160.0,
                color:Color(0xFFBEAB78),),),
            Container(
              padding: EdgeInsets.only(top:20.0,left: 40.0),
              child: Row (mainAxisAlignment: MainAxisAlignment.start,children: [
                Image.asset(
                  'assets/images/phone-contact.png',
                  fit: BoxFit.contain,
                  height: 40,
                ),
                Padding(padding: EdgeInsets.only(left: 40.0)),
                Text(
                  '647-296-1941',
                  style: TextStyle(fontFamily: 'TimeNewRoman',fontSize: 20,color: Color(0xFFBEAB78)),

                )
              ],
              ),

            ),
            Container(
              padding: EdgeInsets.only(top:15.0,left: 40.0),
              child: Row (mainAxisAlignment: MainAxisAlignment.start,children: [
                Image.asset(
                  'assets/images/mail-contact.png',
                  fit: BoxFit.contain,
                  height: 40,
                ),
                Padding(padding: EdgeInsets.only(left: 40.0)),
                Text(
                  'Asianvisionradio@gmail.com',
                  style: TextStyle(fontFamily: 'TimeNewRoman',fontSize: 20,color: Color(0xFFBEAB78)),

                )
              ],
              ),
            )
          ]),
          ),
          SizedBox(height: 50,)
        ],
      ),
    );
  }
}