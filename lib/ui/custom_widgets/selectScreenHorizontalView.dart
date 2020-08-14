import 'package:flutter/material.dart';

class SelectScreenHorizontalView extends StatefulWidget {
  final screens;
  int selectedScreen;
  SelectScreenHorizontalView({this.screens,this.selectedScreen});

  @override
  _SelectScreenHorizontalViewState createState() => _SelectScreenHorizontalViewState();
}

class _SelectScreenHorizontalViewState extends State<SelectScreenHorizontalView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 30,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemCount: widget.screens.length,
            itemBuilder: (context, index){
              return GestureDetector(
                onTap: (){
                  setState(() {
                    widget.selectedScreen = index;
                  });
                },
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Column(
                        children: <Widget>[
                          Text(widget.screens[index] ,style: TextStyle(
                              color: index == widget.selectedScreen ? Colors.black : Colors.black54
                          )),
                          SizedBox(height: 12.0,),
                          index == widget.selectedScreen ? Container(
                            height: 2.0,
                            width: 60.0,
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
    );
  }
}
