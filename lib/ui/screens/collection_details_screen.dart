import 'package:flutter/material.dart';
import 'package:resellapp/ui/custom_widgets/custom_appbar.dart';
import 'package:resellapp/ui/custom_widgets/custom_bottom_navigation_bar.dart';
import 'package:resellapp/ui/screens/collection_product_screen.dart';

class CollectionDetailScreen extends StatefulWidget {
  final title;
  CollectionDetailScreen({this.title});
  @override
  _CollectionDetailScreenState createState() => _CollectionDetailScreenState();
}

class _CollectionDetailScreenState extends State<CollectionDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[

          ///
          /// App Bar
          ///
          CustomAppBar(leadingIcon: Icons.arrow_back, title: widget.title,lastIcon: Icons.shopping_cart,firstIcon: Icons.search,),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 15.0),
            child: Row(
              children: <Widget>[
                ProductCollectionDetail(collectionName: 'NEW ARRIVALS', image: 'images/new_arrivals.jpeg'),
                SizedBox(width: 8.0,),
                ProductCollectionDetail(collectionName: 'JEWELLARY', image: 'images/jewellary.jpeg',newItems: '478 New',),
                SizedBox(width: 8.0,),
                ProductCollectionDetail(collectionName: 'SUITS', image: 'images/suits.jpeg',newItems: '808 New'),
              ],
            ),
          ),

          Row(
            children: <Widget>[
              ProductCollectionDetail(collectionName: 'KIDS', image: 'images/kids.jpeg',newItems: '387 New'),
              SizedBox(width: 8.0,),
              ProductCollectionDetail(collectionName: 'BEAUTY', image: 'images/beauty.jpeg',newItems: '120 New'),
              SizedBox(width: 8.0,),
              ProductCollectionDetail(collectionName: 'MEN SUITS', image: 'images/men.jpeg',newItems: '47 New'),
            ],
          ),
        ],
      ),
    );
  }
}

class ProductCollectionDetail extends StatelessWidget {

  final collectionName;
  final image;
  final newItems;
  Function onTap;
  ProductCollectionDetail({this.collectionName, this.image,this.newItems,this.onTap});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () =>Navigator.push(context, MaterialPageRoute(builder: (context) => CollectionProductScreen(
            title: collectionName,
        ))),
        child: Material(
          elevation: 2.0,
          child: Container(
              height: MediaQuery.of(context).size.height * 0.25,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Container(
                      height: 130,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2,vertical: 2),
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(image),
                              )
                          ),
                        ),
                      )
                  ),
                  SizedBox(height: 10.0,),
                  Text(collectionName,style: TextStyle(fontWeight: FontWeight.w500),),
                  SizedBox(height: 5.0,),
                  newItems == null? Container() : Text(newItems,style: TextStyle(fontWeight: FontWeight.w500,color: Color(0xFFE91EC1)),)
                ],
              )
          ),
        ),
      ),
    );
  }
}
