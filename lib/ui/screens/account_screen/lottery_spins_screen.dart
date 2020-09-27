import 'package:flutter/material.dart';

class LotterySpins extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lottery Spins',style: TextStyle(color: Colors.black),),backgroundColor: Colors.white,
        leading:IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,),
          onPressed: () => Navigator.pop(context),),),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Sorry, you don\'t have any rewards right now. Please check back later'),
          ],
        ),
      ),
    );
  }
}