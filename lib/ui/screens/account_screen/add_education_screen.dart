import 'package:flutter/material.dart';

class AddEducationScreen extends StatefulWidget {
  @override
  _AddEducationScreenState createState() => _AddEducationScreenState();
}

class _AddEducationScreenState extends State<AddEducationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 30.0),
            height: MediaQuery.of(context).size.height * 0.13,
            decoration:BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[200],
                    offset:Offset(0,2),
                    blurRadius: 2,
                    spreadRadius: 2.0,
                  )
                ]
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.close,color: Colors.black,size: 20,),
                        onPressed: () => Navigator.pop(context)),
                    Text('Add Education',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18)),
                  ],
                ),
                Row(
                  children: <Widget>[
                    FlatButton(
                        onPressed: (){},
                        child: Text('SAVE',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                    ),
                  ],
                )
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 40),
            child: Column(
              children: <Widget>[
                Container(
                  color: Colors.white,
                  height: 60.0,
                  child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Name of School/College',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.pinkAccent),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                      )
                  ),
                ),

                SizedBox(height: 20,),
                Container(
                  color: Colors.white,
                  height: 60.0,
                  child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Subject',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.pinkAccent),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                      )
                  ),
                ),

                SizedBox(height: 20,),
                Container(
                  color: Colors.white,
                  height: 60.0,
                  child: TextField(
                      decoration: InputDecoration(
                        labelText: 'YYYY',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.pinkAccent),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                      )
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
