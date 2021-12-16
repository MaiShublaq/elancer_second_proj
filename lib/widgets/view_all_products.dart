import 'package:elancer_second_proj/models/product.dart';
import 'package:elancer_second_proj/screens/home_products_screen.dart';
import 'package:flutter/material.dart';

class view_all extends StatelessWidget {
   view_all({
    Key? key,
    required this.title,
    required this.navigator,
   required this.list}) : super(key: key);
  final String title;
  final String navigator;
  final List<Product> list;
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeProductsScreen(
                    product: list,
                    title:title)),
              );
            },
          child:Text('view all')
        )
      ],
    );
  }
}
