import 'package:flutter/material.dart';
import 'package:resellapp/ui/custom_widgets/custom_appbar.dart';
import 'package:resellapp/ui/custom_widgets/custom_bottom_navigation_bar.dart';
import 'package:resellapp/ui/screens/collection_details_screen.dart';

class CollectionScreen extends StatefulWidget {
  @override
  _CollectionScreenState createState() => _CollectionScreenState();
}

class _CollectionScreenState extends State<CollectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[

          ///
          /// App Bar
          CustomAppBar(title: 'Collections',leadingIcon: null,lastIcon: Icons.shopping_cart,firstIcon: Icons.search,),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 15.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: InkWell(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CollectionDetailScreen(
                      title: 'Best Sellers',
                    ))),
                    child: Material(
                      elevation: 2.0,
                      child: Container(
                          height: MediaQuery.of(context).size.height * 0.25,
                          color: Colors.white,
                          child: Column(
                            children: <Widget>[
                              Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage('images/frame.jpeg'),
                                          fit: BoxFit.cover
                                      )
                                  ),
                                  height: 130,
                                  child: Stack(
                                    children: <Widget>[
                                      Padding(
                                          padding: EdgeInsets.only(left: 16.0,right: 16, top: 10),
                                          child: Container(
                                            height: 111,
                                            color: Colors.green.shade700,
                                          )
                                      ),
                                      Positioned(
                                          left: 25,
                                          top: 45,
                                          child: Text('\t\t\tBEST\nSELLERS',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))
                                    ],
                                  )
                              ),
                              SizedBox(height: 20.0,),
                              Text('BEST SELLERS',style: TextStyle(fontWeight: FontWeight.w500),)
                            ],
                          )
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.0,),
                ProductCollections(collectionName: 'JEWELLERY', image: 'images/jewellary.jpeg',newItems: '478 New'),
                SizedBox(width: 8.0,),
                ProductCollections(collectionName: 'SUITS', image: 'images/suits.jpeg',newItems: '808 New'),
              ],
            ),
          ),

          Row(
            children: <Widget>[
              ProductCollections(collectionName: 'KIDS', image: 'images/kids.jpeg',newItems: '387 New'),
              SizedBox(width: 8.0,),
              ProductCollections(collectionName: 'BEAUTY', image: 'images/beauty.jpeg',newItems: '120 New'),
              SizedBox(width: 8.0,),
              ProductCollections(collectionName: 'MEN SUITS', image: 'images/men.jpeg',newItems: '47 New'),
            ],
          ),
        ],
      ),

      ///
      /// Bottom Navigation Bar
      bottomNavigationBar: CustomBottomNavigationBar(index: 1,),
    );
  }
}

class ProductCollections extends StatelessWidget {

  final collectionName;
  final image;
  final newItems;
  final title;
  ProductCollections({this.collectionName, this.image,this.newItems,this.title});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CollectionDetailScreen(
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
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/frame.jpeg'),
                      fit: BoxFit.cover
                    )
                  ),
                  height: 130,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15,vertical: 9),
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
                Text(newItems,style: TextStyle(fontWeight: FontWeight.w500,color: Color(0xFFE91EC1)),)
              ],
            )
          ),
        ),
      ),
    );
  }
}
