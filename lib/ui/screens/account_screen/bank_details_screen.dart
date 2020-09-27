import 'package:flutter/material.dart';

class BankDetailsScreen extends StatelessWidget {
  String id='ProductDetails';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ///
            ///
            /// App Bar
            Container(
              height: MediaQuery.of(context).size.height * 0.13,
            ),
            ///
            ///
            /// Select image
            GestureDetector(
              onTap: (){
                _imageSelectModalBottomSheet(context);
              },
              child: Stack(
                children: [
                  Container(height: MediaQuery.of(context).size.height * 0.2,
                    color: Colors.grey,
                    child: Center(child: Icon(Icons.image,size: 100,color: Colors.white70,)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 120),
                    child: Center(child: Text("Add PassBook/Cheque photo",style: TextStyle(color: Colors.white,fontSize: 20),)),
                  ),
                ],
              ),
            ),
            ///
            ///
            /// Data form user about account
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              child: ListView(
                children: [
                  AccountInputField('ACCOUNT NUMBER'),
                  AccountInputField('CONFIRM ACCOUNT NUMBER'),
                  AccountInputField('ACCOUNT HOLDER\'S NAME'),
                  AccountInputField('CODE'),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 100),
                    child: FlatButton(
                      color: Colors.pink,
                      textColor: Colors.white,
                      padding: EdgeInsets.all(8.0),
                      onPressed: () {},
                      child: Text('SUBMIT'),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///
///
/// Select image from Camera or Gallery
void _imageSelectModalBottomSheet(context){
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context){
        return Container(
          decoration: BoxDecoration(
//              borderRadius:BorderRadius.only(
//                  topLeft:Radius.circular(40.0),
//                  topRight:Radius.circular(40.0))
          ),
          height:MediaQuery.of(context).size.height * 0.1,
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(Icons.camera_alt,size: 30,),
              VerticalDivider(color: Colors.grey,),
              Icon(Icons.image,size: 30,),
            ],
          ),
        );
      }
  );
}

///
///
/// Account input text field
class AccountInputField extends StatelessWidget {
  String _labelText;
  AccountInputField(this._labelText);
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.pink,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.pink),

        ),
        labelText: _labelText,
        focusColor: Colors.pink,
        filled: true,
      ),
    );
  }
}