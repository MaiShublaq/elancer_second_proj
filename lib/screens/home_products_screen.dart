import 'package:elancer_second_proj/get/favorite_getx_controller.dart';
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
                     height: 125,
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
                   radius: 16,
                   backgroundColor: Colors.grey.shade400,
                   child: IconButton(
                     onPressed:

                         () async{
                       //    await changeFavorite(product: widget.products[index],
                       //    id: widget.products[index].id);

                       await changeFavorite(id:widget.product[index].id,
                           product: widget.product[index]);
                       changeFavoriteColor(status: widget.product[index].isFavorite);
                     } ,
                     icon:Icon(Icons.favorite),
                     color:changeFavoriteColor(status: widget.product[index].isFavorite),
                   )),
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




  Future<void> changeFavorite({required int id,required Product product}) async{
    print('in change in product after');
    print(product);
    await FavoriteGetxController.to.changeFavorite(context, id: id,prduct:product );
    print('in change in product before');

  }



  Color changeFavoriteColor({required bool status}) {
    print('in changeColor in product after');
    Color color= FavoriteGetxController.to.changeFavoriteColor(isFavorite: status);
    print('in changeColor in product before');
    return color;

  }
}
