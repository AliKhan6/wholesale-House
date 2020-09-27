import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resellapp/constants/colors.dart';
import 'package:resellapp/models/account_screen_data.dart';
import 'package:resellapp/ui/custom_widgets/custom_appbar.dart';
import 'package:resellapp/ui/custom_widgets/custom_bottom_navigation_bar.dart';
import 'package:resellapp/ui/screens/account_screen/account_settings_screen.dart';
import 'package:resellapp/ui/screens/account_screen/bank_details_screen.dart';
import 'package:resellapp/ui/screens/account_screen/challenges_screen.dart';
import 'package:resellapp/ui/screens/account_screen/lottery_spins_screen.dart';
import 'package:resellapp/ui/screens/account_screen/notifications_screen.dart';
import 'package:resellapp/ui/screens/account_screen/my_payments_screen.dart';
import 'package:resellapp/ui/screens/account_screen/profile_details_screen.dart';
import 'package:resellapp/ui/screens/account_screen/profile_info_screen.dart';
import 'account_screen/my_shared_catalogs_screen.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {


  File _image;

  Future getCameraImage() async {
    try {
      final imageFile = await ImagePicker.pickImage(source: ImageSource.camera);
      setState(() {
        _image = imageFile;
      });
    } catch (e) {
      setState(() {
        print(e.toString());
      });
    }
  }

  Future getGalleryImage() async {
    var imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = imageFile;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[200],

      body: Column(
        children: <Widget>[

          ///
          /// App Bar
          CustomAppBar(title: 'Account',lastIcon: Icons.more_vert,firstIcon: Icons.search,),

          /// upper Half Screen
          _dpAndProfileHalfScreen(context),
          SizedBox(height: 10.0),

          /// Lower Half Screen ( Scrolling body)
          _scrollingBody(context)
        ],
      ),

      ///
      /// Bottom Navigation Bar
      bottomNavigationBar: CustomBottomNavigationBar(index: 4,),
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
                          GestureDetector(
                            onTap: (){
                              _modalBottomSheetMenu();
                            },
                            child: _image == null ? CircleAvatar(
                              maxRadius: 25.0,
                              backgroundColor: pinkColor,
                            )
                                :
                            CircleAvatar(
                              maxRadius: 25,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: Image.file(_image,fit: BoxFit.cover,width: 50,height: 50,),
                              ),
                            )
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
                              child: Icon(Icons.camera_enhance,color: Colors.black,size: 10.0,),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 15.0,),
                      InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileDetailScreen()));
                          },
                          child: Text('+0xxxxxxxxx',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w700,fontSize: 16),))
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios,color: pinkColor,size: 15,),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileDetailScreen()));
                    },
                  )
                ],
              ),
            ),
          ),
        ),

        GestureDetector(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileInfoScreen())),
          child: Padding(
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
        ),
      ],
    );
  }

  _scrollingBody(context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.562,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: accountScreenData.length,
          itemBuilder: (context, index){
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 1.0),
              child: GestureDetector(
                onTap: (){
                  index == 0 ? Navigator.push(context, MaterialPageRoute(builder: (context) => BankDetailsScreen())) :
                  index == 1 ? Navigator.push(context, MaterialPageRoute(builder: (context) => MySharedCatalogsScreen())) :
                  index == 2 ? Navigator.push(context, MaterialPageRoute(builder: (context) => MyPayment())):
                  index == 3 ? Navigator.push(context, MaterialPageRoute(builder: (context) => Challenges())) :
                  index == 4 ? Navigator.push(context, MaterialPageRoute(builder: (context) => LotterySpins())):
                  index == 5 ? Navigator.push(context, MaterialPageRoute(builder: (context) => Settings())) :
                  Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationScreen()));
                },
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
                              accountScreenData[index].image == null ? Icon(accountScreenData[index].icon) :
                              Image.asset(accountScreenData[index].image,color: Colors.black,width: 22,height: 22,),
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
                    index == 7 ? Container(
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

  ///
  /// Bottom sheet
  void _modalBottomSheetMenu(){
    showModalBottomSheet(
        context: context,
        builder: (builder){
          return Container(
            height: 200.0,
            child: Container(
              padding: EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Edit Photo',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                        IconButton(icon:Icon(Icons.close), onPressed: (){
                            Navigator.pop(context);
                        },)
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            CircleAvatar(
                              minRadius: 30,
                              backgroundColor: Color(0xFF00B65A),
                              child: IconButton(icon: Icon(Icons.photo_size_select_actual ,color: Colors.white,size: 27,),
                                  onPressed: (){
                                    getGalleryImage();
                                  }),
                            ),
                            SizedBox(height: 10,),
                            Text('Gallery',style: TextStyle(color: Colors.black87),),
                          ],
                        ),

                        Column(
                          children: <Widget>[
                            CircleAvatar(
                              minRadius: 30,
                              backgroundColor: Color(0xFF1C5AED),
                              child: IconButton(icon: Icon(Icons.camera_enhance ,color: Colors.white,size: 27,),
                                  onPressed: (){
                                    getCameraImage();
                                  }),
                            ),
                            SizedBox(height: 10,),
                            Text('Camera',style: TextStyle(color: Colors.black87),),
                          ],
                        ),

                        Column(
                          children: <Widget>[
                            CircleAvatar(
                              minRadius: 30,
                              backgroundColor: Color(0xFFFE2975),
                              child: IconButton(icon: Icon(Icons.delete ,color: Colors.white,size: 27,),
                                  onPressed: (){
                                    setState(() {
                                      _image = null;
                                    });
                                  }),
                            ),
                            SizedBox(height: 10,),
                            Text('Remove',style: TextStyle(color: Colors.black87),),
                          ],
                        )
                      ],
                    )
                  ],
                )
            ),
          );
        }
    );
  }
}
