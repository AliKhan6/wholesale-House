import 'package:flutter/material.dart';

class Settings extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        leading:IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,),
          onPressed: () => Navigator.pop(context),),),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Share Settings', style: TextStyle(fontWeight: FontWeight.bold),),
            SettingsList('Include text as image while sharing'),
            SettingsList('Include logo an image while sharing'),
          ],
        ),
      ),
    );
  }
}

///
///
/// Settings options
class SettingsList extends StatefulWidget {
  String text;
  SettingsList(this.text,);
  @override
  _SettingsListState createState() => _SettingsListState();
}

class _SettingsListState extends State<SettingsList> {
  bool status=false;
  String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.text),
        Switch(
          activeColor: Colors.pinkAccent,
          value: status,
          onChanged: (value) {
            print("VALUE : $value");
            setState(() {
              status = value;
            });
          },
        ),
      ],
    );
  }
}