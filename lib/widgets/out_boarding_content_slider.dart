import 'package:flutter/material.dart';

class OutBoardingContentSlider extends StatelessWidget {

  final String Imagename;
  const OutBoardingContentSlider({required this.Imagename});
  @override
  Widget build(BuildContext context) {
     return ListView(
       padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 5),
          children:[
            const SizedBox(height: 8,),
            SizedBox(
              height: 200,
              width:double.infinity,
              child:Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                child: Image.network(Imagename,
                  fit: BoxFit.cover,
                   isAntiAlias: true,
                ),
              ),
            ),
          ]
      );

  }
}
