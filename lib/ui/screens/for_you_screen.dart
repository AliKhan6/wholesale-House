import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:resellapp/constants/colors.dart';
import 'package:resellapp/models/products.dart';
import 'package:resellapp/ui/custom_widgets/custom_bottom_navigation_bar.dart';
import 'package:resellapp/ui/screens/cart_screen.dart';
import 'package:resellapp/ui/screens/favourite_screen.dart';
import 'package:resellapp/ui/screens/product_details_screen.dart';
import 'package:social_share/social_share.dart';


class ForYouScreen extends StatefulWidget {

  @override
  _ForYouScreenState createState() => _ForYouScreenState();
}

class _ForYouScreenState extends State<ForYouScreen> {

  /// Variable of products categories
  /// 
  bool favourite = false;
  bool saree = false;
  bool kurta = false;
  bool mensWear = false;
  bool jewellery = false;
  bool suits = false;
  bool westernWear = false;

  String _platformVersion = 'Unknown';
  ///
  /// Filter Variable Requirements
  TextEditingController filterController = TextEditingController();
  String filter;
  @override
  void initState() {
    filterController.addListener(() {
      setState(() {
        filter = filterController.text;
      });
    });
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String platformVersion;
    if (!mounted) return;
    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  void dispose() {
    filterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(top: 30.0),
                    height: 150.0,
                    decoration:BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[300],
                            offset:Offset(0,3),
                            blurRadius: 2,
                            spreadRadius: 2.0,
                          )
                        ]
                    ),
                    child: Padding(
                      padding:EdgeInsets.symmetric(horizontal:15.0),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            ///
                            ///
                            /// App bar
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text('wholesale house',style: TextStyle(color: Colors.pinkAccent,fontSize: 23.0)),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    InkWell(
                                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FavouriteScreen())),
                                        child: Icon(Icons.favorite,color: Colors.black)),
                                    SizedBox(width: 30,),
                                    InkWell(
                                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen())),
                                        child: Icon(Icons.shopping_cart,color: Colors.black))
                                  ],
                                )
                              ],
                            ),
                            ///
                            ///
                            /// Search Bar
                            Container(
                              height: 50,
                              child: TextField(
                                controller: filterController,
                                decoration: InputDecoration(
                                  fillColor: Colors.grey[80],
                                  filled: true,
                                  prefixIcon: Icon(Icons.search,color: Colors.black,),
                                  suffixIcon: Icon(Icons.camera_alt,color: Colors.black),
                                  hintText: 'Search by product code',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                ),
                SizedBox(height: 15,),
                ///
                ///
                /// Product Categories
                Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: products.length,
                    itemBuilder: (context, index){
                      return Column(
                        children: <Widget>[
                          index == 0 ? Container(
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 15.0,left: 15,right: 15),
                              child: Container(
                                height: 350,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey[300],
                                        offset:Offset(0,5),
                                        blurRadius: 5,
                                        spreadRadius: 2.0,
                                      )
                                    ]
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Text('Select a category you would like to try'),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        InkWell(
                                            onTap: (){
                                              setState(() {
                                                saree = saree == false ? true : false;
                                                filter = 'Saree';
                                                if(saree == true){
                                                  kurta = mensWear = jewellery = suits = westernWear = false;
                                                }
                                              });
                                            },
                                            child: InActiveProductCategories(productName: 'Saree', productImage: 'images/foryou_screen/women_saree.png', productCategories: saree )),
                                        InkWell(
                                            onTap: (){
                                              setState(() {
                                                kurta = kurta == false ? true : false;
                                                filter = 'Kurti';
                                                if(kurta == true){
                                                  saree = mensWear = jewellery = suits = westernWear = false;
                                                }
                                              });
                                            },
                                            child: InActiveProductCategories(productName: 'Kurti', productImage: 'images/foryou_screen/women_kurta.png',productCategories: kurta,)),
                                        InkWell(
                                            onTap: (){
                                              setState(() {
                                                mensWear = mensWear == false ? true : false;
                                                filter = "men's Wear";
                                                if(mensWear == true){
                                                  kurta = saree = jewellery = suits = westernWear = false;
                                                }
                                              });
                                            },
                                            child: InActiveProductCategories(productName: 'Men\'s Wear', productImage: 'images/foryou_screen/men.png',productCategories: mensWear,)),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        InkWell(
                                            onTap: (){
                                              setState(() {
                                                jewellery = jewellery == false ? true : false;
                                                filter = 'Jewellery';
                                                if(jewellery == true){
                                                  kurta = mensWear = saree = suits = westernWear = false;
                                                }
                                              });
                                            },
                                            child: InActiveProductCategories(productName: 'Jewellery', productImage: 'images/foryou_screen/jewellary.png',productCategories: jewellery,)),
                                        InkWell(
                                            onTap: (){
                                              setState(() {
                                                suits = suits == false ? true : false;
                                                filter = 'Suits';
                                                if(suits == true){
                                                  kurta = mensWear = jewellery = saree = westernWear = false;
                                                }
                                              });
                                            },
                                            child: InActiveProductCategories(productName: 'Suits', productImage: 'images/foryou_screen/men_suits.png',productCategories: suits,)),
                                        InkWell(
                                            onTap: (){
                                              setState(() {
                                                westernWear = westernWear == false ? true : false;
                                                filter = 'Western Wear';
                                                if(westernWear == true){
                                                  kurta = mensWear = jewellery = suits = saree = false;
                                                }
                                              });
                                            },
                                            child: InActiveProductCategories(productName: 'Western Wear', productImage: 'images/foryou_screen/women_western.png', productCategories: westernWear,)),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ) : Container(),

                          filter == null || filter == "" ?
                          Container(
                            height: MediaQuery.of(context).size.height*0.5,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                top: BorderSide(
                                    color: Colors.grey,
                                    width: 0.5
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailsScreen(
                                      image1: products[index].image1,
                                      image2: products[index].image2,
                                      image3: products[index].image3,
                                      name: products[index].name,
                                      price: products[index].price,
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
                                                        image: AssetImage(products[index].image1),
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
                                                                    image: AssetImage(products[index].image2),
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
                                                              child: InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    products[index].favourite = products[index].favourite == false ? true : false;
                                                                    if(products[index].favourite == true){
                                                                      addFavouriteListProduct(products[index]);
                                                                      Fluttertoast.showToast(msg: 'Catalog Saved in your Wishlist',backgroundColor: Colors.black);
                                                                    }else{
                                                                      removeFavouriteListProduct(products[index]);
                                                                      Fluttertoast.showToast(msg: 'Catalog Removed from your Wishlist',backgroundColor: Colors.black);
                                                                    }
                                                                  });
                                                                },
                                                                child: Container(
                                                                  width: 43,
                                                                  height: 43,
                                                                  child: Center(
                                                                    child:  products[index].favourite == false ? Icon(Icons.favorite_border,color:Colors.black54,size: 28,):
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
                                                              image: AssetImage(products[index].image3,),
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
                                  Text(products[index].name),
                                  SizedBox(height: 10,),
                                  Text('Starting from ${products[index].price}'),
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
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Expanded(
                                        child: Container(
                                          height: 45,
                                          child: GestureDetector(
                                            onTap: () {
                                              String product = products[index].image1;
                                              SocialShare.shareWhatsapp(product);
                                            },
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Image.asset('images/whatsapp1.png',width: 22,height: 22,),
                                                SizedBox(width: 5.0,),
                                                Text('Share Now',style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),)
                                              ],
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                              color: Colors.white70,
                                              borderRadius: BorderRadius.circular(5.0),
                                              border: Border.all(
                                                  width: 1,
                                                  color: Colors.green
                                              )
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 15,),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailsScreen(
                                            image1: products[index].image1,
                                            image2: products[index].image2,
                                            image3: products[index].image3,
                                            name: products[index].name,
                                            price: products[index].price,
                                          ))),
                                          child: Container(
                                            height: 45,
                                            width: 180,
                                            decoration: BoxDecoration(
                                                color: Colors.pinkAccent,
                                                borderRadius: BorderRadius.circular(5.0)
                                            ),
                                            child: Center(child: Text('View products',style: TextStyle(color: Colors.white),)),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                              :
                              products[index].name.contains(filter)
                          ? Container(
                                height: MediaQuery.of(context).size.height*0.5,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border(
                                    top: BorderSide(
                                        color: Colors.grey,
                                        width: 0.5
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      GestureDetector(
                                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailsScreen(
                                          image1: products[index].image1,
                                          image2: products[index].image2,
                                          image3: products[index].image3,
                                          name: products[index].name,
                                          price: products[index].price,
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
                                                            image: AssetImage(products[index].image1),
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
                                                                        image: AssetImage(products[index].image2),
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
                                                                  child: InkWell(
                                                                    onTap: () {
                                                                      setState(() {
                                                                        products[index].favourite = products[index].favourite == false ? true : false;
                                                                        if(products[index].favourite == true){
                                                                          addFavouriteListProduct(products[index]);
                                                                          Fluttertoast.showToast(msg: 'Catalog Saved in your Wishlist',backgroundColor: Colors.black);
                                                                        }else{
                                                                          removeFavouriteListProduct(products[index]);
                                                                          Fluttertoast.showToast(msg: 'Catalog Removed from your Wishlist',backgroundColor: Colors.black);
                                                                        }
                                                                      });
                                                                    },
                                                                    child: Container(
                                                                      width: 43,
                                                                      height: 43,
                                                                      child: Center(
                                                                        child:  products[index].favourite == false ? Icon(Icons.favorite_border,color:Colors.black54,size: 28,):
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
                                                                  image: AssetImage(products[index].image3,),
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
                                      Text(products[index].name),
                                      SizedBox(height: 10,),
                                      Text('Starting from ${products[index].price}'),
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
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          Expanded(
                                            child: Container(
                                              height: 45,
                                              child: GestureDetector(
                                                onTap: () async{
                                                  String product = products[index].image1;
                                                  SocialShare.shareWhatsapp(product);
                                                },
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Image.asset('images/whatsapp1.png',width: 22,height: 22,),
                                                    SizedBox(width: 5.0,),
                                                    Text('Share Now',style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),)
                                                  ],
                                                ),
                                              ),
                                              decoration: BoxDecoration(
                                                  color: Colors.white70,
                                                  borderRadius: BorderRadius.circular(5.0),
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Colors.green
                                                  )
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 15,),
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailsScreen(
                                                image1: products[index].image1,
                                                image2: products[index].image2,
                                                image3: products[index].image3,
                                                name: products[index].name,
                                                price: products[index].price,
                                              ))),
                                              child: Container(
                                                height: 45,
                                                width: 180,
                                                decoration: BoxDecoration(
                                                    color: Colors.pinkAccent,
                                                    borderRadius: BorderRadius.circular(5.0)
                                                ),
                                                child: Center(child: Text('View products',style: TextStyle(color: Colors.white),)),
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                                  : Container()
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: CustomBottomNavigationBar(index: 0,),
        );
  }
}
///
///
/// Categories you would like
class InActiveProductCategories extends StatelessWidget {
  final productName;
  final productImage;
  final productCategories;
  InActiveProductCategories({this.productName,this.productImage,this.productCategories});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            border: Border.all(color: productCategories == false ? Colors.grey[200] : pinkColor),
            borderRadius: BorderRadius.circular(60),
            image: DecorationImage(
              image: AssetImage(productImage),
            ),
          ),
        ),
        SizedBox(height: 10,),
        Text(productName,style: TextStyle(color: productCategories == false ? Colors.black : pinkColor),)
      ],
    );
  }
}

