import 'package:elancer_second_proj/models/product.dart';
import 'package:flutter/material.dart';

class HomeProductsScreen extends StatefulWidget {
  const HomeProductsScreen({Key? key,
  required this.product,
  required this.title}) : super(key: key);

  final List<Product> product;
  final String title;

  @override
  _HomeProductsScreenState createState() => _HomeProductsScreenState();
}

class _HomeProductsScreenState extends State<HomeProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor:Color(0xFFFFDA1A),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
   body: GridView.builder(
         padding: const EdgeInsets.all(2),
         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
           crossAxisCount: 2,
           childAspectRatio: .88,
           crossAxisSpacing: 8,
           mainAxisSpacing: 10,
         ),
         itemCount: widget.product.length,
         itemBuilder: (context, index) {
           return  Container(
               height: 186,
               width: 160,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(20),
                 color: Colors.blueGrey.shade50,

               ),
               child:Column(
                 children: [
                   //           Card(
                   //          //   color:Color(0xFFFFDA1A),
                   //          shape: RoundedRectangleBorder(
                   //          borderRadius: BorderRadius.circular(20),
                   //     ),
                   //child:
                   Container(
                     height: 130,
                     width: 160,
                     child: Card(
                       clipBehavior: Clip.antiAlias,
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(20),
                       ),
                       child: Image.network(widget.product[index].imageUrl,
                         fit: BoxFit.cover,
                         isAntiAlias: true,
                       ),
                     ),
                   ),
                   Row(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children:  [
                       const SizedBox(width:2),
                       SizedBox(
                         height: 30,
                         width: 120,
                         child: Text(widget.product[index].nameEn,
                             overflow: TextOverflow.clip,
                             style:const TextStyle(
                               fontSize: 13,
                             )),
                       ),
                       const Spacer(),
                       const Icon(Icons.star,color: Color(0xFFFFDA1A)),
                       Text('${widget.product[index].overalRate}'),
                       const SizedBox(width:2),

                     ],
                   ),
                   const SizedBox(height: 10,),
                   Row(
                     children:  [
                       const SizedBox(width:2),
                       Text('${widget.product[index].price}\$',style:const TextStyle(
                           fontWeight: FontWeight.bold)),
                       const Spacer(),
                       CircleAvatar(
                           radius: 13,
                           backgroundColor: Colors.grey.shade400,
                           child: const Icon(
                               Icons.favorite,color:Colors.lightBlueAccent)),
                       const SizedBox(width:2),

                     ],
                   )



                   //  ),
                 ],
               )
           );
         }



     ),

    );
  }
}
