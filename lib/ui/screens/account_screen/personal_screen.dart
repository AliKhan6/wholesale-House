import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:resellapp/ui/custom_widgets/custom_drop_down.dart';

class PersonalScreen extends StatefulWidget {

  @override
  _PersonalScreenState createState() => _PersonalScreenState();
}


class _PersonalScreenState extends State<PersonalScreen> {

  /// Variables
  DateTime _dateTime = DateTime(2010,09,06);
  DatePicker datePicker = DatePicker();

  List<String> _gender = ['Male', 'Female','Others'];
  String selectedGender;
  
  List<String> _maritalState = ['Married', 'Single', 'Divorced/Separated/Widowed'];
  String selectedMaritalState;

  List<String> _numberOfKids = ['None', 'One', 'Two', 'More than two'];
  String selectedKidsNumber;


  @override
  Widget build(BuildContext context) {

    AlertDialog alert = AlertDialog(
      title: Text('Select Date of Birth'),
      actions: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          child: DatePickerWidget(
            onCancel: () => null,
            minDateTime: DateTime(1950,01,01),
            maxDateTime: DateTime(2050,01,01),
            pickerTheme: DateTimePickerTheme(
              cancel: Padding(
                padding: EdgeInsets.only(left: 120.0),
                child: Text('Cancel',style: TextStyle(color: Color(0xFFF75AAB),fontSize: 16),),
              ),
              confirm: Text('Ok',style: TextStyle(color: Color(0xFFF75AAB),fontSize: 16),),
              itemTextStyle: TextStyle(color: Colors.black,fontSize: 18),
              pickerHeight: 123.0,
              itemHeight: 45.0,
            ),
            onChange: (dateTime, selectedIndex) {
            setState(() {
              _dateTime = dateTime;
            });
            },
          ),
        ),
      ],
    );


    return Container(
        height: MediaQuery.of(context).size.height*0.72,
        child: ListView(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      
                      ///
                      /// Date of birth field
                      ///
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: GestureDetector(
                          onTap: (){
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return alert;
                                }
                            );
                          },
                          child: Container(
                            height: 65.0,
                            child: Padding(
                              padding: EdgeInsets.only(left: 12.0,right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  _dateTime == DateTime(2010,09,06) ? Text('Date of Birth',style: TextStyle(color: Colors.black54),)
                                      :
                                  Text(
                                    '${_dateTime.day.toString().padLeft(2, '0')}/${_dateTime.month.toString().padLeft(2, '0')}/${_dateTime.year}',
                                    style: TextStyle(color: Colors.black),
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
                        ),
                      ),

                      CustomDropDown(list: _gender, selectedValue: selectedGender, hintText: 'Gender',),
                      CustomDropDown(list: _maritalState, selectedValue: selectedMaritalState, hintText: 'Languages Spoken',),
                      CustomDropDown(list: _maritalState, selectedValue: selectedMaritalState, hintText: 'Marital State',),
                      CustomDropDown(list: _numberOfKids, selectedValue: selectedKidsNumber, hintText: 'Number Of Kids',),

                      SizedBox(height: 20,),
                      TextField(
                        maxLines: 3,
                        decoration: InputDecoration(
                            labelText: 'About You',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.pinkAccent),
                              borderRadius: BorderRadius.all(Radius.circular(5.0)),
                            ),
                        ),
                      ),
                    ],
                  )
              ),
            ],
        )
    );
  }
}

