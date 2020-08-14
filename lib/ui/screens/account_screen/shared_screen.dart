import 'package:flutter/material.dart';

class SharedScreen extends StatefulWidget {
  @override
  _SharedScreenState createState() => _SharedScreenState();
}

class _SharedScreenState extends State<SharedScreen> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 0.435,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 30),
            child: Column(
              children: <Widget>[
                Icon(Icons.share,size: 70,color: Colors.black26,),
                SizedBox(height: 10.0,),
                Text('Your Shared list is not public.'),
                SizedBox(height: 5.0,),
                Center(child: Text('Change the settings below to make Shared list public',style: TextStyle(color: Colors.black54),))
              ],
            ),
          ),
        ),

        Container(
          alignment: Alignment.center,
          height: 45,
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Make my Shared list public',style: TextStyle(fontWeight: FontWeight.w400),),
                Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  },
                  activeColor: Colors.pink,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}