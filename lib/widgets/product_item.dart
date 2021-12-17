
import 'package:elancer_second_proj/get/favorite_getx_controller.dart';
import 'package:elancer_second_proj/helpers/helpers.dart';
import 'package:elancer_second_proj/models/product.dart';
import 'package:elancer_second_proj/screens/product_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ProductItem extends StatefulWidget with Helpers{
   ProductItem({
    Key? key,
    required this.products,

  }) : super(key: key);
  final List<Product> products;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
   FavoriteGetxController _favoriteGetxController=Get.put(FavoriteGetxController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoriteGetxController>(

      builder:(controller) {


      return Container(
            height: 200,
            width: 120,
            child: ListView.separated(
            padding: const EdgeInsets.all(2),
          separatorBuilder: (context,index){
          return const SizedBox(width: 4,);
          },
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: widget.products.length,
          itemBuilder: (context, index) {
          return  InkWell(
            onTap: (){
            Navigator.push(context,MaterialPageRoute(
            builder: (context)=>ProductDetails(id:widget.products[index].id)
            ));
            },
            child: Container(
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
            child: Image.network(widget.products[index].imageUrl,
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
            child: Text(widget.products[index].nameEn,
            overflow: TextOverflow.clip,
            style:const TextStyle(
            fontSize: 13,
            )),
            ),
            const Spacer(),
            const Icon(Icons.star,color: Color(0xFFFFDA1A)),
            Text('${widget.products[index].overalRate}'),
            const SizedBox(width:2),

            ],
            ),
            const SizedBox(height: 10,),
            Row(
            children:  [
            const SizedBox(width:2),
            Text('${widget.products[index].price}\$',style:const TextStyle(
            fontWeight: FontWeight.bold)),
            const Spacer(),
              CircleAvatar(
                  radius: 13,
                  backgroundColor: Colors.grey.shade400,
                  child: IconButton(
                    onPressed:

                        () async{
                      //    await changeFavorite(product: widget.products[index],
                      //    id: widget.products[index].id);

                      await changeFavorite(id:widget.products[index].id,
                          product: widget.products[index]);
                      changeFavoriteColor(status: widget.products[index].isFavorite);
                    } ,
                    icon:Icon(Icons.favorite),
                    color:changeFavoriteColor(status: widget.products[index].isFavorite),
                  )),
              const SizedBox(width: 2),




            ] ),
            ],
            )
            ),
          );
        }





            )
          );
      },
    );
  }



Future<void> changeFavorite({required int id,required Product product} ) async{
 print('in change in product after');
 await FavoriteGetxController.to.changeFavorite(context, id: id, prduct:product);
 print('in change in product before');

}

Color changeFavoriteColor({required bool status}) {
  print('in changeColor in product after');
  Color color= FavoriteGetxController.to.changeFavoriteColor(isFavorite: status);
  print('in changeColor in product before');
  return color;

}


}
