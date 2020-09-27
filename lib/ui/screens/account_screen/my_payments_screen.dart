import 'package:flutter/material.dart';

class MyPayment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Payments',style: TextStyle(color: Colors.black),),backgroundColor: Colors.white,leading:Icon(Icons.arrow_back,color: Colors.black,),),
      body: Center(
        child: Text('You don\'t have any payment messages'),
      ),
    );
  }
}