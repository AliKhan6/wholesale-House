import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {

  List list;
  String selectedValue;
  final hintText;

  CustomDropDown({this.list, this.selectedValue, this.hintText});

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Container(
        height: 65.0,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width / 1.28,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    hint: Text(widget.hintText),
                    value:widget.selectedValue,
                    iconSize: 0.0,
                    style: TextStyle(color: Colors.black),
                    onChanged: (newValue) {
                      setState(() {
                        widget.selectedValue = newValue;
                      });
                    },
                    items: widget.list.map((value) {
                      return DropdownMenuItem<String>(
                        child: Text(value),
                        value: value,
                      );
                    }).toList(),
                  ),
                ),
              ),
              Icon(Icons.arrow_drop_down,size: 30,),
            ],
          ),
        ),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(5.0)
        ),
      ),
    );
  }
}