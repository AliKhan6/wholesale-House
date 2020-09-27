import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:resellapp/constants/colors.dart';
import 'package:resellapp/ui/screens/product_details_screen.dart';
import 'package:social_share/social_share.dart';

class CollectionProducts extends StatefulWidget {

  final image1;
  final image2;
  final image3;
  final name;
  final price;
  CollectionProducts({this.image1,this.image2,this.image3,this.name,this.price});
  @override
  _CollectionProductsState createState() => _CollectionProductsState();
}

class _CollectionProductsState extends State<CollectionProducts> {

  bool favourite = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.51,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Colors.grey[400]
          )
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailsScreen(
                image1: widget.image1,
                image2: widget.image2,
                image3: widget.image3,
                name: widget.name,
                price: widget.price,
              ))),
              child: Container(
                  height: 190,
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(widget.image1),
                                  fit: BoxFit.cover
                              )
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Expanded(
                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          image: DecorationImage(
                                              image: AssetImage(widget.image2),
                                              fit: BoxFit.cover
                                          )
                                      ),
                                    ),
                                    Positioned(
                                      top: 6,
                                      left: 90,
                                      child: Material(
                                        elevation: 1.0,
                                        borderRadius: BorderRadius.circular(30),
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              favourite = favourite == false ? true : false;
                                            });
                                          },
                                          child: Container(
                                            width: 43,
                                            height: 43,
                                            child: Center(
                                              child:  favourite == false ? Icon(Icons.favorite_border,color:Colors.black54,size: 28,):
                                              Icon(Icons.favorite,color: pinkColor,size: 28,),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                            ),
                            SizedBox(height: 5.0,),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    image: DecorationImage(
                                        image: AssetImage(widget.image3,),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                            ),

                          ],
                        ),
                      )
                    ],
                  )
              ),
            ),
            SizedBox(height: 15,),
            Text(widget.name),
            SizedBox(height: 10,),
            Text('Starting from ${widget.price}'),
            SizedBox(height: 10,),
            Container(
              height: 40,
              width: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Icon(Icons.directions_bus),
                  Text('Free Shipping')
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.grey[300]
              ),
            ),
            Divider(color: Colors.black54,),
            Row(
              children: <Widget>[
                InkWell(
                    onTap: () {
                      Fluttertoast.showToast(msg: 'Downloaded Successfully', backgroundColor: Colors.black);
                    },
                    child: BottomNavigation(iconData: Icons.arrow_downward, text:'Download',)),
                SizedBox(width: 8.0,),
                InkWell(
                    onTap: () async{
                      await FlutterShare.share(
                        title: 'Wholesale House',
                        linkUrl: widget.image1,
                        chooserTitle: 'Where you want to share',
                      );
                    },
                    child: BottomNavigation(iconData: null, text:'Facebook',)),
                SizedBox(width: 12.0,),
                InkWell(
                    onTap: () async{
                      await FlutterShare.share(
                        title: 'Wholesale House',
                        linkUrl: widget.image1,
                        chooserTitle: 'Where you want to share',
                      );
                    },
                    child: BottomNavigation(iconData: Icons.share, text:'Others',)),
                SizedBox(width: 15.0,),
                Column(
                  children: <Widget>[
                    InkWell(
                      onTap: (){
                        final product = widget.image1;
                        SocialShare.shareWhatsapp(product);
                      },
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Color(0xFF01C463),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: 18,),
                            Image.asset('images/whatsapp.png',width: 25,height: 25,),
                            SizedBox(width: 8,),
                            Text('SHARE NOW',style: TextStyle(color: Colors.white),)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}