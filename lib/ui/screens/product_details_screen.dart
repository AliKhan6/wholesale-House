import 'package:clipboard_manager/clipboard_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:resellapp/constants/colors.dart';
import 'package:resellapp/ui/custom_widgets/custom_appbar.dart';
import 'package:social_share/social_share.dart';

class ProductDetailsScreen extends StatefulWidget {
  final image1;
  final image2;
  final image3;
  final name;
  final price;

  ProductDetailsScreen(
      {this.image1, this.image2, this.image3, this.name, this.price});

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  bool favourite = false;

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height * 0.785;
    return Scaffold(
      body: Column(
        children: <Widget>[
          ///
          /// App Bar
          ///
          CustomAppBar(title: '', leadingIcon: Icons.arrow_back),

          Container(
            height: MediaQuery.of(context).size.height*0.87,
            child: Stack(
              children: <Widget>[
                ListView(
                  physics: BouncingScrollPhysics(),
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(widget.name,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                          SizedBox(height: 10,),
                          Text('Saree Fabric: Cotton Silk',style: TextStyle(fontSize: 15),),
                          SizedBox(height: 10,),
                          Text('Blouse: Running Blouse',style: TextStyle(fontSize: 15),),
                          SizedBox(height: 10,),
                          Text('Blouse Fabric: Cotton Silk',style: TextStyle(fontSize: 15),),
                          SizedBox(height: 10,),
                          Text('Pattern: Printed',style: TextStyle(fontSize: 15),),
                          SizedBox(height: 10,),
                          Text('Multipack: Single',style: TextStyle(fontSize: 15),),
                          SizedBox(height: 10,),
                          Text('Sizes: ',style: TextStyle(fontSize: 15),),
                          SizedBox(height: 10,),
                          Text('Free Size(Saree Length Size: 6.3m, with running blouse)',style: TextStyle(fontSize: 15),),
                          SizedBox(height: 10,),
                          Text('Dispatch: 2-3 Days',style: TextStyle(fontSize: 15),),
                          SizedBox(height: 20,),
                        ],
                      ),
                    ),

                    ///
                    /// Copy and Wishlist Row
                    ///
                    Material(
                      elevation: 2.0,
                      color: Colors.white,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: GestureDetector(
                                onTap: (){
                                  ClipboardManager.copyToClipBoard('${widget.name}').then((value){
                                    Fluttertoast.showToast(msg: "Catalog's Description Saved",backgroundColor: Colors.black);
                                  });
                                },
                                child: Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1.0,color: Colors.grey[350])
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      SizedBox(width: 40,),
                                      IconButton(icon: Icon(Icons.content_copy,color: Colors.black54,)),
                                      Text('Copy',style: TextStyle(color: Colors.blueAccent,fontSize: 17),)
                                    ],
                                  ),
                                ),
                              )
                          ),
                          Expanded(
                              child: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    favourite = favourite == false ? true : false;
                                    if(favourite == true){
                                      Fluttertoast.showToast(msg: 'Catalog Saved in your Wishlist',backgroundColor: Colors.black);
                                    }else{
                                      Fluttertoast.showToast(msg: 'Catalog Removed from your Wishlist',backgroundColor: Colors.black);
                                    }
                                  });
                                },
                                child: Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 1.0,color: Colors.grey[350])
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      SizedBox(width: 40,),
                                      IconButton(icon: favourite == false ? Icon(Icons.favorite_border,color: Colors.black54,size: 27,):
                                      Icon(Icons.favorite,color: pinkColor,size: 27,)),
                                      Text(favourite == false ? 'Wishlist' : 'Wishlisted',style: TextStyle(color: Colors.blueAccent,fontSize: 17),)
                                    ],
                                  ),
                                ),
                              )
                          )
                        ],
                      ),
                    ),
                    Container(height: 10.0,color: Colors.grey[100],),

                    ///
                    /// Product Images and Share Buttons
                    ///
                    ProductImagesAndDetails(image: widget.image1, price: widget.price,),
                    ProductImagesAndDetails(image: widget.image2,price: widget.price,),
                    ProductImagesAndDetails(image: widget.image3,price: widget.price,),
                  ],
                ),

                ///
                /// Custom Bottom Navigation Bar
                ///
                Positioned(
                  top: height,
                  child: Container(
                    color: Colors.white.withOpacity(0.5),
                    height: 90,
                    child: Padding(
                      padding: EdgeInsets.only(left: 12.0,right: 12.0,top: 5.0),
                      child: Row(
                        children: <Widget>[
                          InkWell(
                              onTap: () {
                                Fluttertoast.showToast(msg: 'Downloaded Successfully',backgroundColor: Colors.black);
//                                await ImageDownloader.downloadImage(widget.image1,
//                                  destination: AndroidDestinationType.custom(),
//                                );
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
                          InkWell(
                            onTap: (){
                              String product = widget.image1;
                              SocialShare.shareWhatsapp(product);
                            },
                            child: Column(
                                children: <Widget>[
                                  Container(
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
                                ],
                              ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {

  IconData iconData;
  final text;
  BottomNavigation({this.iconData,this.text});
  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Container(
            height: 38,
            width: 38,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(width: 1.0, color: Colors.black54)
            ),
            child: Center(
                child: iconData == null ?
                Text('f', style: TextStyle(fontSize: 18, color: Colors.black54,fontWeight: FontWeight.bold),)
                : Icon(iconData,color: Colors.black54,size: 17,)),
          ),
          Text(text ,style: TextStyle(color: Colors.black54,fontSize: 13),)
        ]
    );
  }
}

class ProductImagesAndDetails extends StatelessWidget {

  final image;
  final price;
  ProductImagesAndDetails({this.image,this.price});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ///
        ///Products Images
        ///
        Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  color: Colors.white,
                  alignment: Alignment.center,
                  height: 250,
                  child: Image.asset(image),
                ),
                SizedBox(height: 20,),
                Text('Banarasi woven cottan silk design saree',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                SizedBox(height: 10,),
                Text(price),
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
                SizedBox(height: 10,),
                Text('Trusted',style: TextStyle(color: pinkColor,fontSize: 16,fontWeight: FontWeight.w500),),
                SizedBox(height: 10,),
              ],
            ),
          ),
        ),

        ///
        /// Share buttons
        ///
        Material(
          elevation: 2.0,
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Expanded(
                  child: InkWell(
                    onTap: () async{
                      await FlutterShare.share(
                        title: 'Wholesale House',
                        linkUrl: image,
                        chooserTitle: 'Where you want to share',
                      );
                    },
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1.0,color: Colors.grey[350])
                      ),
                      child: Row(
                        children: <Widget>[
                          SizedBox(width:  5,),
                          Container(
                              height: 32,
                              width: 32,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(width: 1.0)
                              ),
                              child: Icon(Icons.share,size: 16,)),
                          SizedBox(width: 5.0,),
                          Text('SHARE ON OTHERS',style: TextStyle(fontSize: 13),)
                        ],
                      ),
                    ),
                  )
              ),
              Expanded(
                  child: InkWell(
                    onTap: (){
                      String product = image;
                      SocialShare.shareWhatsapp(product);
                    },
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1.0,color: Colors.grey[350])
                      ),
                      child: Row(
                        children: <Widget>[
                          SizedBox(width: 5,),
                         Image.asset('images/whatsapp1.png',width: 28,height: 28,),
                          SizedBox(width: 5.0,),
                          Text('SHARE ON WHATSAPP',style: TextStyle(fontSize: 13),)
                        ],
                      ),
                    ),
                  )
              )
            ],
          ),
        ),
        Container(height: 10.0,color: Colors.grey[100],),
      ],
    );
  }
}

