import 'package:flutter/material.dart';

class Challenges extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(title: Text('Challenges',style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
          leading:IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,),
            onPressed: () => Navigator.pop(context),),
            bottom:TabBar(
            tabs: [
              Padding(
                padding: EdgeInsets.only(bottom:8.0),
                child: Text("Active",style: TextStyle(color: Colors.black)),
              ),
              Padding(
                padding: EdgeInsets.only(bottom:8.0),
                child: Text('Rewards',style: TextStyle(color: Colors.black)),
              )
            ],
          ) ,
        ),
        body:TabBarView(
          children: [
            ///
            ///Active
            ///
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.library_books,size: 100,),
                Center(child: Text('No Challenges right now .\nChallenges for you will comming soon!')),
              ],
            ),
            ///
            ///
            /// Rewards
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.local_mall,size: 100,),
                Center(child: Text('No Rewards')),
              ],
            ),

          ],
        ),
      ),
    );
  }
}