import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resellapp/services/contact_info_text_fields.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

class PersonalScreen extends StatefulWidget {

  @override
  _PersonalScreenState createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {

  DatePicker datePicker = DatePicker();
  List<String> _gender = ['Male', 'Female','Others'];
  String selectedGender;
  
  List<String> _maritalState = ['Married', 'Single', 'Divorced/Separated/Widowed'];
  String selectedMaritalState;

  List<String> _numberOfKids = ['None', 'One', 'Two', 'More than two'];
  String selectedKidsNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height*0.72,
        child: ListView(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      PersonalScreenDropDown(list: _gender, selectedValue: selectedGender, hintText: 'Gender',),
                      PersonalScreenDropDown(list: _maritalState, selectedValue: selectedMaritalState, hintText: 'Marital State',),
                      PersonalScreenDropDown(list: _numberOfKids, selectedValue: selectedKidsNumber, hintText: 'Number Of Kids',),

                          SizedBox(height: 10.0,),
                          Container(
                            height: 200,
                            child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        initialDateTime: DateTime(1969, 1, 1),
                        onDateTimeChanged: (DateTime newDateTime) {
                            // Do something
                        },
                      ),
                          )
                    ],
                  )
              ),
            ],
        )
    );
  }
}


class PersonalScreenDropDown extends StatefulWidget {

  List list;
  String selectedValue;
  final hintText;

  PersonalScreenDropDown({this.list, this.selectedValue, this.hintText});

  @override
  _PersonalScreenDropDownState createState() => _PersonalScreenDropDownState();
}

class _PersonalScreenDropDownState extends State<PersonalScreenDropDown> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Container(
        height: 70.0,
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
                    style: TextStyle(color: Colors.black54),
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
