import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  bool isSwitch = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height*0.8,
        child: ListView(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 12),
              child: Column(
                children: <Widget>[
                  Text('Choose the information you want to show on your social profile.'),
                  SizedBox(height: 10.0,),

                  OnOffDifferentSettings(text: 'Show profile photo'),
                  SizedBox(height: 15,),

                  OnOffDifferentSettings(text: 'Show city'),
                  SizedBox(height: 15,),

                  OnOffDifferentSettings(text: 'Show state'),
                  SizedBox(height: 15,),

                  OnOffDifferentSettings(text: 'Show language'),
                  SizedBox(height: 15,),

                  OnOffDifferentSettings(text: 'Show About Me'),
                  SizedBox(height: 15,),

                  OnOffDifferentSettings(text: 'Show my Wishlist'),
                  SizedBox(height: 15,),

                  OnOffDifferentSettings(text: 'Show Shared Catalogs'),
                  SizedBox(height: 15,),
                ],
              ),
            ),
          ],
        )
    );
  }
}

class OnOffDifferentSettings extends StatefulWidget {

  String text;
  OnOffDifferentSettings({this.text});
  @override
  _OnOffDifferentSettingsState createState() => _OnOffDifferentSettingsState();
}

class _OnOffDifferentSettingsState extends State<OnOffDifferentSettings> {

  TextStyle settingsTextStyle = TextStyle(fontSize: 16,fontWeight: FontWeight.w400);
  bool isSwitch = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(widget.text, style: settingsTextStyle),
        Container(
          height: 45,
          child: Switch(
            value: isSwitch,
            onChanged: (value) {
              setState(() {
                isSwitch = value;
              });
            },
            activeColor: Colors.pink,
          ),
        )
      ],
    );
  }
}

