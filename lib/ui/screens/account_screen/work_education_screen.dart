import 'package:flutter/material.dart';
import 'package:resellapp/constants/colors.dart';
import 'package:resellapp/ui/custom_widgets/custom_drop_down.dart';
import 'package:resellapp/ui/screens/account_screen/add_education_screen.dart';
import 'package:resellapp/ui/screens/account_screen/add_workplace_screen.dart';

class WorkEducationScreen extends StatefulWidget {
  @override
  _WorkEducationScreenState createState() => _WorkEducationScreenState();
}

class _WorkEducationScreenState extends State<WorkEducationScreen> {

  List<String> _education = ['12th Standard or below', 'Bachelors','Masters and above'];
  String selectedGender;

  List<String> _occupation = ['Housewife', 'Teacher', 'Business', 'Student', 'Job/Service', 'Others'];
  String selectedMaritalState;

  List<String> _monthlyIncome = ['Upto रू10,000', 'रू10,000-रू20,000', 'रू20,000-रू50,000', 'रू50,000-रू1,00,000', 'Above रू1,00,000'];
  String selectedKidsNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height*0.72,
        child: ListView(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: <Widget>[
                          CustomDropDown(list: _education, selectedValue: selectedGender, hintText: 'Education',),
                          CustomDropDown(list: _occupation, selectedValue: selectedMaritalState, hintText: 'Occupation',),
                          CustomDropDown(list: _monthlyIncome, selectedValue: selectedKidsNumber, hintText: 'Monthly Income',),
                        ],
                      ),
                    ),

                    SizedBox(height: 20,),

                    InkWell(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AddEducationScreen())),
                      child: Container(
                        height: 50,
                        color: Colors.grey[100],
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: 15,),
                            Icon(Icons.add,color: pinkColor,size: 19,),
                            SizedBox(width: 15,),
                            Text('ADD EDUCATION',style: TextStyle(color: pinkColor,fontSize: 16),),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 20,),

                    InkWell(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AddWorkPlaceScreen())),
                      child: Container(
                        height: 50,
                        color: Colors.grey[100],
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: 15,),
                            Icon(Icons.add,color: pinkColor,size: 19,),
                            SizedBox(width: 15,),
                            Text('ADD A WORKPLACE',style: TextStyle(color: pinkColor,fontSize: 16),),
                          ],
                        ),
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
