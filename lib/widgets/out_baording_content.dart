import 'package:elancer_second_proj/widgets/out_boarding_indicator.dart';
import 'package:flutter/material.dart';

class OutBoardingContent extends StatelessWidget {

  final String textTitle;
  final String subtextTitle;
  final String Imagename;
  final int currentPage;
  const OutBoardingContent({required this.textTitle,required this.subtextTitle,required this.Imagename,required this.currentPage});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
          children:[
            const SizedBox(height: 8,),

            Container(
              padding: EdgeInsets.all(0),
              height: 285,
              width:double.infinity,
              child:Card(
               // clipBehavior: Clip.antiAlias,
               // shape: RoundedRectangleBorder(
               //   borderRadius: BorderRadius.circular(10),
               // ),
                child: Image.asset(Imagename,
                  fit: BoxFit.cover,
                 // isAntiAlias: true,
                ),
              ),
            ),


            const SizedBox(
              height: 25,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.start,

                children:[
                  SizedBox(width: 25,),
                  OutBoardingIndicator(selected: currentPage==0,marginEnd: 5,),
                  OutBoardingIndicator(selected:currentPage==1,marginEnd: 5,),
                  OutBoardingIndicator(selected: currentPage==2,),

                ]
            ),
            SizedBox(height: 20,),
            Text(textTitle,style: TextStyle(
              fontSize: 33,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
            const SizedBox(height:10 ,),

            Text(subtextTitle,
                textAlign:TextAlign.center,
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w400,
                  color:Colors.grey,
                )),



            // const   Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
            //           textAlign:TextAlign.center,
            //           style: TextStyle(
            //             fontSize: 20,
            //             fontWeight: FontWeight.w400,
            //             color:Colors.blue,
            //           )),
          ]
      ),
    );
  }
}
