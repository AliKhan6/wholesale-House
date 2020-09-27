import 'package:flutter/material.dart';
import 'package:resellapp/ui/custom_widgets/custom_appbar.dart';
import 'package:resellapp/ui/custom_widgets/collection_products.dart';

class CollectionProductScreen extends StatefulWidget {

  final title;
  CollectionProductScreen({this.title});
  @override
  _CollectionProductScreenState createState() => _CollectionProductScreenState();
}

class _CollectionProductScreenState extends State<CollectionProductScreen> {

  bool isSwitch = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: <Widget>[
          CustomAppBar(leadingIcon: Icons.arrow_back,title: widget.title,firstIcon: Icons.search,),
          SizedBox(height: 8.0,),
          Container(
            height: 80,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Notification from this collection',style: TextStyle(fontSize: 16),),
                  Container(
                    height: 45,
                    child: Switch(
                      value: isSwitch,
                      onChanged: (value) {
                        setState(() {
                          isSwitch = value;
                        });
                      },
                      activeColor: Colors.pink,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.748,
            child: ListView(
              children: <Widget>[
                CollectionProducts(
                  image1: 'images/foryou_screen/women.png',
                  image2: 'images/foryou_screen/women2.png',
                  image3: 'images/foryou_screen/women3.png',
                  name: 'Abhisarike Drishya Kurtis',
                  price: '\$ 499',
                ),
                CollectionProducts(
                  image1: 'images/foryou_screen/men_suits.png',
                  image2: 'images/foryou_screen/men_suits.png',
                  image3: 'images/foryou_screen/men_suits.png',
                  name: 'Aagam Fablous Sarees',
                  price: '\$ 599',
                ),
                CollectionProducts(
                  image1: 'images/foryou_screen/jewellary.png',
                  image2: 'images/foryou_screen/jewellary.png',
                  image3: 'images/foryou_screen/jewellary.png',
                  name: 'Branded Jewellery For You',
                  price: '\$ 1099',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
