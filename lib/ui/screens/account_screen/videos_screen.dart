import 'package:flutter/material.dart';

class VideoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.425,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 30),
        child: Column(
          children: <Widget>[
            Icon(Icons.video_library,size: 70,color: Colors.black26,),
            SizedBox(height: 10.0,),
            Text('You have not posted any video.',style: TextStyle(color: Colors.black54),)
          ],
        ),
      ),
    );
  }
}