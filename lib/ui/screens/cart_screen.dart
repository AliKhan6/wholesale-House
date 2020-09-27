import 'package:flutter/material.dart';
import 'package:resellapp/constants/colors.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        children: <Widget>[
          ///
          /// Custom AppBar
          ///
          Material(
            elevation: 3.0,
            child: Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height * 0.13,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 40,),
                  Row(
                    children: <Widget>[
                      IconButton(icon: Icon(Icons.arrow_back),
                          onPressed: () => Navigator.pop(context)),
                      Text('Cart', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                    ],
                  ),
                ],
              ),
            ),
          ),

          Container(
            height: MediaQuery.of(context).size.height*0.87,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Icon(Icons.not_listed_location,color: pinkColor,size: 150,),
                SizedBox(height: 20,),
                Text('Your Cart is empty',style: TextStyle(fontSize: 18,color: Colors.black54),),
                SizedBox(height: 20),
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width/2.2,
                  child: FlatButton(
                      color: pinkColor,
                      onPressed: (){},
                      child: Text('BROWSE CATALOGS',style: TextStyle(color: Colors.white,fontSize: 14),)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
