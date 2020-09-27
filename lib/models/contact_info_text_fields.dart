import 'package:flutter/material.dart';

class ContactInfoTextFields{
  String hintText;
  Function onChange;

  ContactInfoTextFields({this.hintText, this.onChange});
}

List<ContactInfoTextFields> profileInfo = [name, number, email, businessName, pinCode, address1, address2, city];

ContactInfoTextFields name  = ContactInfoTextFields(
  hintText: 'Full Name',
  onChange: (){},
);

ContactInfoTextFields number  = ContactInfoTextFields(
  hintText: 'Mobile Number',
  onChange: (){},
);

ContactInfoTextFields email  = ContactInfoTextFields(
  hintText: 'Email',
  onChange: (){},
);

ContactInfoTextFields businessName  = ContactInfoTextFields(
  hintText: 'Business Name',
  onChange: (){},
);

ContactInfoTextFields pinCode  = ContactInfoTextFields(
  hintText: 'Pin Code',
  onChange: (){},
);

ContactInfoTextFields address1  = ContactInfoTextFields(
  hintText: 'Address 1',
  onChange: (){},
);

ContactInfoTextFields address2  = ContactInfoTextFields(
  hintText: 'Address 2',
  onChange: (){},
);

ContactInfoTextFields city  = ContactInfoTextFields(
  hintText: 'City',
  onChange: (){},
);

ContactInfoTextFields state  = ContactInfoTextFields(
  hintText: 'State',
  onChange: (){},
);