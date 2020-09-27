import 'package:flutter/material.dart';
import 'package:resellapp/constants/colors.dart';
import 'package:resellapp/ui/screens/account_screen.dart';
import 'package:resellapp/ui/screens/collection_screen.dart';
import 'package:resellapp/ui/screens/for_you_screen.dart';
import 'package:resellapp/ui/screens/help_screen.dart';
import 'package:resellapp/ui/screens/orders_screen.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  int index;
  CustomBottomNavigationBar({this.index});
  @override
  _CustomBottomNavigationBarState createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return
      BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: pinkColor,
        items: [
          BottomNavigationBarItem(icon: Image.asset('images/foryou.png',height: 25,color: widget.index == 0 ?
            pinkColor : Colors.black54,),title: Text('For you')),
          BottomNavigationBarItem(icon: Icon(Icons.collections_bookmark),title: Text('Collections')),
          BottomNavigationBarItem(icon: Icon(Icons.business_center),title: Text('Orders')),
          BottomNavigationBarItem(icon: Icon(Icons.live_help),title: Text('Help')),
          BottomNavigationBarItem(icon: Icon(Icons.person),title: Text('Account')),
        ],
        onTap: (int index){
          setState(() {
            if(index == 0){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ForYouScreen()));
            } else if(index == 1){
              Navigator.push(context, MaterialPageRoute(builder: (context) => CollectionScreen()));
            }else if(index == 2){
              Navigator.push(context, MaterialPageRoute(builder: (context) => OrdersScreen()));
            }else if(index == 3){
              Navigator.push(context, MaterialPageRoute(builder: (context) => HelpScreen()));
            }else{
              Navigator.push(context, MaterialPageRoute(builder: (context) => AccountScreen()));
            }
          });

        },
        currentIndex: widget.index,
      );
  }
}