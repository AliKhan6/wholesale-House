import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

class AddWorkPlaceScreen extends StatefulWidget {
  @override
  _AddWorkPlaceScreenState createState() => _AddWorkPlaceScreenState();
}

class _AddWorkPlaceScreenState extends State<AddWorkPlaceScreen> {

  /// Variables
  DateTime _startDate = DateTime(1990,09,06);
  DatePicker startDatePicker = DatePicker();

  DateTime _endDate = DateTime(2020,01,07);
  DatePicker endDatePicker = DatePicker();


  @override
  Widget build(BuildContext context) {

    ///
    /// Alert Dialog for Start Date
    ///
    AlertDialog startDateAlert = AlertDialog(
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
                _startDate = dateTime;
              });
            },
          ),
        ),
      ],
    );

    ///
    /// Alert Dialog for Start Date
    ///
    AlertDialog endDateAlert = AlertDialog(
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
                _endDate = dateTime;
              });
            },
          ),
        ),
      ],
    );


    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 30.0),
            height: MediaQuery.of(context).size.height * 0.13,
            decoration:BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[200],
                    offset:Offset(0,2),
                    blurRadius: 2,
                    spreadRadius: 2.0,
                  )
                ]
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.close,color: Colors.black,size: 20,),
                        onPressed: () => Navigator.pop(context)),
                    Text('Add a Workplace',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18)),
                  ],
                ),
                Row(
                  children: <Widget>[
                    FlatButton(
                      onPressed: (){},
                      child: Text('SAVE',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                    ),
                  ],
                )
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 40),
            child: Column(
              children: <Widget>[
                Container(
                  color: Colors.white,
                  height: 60.0,
                  child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Name of Workplace',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.pinkAccent),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                      )
                  ),
                ),


                SizedBox(height: 20,),
                Container(
                  color: Colors.white,
                  height: 60.0,
                  child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Position',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.pinkAccent),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                      )
                  ),
                ),

                ///
                /// Start Date
                ///
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: GestureDetector(
                    onTap: (){
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return startDateAlert;
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
                            _startDate == DateTime(1990,09,06) ? Text('Start Date',style: TextStyle(color: Colors.black54),)
                                :
                            Text(
                              '${_startDate.day.toString().padLeft(2, '0')}/${_startDate.month.toString().padLeft(2, '0')}/${_startDate.year}',
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


                ///
                /// End Date
                ///
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: GestureDetector(
                    onTap: (){
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return endDateAlert;
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
                            _endDate == DateTime(2020,01,07) ? Text('End Date',style: TextStyle(color: Colors.black54),)
                                :
                            Text(
                              '${_endDate.day.toString().padLeft(2, '0')}/${_endDate.month.toString().padLeft(2, '0')}/${_endDate.year}',
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
