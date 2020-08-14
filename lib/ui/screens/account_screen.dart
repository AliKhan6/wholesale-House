import 'package:flutter/material.dart';
import 'package:resellapp/constants/colors.dart';
import 'package:resellapp/services/account_screen_data.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 3.0,
        backgroundColor: Colors.white,
        title: Text('Account',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400),),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search,color: Colors.black,),
              onPressed: (){}
              ),
          IconButton(
              icon: Icon(Icons.shopping_cart,color: Colors.black,),
              onPressed: (){}
          ),
          IconButton(
              icon: Icon(Icons.more_vert,color: Colors.black,),
              onPressed: (){}
          ),
        ],
      ),

      body: Column(
        children: <Widget>[
          
          /// upper Half Screen
          _dpAndProfileHalfScreen(context),
          SizedBox(height: 10.0),
          
          /// Lower Half Screen ( Scrolling body) 
          _scrollingBody(context)
        ],
      ),
    );
  }
  
  _dpAndProfileHalfScreen(context){
    return  Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0,horizontal: 8.0),
          child: Material(
            elevation: 2.0,
            child: Container(
              height: 70.0,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(width: 20.0,),
                      Stack(
                        children: <Widget>[
                          CircleAvatar(
                            maxRadius: 25.0,
                            backgroundImage: AssetImage('images/ali.jpg'),
                          ),
                          Positioned(
                            top: 32.0,
                            left: 32.0,
                            child: Container(
                              height: 18.0,
                              width: 18.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                color: Colors.grey.withOpacity(0.8),
                              ),
                              child: GestureDetector(
                                  onTap: (){},
                                  child: Icon(Icons.camera_enhance,color: Colors.black,size: 10.0,)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 15.0,),
                      Text('+923119160789',style: TextStyle(color: pinkColor,fontWeight: FontWeight.w700,fontSize: 16),)
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios,color: pinkColor,size: 15,),
                  )
                ],
              ),
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Material(
            elevation: 2.0,
            child: Container(
                padding: EdgeInsets.only(top: 15.0),
                height: 65.0,
                color: Colors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text('Your Profile is 50% complete.',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13.0),),
                        SizedBox(
                          width: MediaQuery.of(context).size.width/1.6,
                          height: 30.0,
                          child: SliderTheme(
                            child: Slider(
                                activeColor: pinkColor,
                                inactiveColor: Colors.grey[300],
                                value: 50.0,
                                min: 0,
                                max: 100,
                                onChanged: (value){}
                            ),
                            data: SliderTheme.of(context).copyWith(
                                trackHeight: 5.0,
                                thumbColor: Colors.transparent,
                                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0.0)
                            ),
                          ),
                        )
                      ],
                    ),
                    Text('Complete Now',style: TextStyle(color: pinkColor,fontWeight: FontWeight.w500,fontSize: 13.0),),
                    SizedBox(width: 5.0,),
                    Icon(Icons.arrow_forward_ios,color: pinkColor,size: 15,),
                  ],
                )
            ),
          ),
        ),
      ],
    );
  }
  
  _scrollingBody(context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.648,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: accountScreenData.length,
          itemBuilder: (context, index){
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 1.0),
              child: GestureDetector(
                onTap: accountScreenData[index].onPress,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 60.0,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              SizedBox(width: 25.0,),
                              Icon(accountScreenData[index].icon,color: Colors.black,),
                              SizedBox(width: 15.0),
                              Text(accountScreenData[index].title)
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 15.0),
                            child: index == 3 || index == 4 || index == 6 ? Container(
                              height: 20,
                              width: 30,
                              color: pinkColor,
                              child: Center(child: Text('New',style: TextStyle(color: Colors.white,fontSize: 12.0),)),
                            ):
                            Container(),
                          ),
                        ],
                      ),
                    ),
                    index == 12 ? Container(
                      color: Colors.white,
                      height: 200.0,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text('wholesell house',style: TextStyle(color: pinkColor,fontSize: 21.0),),
                          Text('v1.0.0',style: TextStyle(fontSize: 14.0),)
                        ],
                      ),
                    ): Container(),
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}
