import 'package:flutter/material.dart';
import 'package:resellapp/constants/colors.dart';
import 'package:resellapp/ui/custom_widgets/custom_bottom_navigation_bar.dart';

class HelpScreen extends StatefulWidget {
  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {

  List<String> screens = ['Home', 'Contact Us', 'FAQ', 'Blog'];
  int selectedScreen = 0;

  List<int> videos = [1,2,3];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: <Widget>[
          /// Custom App Bar
          ///
          _customAppBar(),

          ///
          /// Body
          _body(),
        ],
      ),

      ///
      /// Bottom Navigation Bar
      bottomNavigationBar: CustomBottomNavigationBar(index: 3),
    );
  }

  ///
  /// Custom App Bar
  _customAppBar(){
    return Material(
      elevation: 3.0,
      child: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height * 0.19,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 50.0,left: 28,right: 28),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Help',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
//                  Row(
//                    children: <Widget>[
//                      Text('English',style: TextStyle(fontSize: 16,color: pinkColor),),
//                      Icon(Icons.keyboard_arrow_down,color: pinkColor,)
//                    ],
//                  )
                ],
              ),
            ),

            SizedBox(height: 32,),

            Container(
                height: 30,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: screens.length,
                    itemBuilder: (context, index){
                      return GestureDetector(
                        onTap: (){
                          setState(() {
                            selectedScreen = index;
                          });
                        },
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 30.0),
                              child: Row(
                                children: <Widget>[
                                  Text(screens[index] ,style: TextStyle(
                                      color: index == selectedScreen ? Colors.black : Colors.black54,
                                      fontWeight: FontWeight.w500,fontSize: 16
                                  )),
                                  SizedBox(height: 12.0,width: 25,),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                )
            )
          ],
        ),
      ),
    );
  }

  ///
  /// Body
  _body(){
    return Container(
      height: MediaQuery.of(context).size.height * 0.733,
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            color: Colors.grey[100],
            child: Text('MUST WATCH VIDEOS',),
          ),

          Container(
              height: 220,
              color: Colors.white,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: videos.length,
                itemBuilder: (context, index){
                  return Padding(
                    padding: EdgeInsets.only(left: 20.0,top: 20,bottom: 20),
                    child: Container(
                      width: MediaQuery.of(context).size.width/1.5,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[300],width: 1.0),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 140,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('images/beauty.jpeg'),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                          SizedBox(height: 10.0,),
                          Text('What is Wholesale Community?'),
                        ],
                      ),
                    ),
                  );
                },
              )
          ),

          Container(
            padding: EdgeInsets.all(20),
            color: Colors.grey[100],
            child: Text('POPULAR QUESTIONS',),
          ),

          PopularQuestions(question: 'How do I share products on Facebook?',),
          SizedBox(height: 1.0,),
          PopularQuestions(question: 'Do you change GST?',),
          SizedBox(height: 1.0,),
          PopularQuestions(question: 'Where do I provide my band details?',),
          SizedBox(height: 1.0,),
          PopularQuestions(question: 'Do I need a GST Registration?',),
          SizedBox(height: 1.0,),

          Container(
            height: 90,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                          border: Border.all(color: pinkColor),
                          borderRadius: BorderRadius.circular(5.0)
                      ),
                      child: Center(
                        child: Text('Contact Us', style: TextStyle(color: pinkColor,fontSize: 17),),
                      ),
                    ),
                  ),
                  SizedBox(width: 40,),
                  Expanded(
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [Colors.pinkAccent,Colors.pink[200]]),
                          borderRadius: BorderRadius.circular(5.0)
                      ),
                      child: Center(
                        child: Text('See All FAQ', style: TextStyle(color: Colors.white,fontSize: 17),),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}

class PopularQuestions extends StatelessWidget {
  final question;
  PopularQuestions({this.question});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(question,),
          Icon(Icons.arrow_forward_ios,size: 15,)
        ],
      ),
    );
  }
}
