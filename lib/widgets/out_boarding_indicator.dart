import 'package:flutter/material.dart';

class OutBoardingIndicator extends StatelessWidget {

  final double marginEnd;
  final bool selected;
  OutBoardingIndicator({required this.selected,this.marginEnd=0});
  @override
  Widget build(BuildContext context) {
    return Container(
      width:selected?40:10,
      height:10,
      margin: EdgeInsetsDirectional.only(end:marginEnd),

      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(10),
        color:selected?Colors.black:Colors.grey,

      ),
    );
  }
}

