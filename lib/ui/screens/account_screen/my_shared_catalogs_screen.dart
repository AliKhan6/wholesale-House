import 'package:flutter/material.dart';

class MySharedCatalogsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(title: Text('My Catalogs',style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
          leading:IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,),
            onPressed: () => Navigator.pop(context),),
          bottom:TabBar(
            tabs: [
              Padding(
                padding: EdgeInsets.only(bottom:8.0),
                child: Text("WISHLIST",style: TextStyle(color: Colors.black54)),
              ),
              Padding(
                padding: EdgeInsets.only(bottom:8.0),
                child: Text('SHARED',style: TextStyle(color: Colors.black54)),
              )
            ],
          ) ,
          actions: <Widget>[
            Icon(Icons.search,color: Colors.black,),
            SizedBox(width: 20,),
            Icon(Icons.shopping_cart,color: Colors.black,),
            SizedBox(width: 20,),
          ],
        ),
        body: TabBarView(
          children: [
            ///
            ///
            /// Wishlist
            Container(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(height: MediaQuery.of(context).size.height * 0.4,),
                    Text('It\'s quit empty here!',style: TextStyle(fontWeight: FontWeight.bold),),
                    Text('You haven\'t saved any catalogs to Wishlist!\nJust click on catalogs to save them to wishlist and sharethem later with yours customers.'),
                    SizedBox(height: 50,),
                    ///
                    ///
                    /// Button
                    Container(
                      height: 50,
                      width: 200,
                      child: Center(child: Text('SHOW ME CATALOGS')),
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

            ///
            ///
            /// Share
            Center(child: Text('Home page content'),)
          ],
        ),
      ),
    );
  }
}