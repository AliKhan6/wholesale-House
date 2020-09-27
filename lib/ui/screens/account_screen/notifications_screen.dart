import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notification',style: TextStyle(color: Colors.black),),backgroundColor: Colors.white,
        leading:IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,),
      onPressed: () => Navigator.pop(context),),),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.78,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    NotificationLists('Anklets & Toe Rings'),
                    NotificationLists('Appliance Covers & Firdge Mats'),
                    NotificationLists('Bags & Backpacks'),
                    NotificationLists('Bangles & Bracelets'),
                    NotificationLists('Bedsheets'),
                    NotificationLists('Blouses'),
                    NotificationLists('Best Accessories'),
                    NotificationLists('Body - Beauty Products'),
                    NotificationLists('Causal Shoes'),
                    NotificationLists('Classic Kurtis'),
                    NotificationLists('Dupattas'),
                    NotificationLists('Face Care'),
                    NotificationLists('Flats & Sandals'),
                    NotificationLists('Hair Products'),
                  ],
                ),
              ),
              Container(
                height: 50,
                width: 200,
                child: Center(child: Text('SAVE CHANGE',style: TextStyle(fontWeight: FontWeight.bold),)),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient:LinearGradient(
                        colors: [
                          Colors.pink,
                          Colors.pinkAccent,
                        ],
                        stops: [0.0, 1.0],
                        begin: FractionalOffset.centerLeft,
                        end: FractionalOffset.centerRight,
                        tileMode: TileMode.repeated
                    )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationLists extends StatefulWidget {
  String _text;
  NotificationLists(this._text);
  @override
  _NotificationListsState createState() => _NotificationListsState();
}

class _NotificationListsState extends State<NotificationLists> {
  var checkedValue=false;
  String _text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckboxListTile(
          title: Text(widget._text),
          value: checkedValue,
          onChanged: (newValue) {
            setState(() {
              checkedValue = newValue;
            });
          },
          controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
        ),
        Divider(height: 2,color: Colors.grey,)
      ],
    );
  }
}