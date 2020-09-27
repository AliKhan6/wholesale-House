import 'package:flutter/material.dart';
import 'package:resellapp/ui/screens/cart_screen.dart';
import 'package:resellapp/ui/screens/favourite_screen.dart';
import 'package:resellapp/ui/screens/for_you_screen.dart';

class CustomAppBar extends StatelessWidget {

  final title;
  IconData leadingIcon;
  IconData lastIcon;
  IconData firstIcon;
  CustomAppBar({this.title,this.leadingIcon,this.lastIcon,this.firstIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30.0),
      height: 95,
      decoration:BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey[300],
              offset:Offset(0,3),
              blurRadius: 2,
              spreadRadius: 2.0,
            )
          ]
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                leadingIcon == null ? Container() :
                InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Icon(leadingIcon)),
                SizedBox(width: 10.0,),
                Text(title,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18)),
              ],
            ),
            Row(
              children: <Widget>[
                IconButton(
                  icon: firstIcon == null ? Icon(Icons.search) : Icon(firstIcon),color: Colors.black,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ForYouScreen()));
                  },
                ),
                IconButton(
                  icon: Icon(Icons.favorite),color: Colors.black,
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FavouriteScreen())),
                ),
                IconButton(
                  icon: lastIcon == null ? Icon(Icons.shopping_cart) : Icon(lastIcon,color: Colors.black),
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen())),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
