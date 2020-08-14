import 'package:flutter/material.dart';

class CollectionScreen extends StatefulWidget {
  @override
  _CollectionScreenState createState() => _CollectionScreenState();
}

class _CollectionScreenState extends State<CollectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4.0,
        backgroundColor: Colors.white,
        title: Text('Collections',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search,color: Colors.black,),
              onPressed: (){}
          ),
          IconButton(
              icon: Icon(Icons.favorite,color: Colors.black,),
              onPressed: (){}
          ),
          IconButton(
              icon: Icon(Icons.shopping_cart,color: Colors.black,),
              onPressed: (){}
          ),
        ],
      ),

      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 15.0),
            child: Row(
              children: <Widget>[
                Expanded(
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
                SizedBox(width: 8.0,),
                ProductCollections(collectionName: 'JEWELLARY', image: 'images/jewellary.jpeg',newItems: '478 New',),
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
    );
  }
}

class ProductCollections extends StatelessWidget {

  final collectionName;
  final image;
  final newItems;
  ProductCollections({this.collectionName, this.image,this.newItems});

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
    );
  }
}
