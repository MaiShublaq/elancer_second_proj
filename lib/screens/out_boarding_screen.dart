import 'package:elancer_second_proj/widgets/out_baording_content.dart';
import 'package:flutter/material.dart';

class OutBoardingScreen extends StatefulWidget {
  const OutBoardingScreen({Key? key}) : super(key: key);


  @override
  _OutBoardingScreenState createState() => _OutBoardingScreenState();
}

class _OutBoardingScreenState extends State<OutBoardingScreen> {
  int _currentPage=0;
  late PageController _pageController;
  String image1='images/2.jpg';
  String image2='images/3.jpg';
  String image3='images/4.jpg';

  @override
  void initState(){
    super.initState();
    _pageController=PageController();
  }


  @override
  void dispose(){
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children:[
                const SizedBox(height: 4,),
                Stack(
                  children:[
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        minWidth:10,
                        maxWidth:double.infinity,
                        minHeight:0,
                        maxHeight: 450,
                      ),

                      child: PageView(
                        controller: _pageController,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (value){

                          setState((){
                            _currentPage=value;
                          });

                        },

                        children:  [

                          OutBoardingContent(textTitle:'Get inspired',
                            subtextTitle: 'Perfect Plan Make Godd Dream',
                            Imagename: image1,
                          currentPage:_currentPage),


                          OutBoardingContent(textTitle: 'Shop Products',
                            subtextTitle: 'Decorate Home with  Best Furniture',
                            Imagename: image2,
                              currentPage:_currentPage),
                          OutBoardingContent(textTitle: 'Find professionals',
                            subtextTitle: 'adda hydrating cream mask or face oil',
                            Imagename: image3,
                              currentPage:_currentPage),

                        ],
                      ),
                    ),



                  ]
                ),


                const SizedBox(height:5),

                const SizedBox(height:5),
                Visibility(
                  visible:_currentPage<2,
                  replacement:CircleAvatar(
                     radius: 40,
                     foregroundColor: Colors.black,
                     backgroundColor: const Color(0xFFFFDA1A),
                     child:CircleAvatar(
                     radius: 35,
                     backgroundColor: Colors.white,
                     child:TextButton(child:const Text('START',style:TextStyle(
                     color:Colors.black
                     )),
                     onPressed:(){
                        Navigator.pushReplacementNamed(context, '/login_screen');
                       }


                ),)),
                child:
                  CircleAvatar(
                    radius: 40,
                    foregroundColor: Colors.black,
                    backgroundColor: const Color(0xFFFFDA1A),
                    child:

                    CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.white,
                      child:TextButton(child:const Text('NEXT',style:TextStyle(
                        color:Colors.black
                      )),onPressed: (){
                        _pageController.animateToPage(
                          2,
                          duration: const Duration(seconds:1),
                          curve: Curves.easeInOut,
                        );
                      },) ,
                    )
                  )
                  ,
                ),


              ]),
        )
    );
  }
}

