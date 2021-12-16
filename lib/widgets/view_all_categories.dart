import 'package:elancer_second_proj/models/product.dart';
import 'package:elancer_second_proj/screens/home_products_screen.dart';
import 'package:flutter/material.dart';

class view_all_categories extends StatelessWidget {
  view_all_categories({
    Key? key,
    required this.title,
    required this.navigator,
    }) : super(key: key);
  final String title;
  final String navigator;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:MainAxisAlignment.spaceBetween ,
      children: [
        const SizedBox(width: 10,),
        Text(title,style:
        TextStyle(
            fontSize:18,
            fontWeight: FontWeight.bold
        )),
        const Spacer(),
        TextButton(
            onPressed: ()=> Navigator.pushNamed(context,'/categories_screen'),
            child:Text('view all')
        )
      ],
    );
  }
}
