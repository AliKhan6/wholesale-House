import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:resellapp/constants/colors.dart';
import 'package:resellapp/models/products.dart';
import '../product_details_screen.dart';


class WishListScreen extends StatefulWidget {
  @override
  _WishListScreenState createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  bool isSwitched = false;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        isSwitched == false || favouriteList.isEmpty ? Container(
          height: MediaQuery.of(context).size.height * 0.435,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 30),
            child: Column(
              children: <Widget>[
                Icon(Icons.favorite_border,size: 70,color: Colors.black26,),
                SizedBox(height: 10.0,),
                isSwitched == false ? Column(
                  children: <Widget>[
                    Text('Your Wish list is not public.'),
                    SizedBox(height: 5.0,),
                    Text('Change the settings below to make Wish list public',style: TextStyle(color: Colors.black54),),
                  ],
                ) :
                    Column(
                      children: <Widget>[
                        Text("\t\t\t\t\tyou haven't saved any catalogs to Wishlist! \n Just click ❤️ on catalogs to save them to"
                            " wishlist\n \t\t\t\tand share them later with your customers."),

                        SizedBox(height: 30,),
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              gradient: LinearGradient(colors: [Colors.pinkAccent,Colors.pink[200]])
                          ),
                          child: FlatButton(
                              onPressed: (){},
                              child: Text('SHOW ME CATALOGS',style: TextStyle(color: Colors.white,fontSize: 15.0),)
                          ),
                        )
                      ],
                    )
              ],
            ),
          ),
        )
            :
        Container(
          height: MediaQuery.of(context).size.height * 0.497,
          child: ListView.builder(
            itemCount: favouriteList.length,
              itemBuilder: (context, index){
                return Container(
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
                            image1: favouriteList[index].image1,
                            image2: favouriteList[index].image2,
                            image3: favouriteList[index].image3,
                            name: favouriteList[index].name,
                            price: favouriteList[index].price,
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
                                              image: AssetImage(favouriteList[index].image1),
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
                                                          image: AssetImage(favouriteList[index].image2),
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
                                                    child: Container(
                                                      width: 43,
                                                      height: 43,
                                                      child: Center(
                                                        child: InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                favouriteList[index].favourite = favouriteList[index].favourite == false ? true : false;
                                                                if(favouriteList[index].favourite == false){
                                                                  removeFavouriteListProduct(favouriteList[index]);
                                                                  Fluttertoast.showToast(msg: 'Catalog Removed from your Wishlist',backgroundColor: Colors.black);
                                                                }
                                                              });
                                                            },
                                                          child:  Icon(Icons.favorite,color: pinkColor,size: 28,),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                )
                                              ],
                                            )
                                        ),
                                        SizedBox(height: 5.0,),
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.grey[300],
                                                image: DecorationImage(
                                                    image: AssetImage(favouriteList[index].image3,),
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
                        Text(favouriteList[index].name),
                        SizedBox(height: 10,),
                        Text('Starting from ${favouriteList[index].price}'),
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
                                  onTap: () {},
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
                                  image1: favouriteList[index].image1,
                                  image2: favouriteList[index].image2,
                                  image3: favouriteList[index].image3,
                                  name: favouriteList[index].name,
                                  price: favouriteList[index].price,
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
                );
              }
          ),
        ),

        isSwitched == true ? Container() : Container(
          alignment: Alignment.center,
          height: 45,
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Make my Wish list public',style: TextStyle(fontWeight: FontWeight.w400),),
                Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  },
                  activeColor: Colors.pink,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}