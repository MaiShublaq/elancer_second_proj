import 'package:elancer_second_proj/models/slider.dart';
import 'package:elancer_second_proj/widgets/out_boarding_content_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SliderImageWidget extends StatefulWidget {
  const SliderImageWidget({Key? key,
 required this.slider,

  }) : super(key: key);

  final List<SliderImage> slider;



  @override
  State<SliderImageWidget> createState() => _SliderImageWidgetState();
}

class _SliderImageWidgetState extends State<SliderImageWidget> {
  int _currentPage=0;
  late PageController _pageController;

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
    return Stack(
        children:[
          ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth:10,
              maxWidth:double.infinity,
              minHeight:0,
              maxHeight: 200,
            ),

            child: Stack(
              children:[
                PageView(
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (value){

                    setState((){
                      _currentPage=value;
                    });

                  },
                  children:  [
                   //ListView.builder(
                   //  scrollDirection: Axis.horizontal,
                   //  itemCount: widget.slider.length,
                   //    itemBuilder: (context, index) {
                   //      return OutBoardingContentSlider(
                   //        Imagename: widget.slider[index].imageUrl,
                   //      );
                   //    },)
                    OutBoardingContentSlider(
                      Imagename: widget.slider[0].imageUrl,
                    ),
                    OutBoardingContentSlider(
                      Imagename: widget.slider[1].imageUrl,
                    ),
                    OutBoardingContentSlider(
                      Imagename: widget.slider[2].imageUrl,
                    ),
                   OutBoardingContentSlider(
                     Imagename: widget.slider[3].imageUrl,
                   ),
                   OutBoardingContentSlider(
                     Imagename: widget.slider[4].imageUrl,
                   ),

                  ],
                ),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:[
                        IconButton(
                            color: _currentPage==0? Colors.grey : Color(0xFFFFDA1A),
                            onPressed: (){
                              _pageController.previousPage(duration: const Duration(seconds:1), curve:Curves.easeInOut );
                            },
                            icon: const Icon(Icons.arrow_back_ios)),

                        Visibility(
                          visible: _currentPage<4,
                          maintainAnimation: true,
                          maintainSize: true,
                          maintainState: true,
                          child: IconButton(
                            color:Color(0xFFFFDA1A),
                            onPressed:(){
                              _pageController.nextPage(duration: const Duration(seconds:1), curve: Curves.easeIn);

                            },
                            icon:const Icon(Icons.arrow_forward_ios),
                          ),
                        )
                      ]
                  ),
                ),



              ]
            ),
          ),




        ]
    );
  }
}
