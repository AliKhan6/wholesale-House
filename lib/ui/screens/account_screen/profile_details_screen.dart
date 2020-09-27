import 'package:flutter/material.dart';
import 'package:resellapp/ui/screens/account_screen.dart';
import 'package:resellapp/ui/screens/account_screen/reviewsScreen.dart';
import 'package:resellapp/ui/screens/account_screen/shared_screen.dart';
import 'package:resellapp/ui/screens/account_screen/videos_screen.dart';
import 'package:resellapp/ui/screens/account_screen/wish_list_screen.dart';

class ProfileDetailScreen extends StatefulWidget {

  @override
  _ProfileDetailScreenState createState() => _ProfileDetailScreenState();
}

class _ProfileDetailScreenState extends State<ProfileDetailScreen> {
  var screens = ["REVIEWS", "VIDEOS", "WISHLIST", "SHARED"];
  var selectedScreen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,),
          onPressed: () => Navigator.pop(context)
        ),
        title: Text('Profile',style: TextStyle(color: Colors.black),),
        actions: <Widget>[
          FlatButton(
            child: Text('EDIT',style: TextStyle(color: Colors.blue.shade700,fontSize: 16.0),),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          ///
          ///Upper Half Screen
          ///
          _selectDifferentProfileScreens(),

          ///
          /// Profile Different Screens Selection
          /// 
          selectedScreen == 0 ? ReviewsScreen() : selectedScreen == 1 ? VideoScreen() :
          selectedScreen == 2 ?  WishListScreen() : selectedScreen == 3 ? SharedScreen() : ReviewsScreen(),

        ],
      ),
    );
  }
  _selectDifferentProfileScreens(){
    return  Material(
      elevation: 3.0,
      child: Column(
        children: <Widget>[
          SizedBox(height: 20.0,),
          Center(
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
//                  color: Color(0xFFE91EC1),
                  gradient: LinearGradient(colors: [Colors.pink[200],Colors.pinkAccent])
              ),
              child: Center(child: Text('WHU',style: TextStyle(color: Colors.white,fontSize: 20.0),)),
            ),
          ),
          SizedBox(height: 20.0,),
          Center(
            child: Text('Wholesale House User',style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w500),),
          ),
          SizedBox(height: 30.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text('0',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
                  SizedBox(height: 10.0,),
                  Text('Helpfuls',style: TextStyle(color: Colors.black54),)
                ],
              ),
              Column(
                children: <Widget>[
                  Text('0',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
                  SizedBox(height: 10.0,),
                  Text('Followers',style: TextStyle(color: Colors.black54),)
                ],
              ),
              Column(
                children: <Widget>[
                  Text('0',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
                  SizedBox(height: 10.0,),
                  Text('Following',style: TextStyle(color: Colors.black54),)
                ],
              ),
            ],
          ),
          SizedBox(height: 40.0,),
          Container(
              height: 30,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
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
                            padding: EdgeInsets.only(left: 25.0),
                            child: Column(
                              children: <Widget>[
                                Text(screens[index] ,style: TextStyle(
                                    color: index == selectedScreen ? Colors.black : Colors.black54
                                )),
                                SizedBox(height: 12.0,),
                                index == selectedScreen ? Container(
                                  height: 2.0,
                                  width: 80.0,
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
    );
  }
}
