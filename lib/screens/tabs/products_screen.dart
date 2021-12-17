import 'package:elancer_second_proj/api/controllers/csp_api_controller.dart';
import 'package:elancer_second_proj/get/favorite_getx_controller.dart';
import 'package:elancer_second_proj/models/product.dart';
import 'package:elancer_second_proj/widgets/product_item.dart';
import 'package:elancer_second_proj/widgets/product_item_grid.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key,
  required this.subCategoryId}) : super(key: key);
  final int subCategoryId;
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late Future<List<Product>> _future;
  List<Product> _products = <Product>[];
  FavoriteGetxController _favoriteGetxController=Get.put(FavoriteGetxController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future=CspApiController().getProducts(id: widget.subCategoryId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: _future,
      builder: (context,snapshot){
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          _products = snapshot.data ?? [];
          return ProductItemGrid(products: _products,
          fromeWhere: 'Grid',);
        }

        else {
          return Center(
            child: Column(
              children: const [
                Icon(Icons.warning, size: 80),
                Text(
                  'NO DATA',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                )
              ],
            ),
          );
        }
//         return GridView.builder(
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               childAspectRatio: 0.8,
//               mainAxisSpacing: 10,
//               crossAxisSpacing: 10,

//             ),
//             itemCount: _future.length,
//             itemBuilder: (context, index){
//   return InkWell(
//     onTap: (){
//       //Navigator.push(context, MaterialPageRoute(builder:
//       //(context)=>ProductContentScreen(
//       //id: widget.id,
//       //name: widget.name,
//       //brief: widget.brief,
//       //info: widget.info,
//       //mainImg: widget.mainImg,
//       //idCategory: widget.idCategory,
//       //img: widget.img) ));
//     },
//    child:  Container(
//       height: 186,
//       width: 160,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         color: Colors.blueGrey.shade50,

//       ),
//       child:Column(
//         children: [
//           Container(
//             height: 130,
//             width: 160,
//             child: Card(
//               clipBehavior: Clip.antiAlias,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Image.network(_products[index].imageUrl,
//                 fit: BoxFit.cover,
//                 isAntiAlias: true,
//               ),
//             ),
//           ),
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children:  [
//               const SizedBox(width:2),
//               SizedBox(
//                 height: 30,
//                 width: 120,
//                 child: Text(_products[index].nameEn,
//                     overflow: TextOverflow.clip,
//                     style:const TextStyle(
//                       fontSize: 13,
//                     )),
//               ),
//               const Spacer(),
//               const Icon(Icons.star,color: Color(0xFFFFDA1A)),
//               Text('${_products[index].overalRate}'),
//               const SizedBox(width:2),

//             ],
//           ),
//           const SizedBox(height: 10,),
//           Row(
//             children:  [
//               const SizedBox(width:2),
//               Text('${_products[index].price}\$',style:const TextStyle(
//                   fontWeight: FontWeight.bold)),
//               const Spacer(),
//               CircleAvatar(
//                   radius: 13,
//                   backgroundColor: Colors.grey.shade400,
//                   child: const Icon(
//                       Icons.favorite,color:Colors.lightBlueAccent)),
//               const SizedBox(width:2),

//             ],
//           )



//           //  ),
//         ],
//       )
//   ),
//   );

},);









  }

 // Future<void> changeFavorite({required int id,required Product product} ) async{
 //   print('in change in product after');
 //   await FavoriteGetxController.to.changeFavorite(context, id: id, prduct:product);
 //   print('in change in product before');
//
 // }
//
 // Color changeFavoriteColor({required bool status}) {
 //   print('in changeColor in product after');
 //   Color color= FavoriteGetxController.to.changeFavoriteColor(isFavorite: status);
 //   print('in changeColor in product before');
 //   return color;
//
 // }
}
