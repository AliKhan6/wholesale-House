import 'package:flutter/material.dart';

class WishListScreen extends StatefulWidget {
  @override
  _WishListScreenState createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 0.435,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 30),
            child: Column(
              children: <Widget>[
                Icon(Icons.favorite_border,size: 70,color: Colors.black26,),
                SizedBox(height: 10.0,),
                isSwitched == false ? Column(
                  children: <Widget>[
                    Text('Your Wish list is not public.'),
                    SizedBox(height: 5.0,),
                    Text('Change the settings below to make Wish list public',style: TextStyle(color: Colors.black54),),
                  ],
                ) :
                    Column(
                      children: <Widget>[
                        Text("\t\t\t\t\tyou haven't saved any catalogs to Wishlist! \n Just click ❤️ on catalogs to save them to"
                            " wishlist\n \t\t\t\tand share them later with your customers."),

                        SizedBox(height: 30,),
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              gradient: LinearGradient(colors: [Colors.pinkAccent,Colors.pink[200]])
                          ),
                          child: FlatButton(
                              onPressed: (){},
                              child: Text('SHOW ME CATALOGS',style: TextStyle(color: Colors.white,fontSize: 15.0),)
                          ),
                        )
                      ],
                    )
              ],
            ),
          ),
        ),

        isSwitched == false ? Container(
          alignment: Alignment.center,
          height: 45,
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Make my Wish list public',style: TextStyle(fontWeight: FontWeight.w400),),
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
        ):Container()
      ],
    );
  }
}