import 'package:flutter/material.dart';
import 'package:resellapp/models/contact_info_text_fields.dart';

class ContactScreen extends StatefulWidget {

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  List<String> _locations = ['State', 'Peshawar', 'Lahore', 'Karachi', 'Quetta']; // Option 2
  String selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height*0.72,
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: profileInfo.length,
            itemBuilder: (context, index){
              return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 55.0,
                        child: TextField(
                          keyboardType: index ==1 || index == 4 ? TextInputType.number : TextInputType.text,
                          decoration: InputDecoration(
                              labelText: profileInfo[index].hintText,
                              hintText: index == 1 ? '+923119160789' :'' ,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.pinkAccent),
                                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              ),
                              suffixIcon: index == 8 ? Icon(Icons.keyboard_arrow_down) : Icon(Icons.keyboard_arrow_down,size: 0.0,)
                          ),
                        ),
                      ),

                      index == 5 ? Padding(
                        padding: EdgeInsets.only(top: 4.0),
                        child: Text('Flat/House No./Building',style: TextStyle(color: Colors.black54),),
                      ): Container(),

                      index == 6 ? Padding(
                        padding: EdgeInsets.only(top: 4.0),
                        child: Text('Street/Colony',style: TextStyle(color: Colors.black54),),
                      ): Container(),

                      index == 7 ? Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Container(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: MediaQuery.of(context).size.width / 1.28,
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: selectedValue == null ? 'State' : selectedValue,
                                      iconSize: 0.0,
                                      style: TextStyle(color: Colors.black54),
                                      onChanged: (newValue) {
                                        setState(() {
                                          selectedValue = newValue;
                                        });
                                        print(selectedValue);
                                      },
                                      items: _locations.map((value) {
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
                          height: 60,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(5.0)
                          ),
                        ),
                      ) : Container()
                    ],
                  )
              );
            }
        )
    );
  }
}
