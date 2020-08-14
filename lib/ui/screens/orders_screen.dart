import 'package:flutter/material.dart';
import 'package:resellapp/constants/colors.dart';

class OrdersScreen extends StatefulWidget {
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {

  List<String> buttons = ['   All   ',' Ordered ','  Shipped ','  Delivered  ', ' Cancelled ','Exchange', 'Return', 'Others'];
  int selectedButton = 0;

  bool scrollUp = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar:  AppBar(
        elevation: 2.0,
        backgroundColor: Colors.white,
        title: Text('Orders',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search,color: Colors.black,),
              onPressed: (){}
          ),
          IconButton(
              icon: Icon(Icons.shopping_cart,color: Colors.black,),
              onPressed: (){}
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          ///
          /// Upper Half Body
          _upperHalfBody(),
          SizedBox(height: 12.0,),
          ///
          /// Lower Half Body
          _lowerHalfBody(),
        ],
      ),
    );
  }

  ///
  /// Upper Half Body
  _upperHalfBody(){
    return scrollUp == false ? Material(
      elevation: 1.0,
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text('Bonus Tracker ',style: TextStyle(fontWeight: FontWeight.w500),),
                      Text('09 Aug - 16 Aug')
                    ],
                  ),
                  SizedBox(
                    width: 33,
                    child: IconButton(
                        icon: Icon(Icons.keyboard_arrow_up,color: pinkColor,size: 27,),
                        onPressed: (){
                          setState(() {
                            scrollUp = scrollUp == false ? true : false;
                          });
                        }
                    ),
                  )
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('रू 3,000',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  Text(' - ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: pinkColor),),
                  Text('रू 0',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  Text(' = ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: pinkColor),),
                  Text(' रू 3,000',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: pinkColor),)
                ],
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Target Sales (for\n \t\t\tbonus 2%)'),
                  Text('Current Week\nSales(till date)'),
                  Text('Amount Left To\n\tReach Target')
                ],
              ),
              SizedBox(height: 12,),
              Container(
                height: 30.0,
                alignment: Alignment.bottomRight,
                child: FlatButton(
                    onPressed: (){},
                    child: Text('View Details',style: TextStyle(fontSize: 13,color: pinkColor),)
                ),
              )
            ],
          ),
        ),
      ),
    )
    : Material(
      elevation: 1.0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text('Bonus Tracker   ',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12),),
                Text(' Sales to reach Target',style: TextStyle(color: Colors.black54,fontSize: 12),),
                Text('  =  रू 3,000',style: TextStyle(color: pinkColor,fontWeight: FontWeight.w500),)
              ],
            ),
            SizedBox(
              width: 33,
              child: IconButton(
                  icon: Icon(Icons.keyboard_arrow_down,color: pinkColor,size: 27,),
                  onPressed: (){
                    setState(() {
                      scrollUp = scrollUp == false ? true : false;
                    });
                  }
              ),
            )
          ],
        ),
      ),
    );
  }

  /// Lower Half body
  ///
  _lowerHalfBody(){
    return Column(
      children: <Widget>[
        Container(
          height: 60,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: buttons.length,
              itemBuilder: (context, index){
                return Row(
                  children: <Widget>[
                    SizedBox(width: 8.5,),
                    index <= 4 ? InkWell(
                      onTap: (){
                        setState(() {
                          selectedButton = index;
                        });
                      },
                      child: Container(
                        height: 42,
                        decoration: BoxDecoration(
                            color: index == selectedButton ? pinkColor : Colors.white,
                            border: Border.all(width: 1.0, color: Colors.grey[350]),
                            borderRadius: BorderRadius.circular(5.0)
                        ),
                        child: Center(child: Text(buttons[index])),
                      ),
                    ): SizedBox(),
                  ],
                );
              }
          ),
        ),
        Container(
          height: 40,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: buttons.length,
              itemBuilder: (context, index){
                return Row(
                  children: <Widget>[
                    SizedBox(width: 8.5,),
                    index <= 2 ? InkWell(
                      onTap: (){
                        setState(() {
                          selectedButton = index+5;
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width/3.35,
                        height: 42,
                        decoration: BoxDecoration(
                            color: index+5 == selectedButton ? pinkColor : Colors.white,
                            border: Border.all(width: 1.0, color: Colors.grey[350]),
                            borderRadius: BorderRadius.circular(5.0)
                        ),
                        child:  Center(child: Text(buttons[index+5])),
                      ),
                    ) : SizedBox(),
                  ],
                );
              }
          ),
        ),

        SizedBox(height: 12.0,),

        Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 40,
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search,color: Colors.black54,size: 20,),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[350])
              ),
              hintText: 'Search by Customer, Product or Order ID',
              hintStyle: TextStyle(fontSize: 12.0),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[350]),
              ),
            ),
          ),
        ),

        SizedBox(height: 50),

        Icon(Icons.not_listed_location,color: Colors.grey[300],size: 100,),

        SizedBox(height: 50),
        Text('NO ORDERS FOUND',style: TextStyle(fontSize: 16,color: Colors.black54),),
        SizedBox(height: 10),
        Container(
          width: MediaQuery.of(context).size.width/2.4,
          child: FlatButton(
              color: pinkColor,
              onPressed: (){},
              child: Text('BROWSE CATALOGS',style: TextStyle(color: Colors.white,fontSize: 12),)),
        )
      ],
    );
  }
}
