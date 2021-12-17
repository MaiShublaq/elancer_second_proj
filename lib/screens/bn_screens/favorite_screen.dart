import 'package:elancer_second_proj/api/controllers/csp_api_controller.dart';
import 'package:elancer_second_proj/get/favorite_getx_controller.dart';
import 'package:elancer_second_proj/models/product.dart';
import 'package:elancer_second_proj/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key,}) : super(key: key);
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late Future<List<Product>> _future;
  List<Product> _products = <Product>[];

  @override
  void initState() {
 //   // TODO: implement initState
  super.initState();
    _future=CspApiController().getFavorites();
 }
  //FavoriteProductsGetXController _favoriteGetxController=Get.put(FavoriteProductsGetXController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorites'),
        centerTitle: true,
        backgroundColor:const  Color(0xFFFFDA1A),
        shape:const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),      ),
      body:
    //GetX<FavoriteGetxController>(
    //  builder: (controller) {
    //    if (controller.loading) {
    //      print('loading');
    //      return const Center(child: CircularProgressIndicator());
    //    }
    //    else if (controller.product != null) {
    //      print('in main ');
    //      return GridView.builder(
    //                 padding:EdgeInsets.symmetric(horizontal: 10,vertical: 10) ,
    //                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //                   crossAxisCount: 2,
    //                   childAspectRatio: 0.8,
    //                   mainAxisSpacing: 10,
    //                   crossAxisSpacing: 10,

    //                 ),
    //                 itemCount: controller.product!.length,
    //                 itemBuilder: (context, index){

    //                   return InkWell(
    //                     onTap: (){
    //                       //Navigator.push(context, MaterialPageRoute(builder:
    //                       //(context)=>ProductContentScreen(
    //                       //id: widget.id,
    //                       //name: widget.name,
    //                       //brief: widget.brief,
    //                       //info: widget.info,
    //                       //mainImg: widget.mainImg,
    //                       //idCategory: widget.idCategory,
    //                       //img: widget.img) ));
    //                     },
    //                     child:  Container(
    //                         height: 186,
    //                         width: 160,
    //                         decoration: BoxDecoration(
    //                           borderRadius: BorderRadius.circular(20),
    //                           color: Colors.blueGrey.shade50,

    //                         ),
    //                         child:Column(
    //                           children: [
    //                             Container(
    //                               height: 130,
    //                               width: 160,
    //                               child: Card(
    //                                 clipBehavior: Clip.antiAlias,
    //                                 shape: RoundedRectangleBorder(
    //                                   borderRadius: BorderRadius.circular(20),
    //                                 ),
    //                                 child: Image.network(controller.product![index].imageUrl,
    //                                   fit: BoxFit.cover,
    //                                   isAntiAlias: true,
    //                                 ),
    //                               ),
    //                             ),
    //                             Row(
    //                               crossAxisAlignment: CrossAxisAlignment.start,
    //                               children:  [
    //                                 const SizedBox(width:2),
    //                                 SizedBox(
    //                                   height: 30,
    //                                   width: 120,
    //                                   child: Text(controller.product![index].nameEn,
    //                                       overflow: TextOverflow.clip,
    //                                       style:const TextStyle(
    //                                         fontSize: 13,
    //                                       )),
    //                                 ),
    //                                 const Spacer(),
    //                                 const Icon(Icons.star,color: Color(0xFFFFDA1A)),
    //                                 Text('${controller.product![index].overalRate}'),
    //                                 const SizedBox(width:2),

    //                               ],
    //                             ),
    //                             const SizedBox(height: 10,),
    //                             Row(
    //                               children:  [
    //                                 const SizedBox(width:2),
    //                                 Text('${controller.product![index].price}\$',style:const TextStyle(
    //                                     fontWeight: FontWeight.bold)),
    //                                 const Spacer(),
    //                                 CircleAvatar(
    //                                     radius: 13,
    //                                     backgroundColor: Colors.grey.shade400,
    //                                     child:  IconButton(
    //                                        icon:Icon( Icons.favorite),
    //                                          onPressed: () async => await changeFavorite(
    //                                product: controller.product![index],
    //                                          id:controller.product![index].id ),
    //                                          //color:changeFavoriteColor(status: controller.favoriteProducts![index].isFavorite),
    //                                 ) ),
    //                                 const SizedBox(width:2),

    //                               ],
    //                             )



    //                             //  ),
    //                           ],
    //                         )
    //                     ),
    //                   );

    //                 },);}

    //    else {

    //      return Center(
    //        child: Column(
    //          children: const [
    //            Icon(Icons.warning, size: 80),
    //            Text(
    //              'NO DATA',
    //              style: TextStyle(
    //                color: Colors.grey,
    //                fontWeight: FontWeight.bold,
    //                fontSize: 24,
    //              ),
    //            )
    //          ],
    //        ),
    //      );
    //    }

    //  })


  FutureBuilder<List<Product>>(
    future: _future,
    builder: (context,snapshot){
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      }
      if (snapshot.hasData && snapshot.data!.isNotEmpty){
        _products=snapshot.data??[];
        return GridView.builder(
          padding:EdgeInsets.symmetric(horizontal: 10,vertical: 10) ,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,

          ),
          itemCount: _products.length,
          itemBuilder: (context, index){

            return InkWell(
              onTap: (){
                //Navigator.push(context, MaterialPageRoute(builder:
                //(context)=>ProductContentScreen(
                //id: widget.id,
                //name: widget.name,
                //brief: widget.brief,
                //info: widget.info,
                //mainImg: widget.mainImg,
                //idCategory: widget.idCategory,
                //img: widget.img) ));
              },
              child:  Container(
                  height: 186,
                  width: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blueGrey.shade50,

                  ),
                  child:Column(
                    children: [
                      Container(
                        height: 130,
                        width: 160,
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.network(_products[index].imageUrl,
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
                            child: Text(_products[index].nameEn,
                                overflow: TextOverflow.clip,
                                style:const TextStyle(
                                  fontSize: 13,
                                )),
                          ),
                          const Spacer(),
                          const Icon(Icons.star,color: Color(0xFFFFDA1A)),
                          Text('${_products[index].overalRate}'),
                          const SizedBox(width:2),

                        ],
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        children:  [
                          const SizedBox(width:2),
                          Text('${_products[index].price}\$',style:const TextStyle(
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
              ),
            );

          },);


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
    },


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

