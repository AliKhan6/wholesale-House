import 'package:flutter/material.dart';
import 'package:resellapp/ui/screens/account_screen/contact_screen.dart';
import 'package:resellapp/ui/screens/account_screen/personal_screen.dart';

class ProfileInfoScreen extends StatefulWidget {
  @override
  _ProfileInfoScreenState createState() => _ProfileInfoScreenState();
}

class _ProfileInfoScreenState extends State<ProfileInfoScreen> {
  var screens = ["CONTACT", "PERSONAL", "WORK AND EDUCATION", "SETTINGS"];
  var selectedScreen = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Material(
              elevation: 3.0,
              child: Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.18,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 35.0),
                      child: Row(
                        children: <Widget>[
                          IconButton(
                              icon: Icon(Icons.arrow_back,size: 23,),
                              onPressed: (){}
                          ),
                          Text('Edit Profile Information',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                        ],
                      ),
                    ),

                    SizedBox(height: 18.5,),

                    Container(
                      height: 30,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          itemCount: screens.length,
                          itemBuilder: (context, index){
                            return GestureDetector(
                              onTap: (){
                                setState(() {
                                  selectedScreen = index;
                                });
                              },
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(left: 20.0),
                                    child: Column(
                                      children: <Widget>[
                                        Text(screens[index] ,style: TextStyle(
                                            color: index == selectedScreen ? Colors.black : Colors.black54
                                        )),
                                        SizedBox(height: 12.0,),
                                        index == selectedScreen ? Container(
                                          height: 2.0,
                                          width: 60.0,
                                          color: Colors.pinkAccent,
                                        ) : Container(),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                      )
                    )
                  ],
                ),
              ),
            ),

            /// Contact Screen details
            selectedScreen == 0 ? ContactScreen() : PersonalScreen(),

            /// Save button
            Container(
              alignment: Alignment.bottomCenter,
              color: Colors.white,
              height: 50,
              child: Padding(
                padding: EdgeInsets.only(left: 8.0,right: 8.0,top: 4.0),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    gradient: LinearGradient(colors: [Colors.pinkAccent,Colors.pink[200]])
                  ),
                  child: FlatButton(
                      onPressed: (){},
                      child: Text('SAVE',style: TextStyle(color: Colors.white,fontSize: 17.0),)
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
