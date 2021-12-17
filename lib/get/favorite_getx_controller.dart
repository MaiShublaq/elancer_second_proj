//import 'package:elancer_second_proj/api/controllers/csp_api_controller.dart';
//import 'package:elancer_second_proj/models/product.dart';
//import 'package:get/get.dart';
//import 'package:flutter/material.dart';


//class FavoriteProductsGetXController extends GetxController {
//  RxList<Product> favoriteProducts = <Product>[].obs;
//  bool loading = false;
//  final CspApiController _apiController = CspApiController();
//
//  static FavoriteProductsGetXController get to => Get.find();
//
//  @override
//  void onInit() {
//    getFavorite();
//    super.onInit();
//  }
//
//  Future<void> getFavorite() async {
//    loading = true;
//    favoriteProducts.value =
//    await _apiController.getFavorites();
//    loading = false;
//    update();
//  }
//
//  Future<bool> updateFavorite(
//      {required BuildContext context, required Product product}) async {
//    bool status = await _apiController.changeFavorite(context, id: product.id);
//    if (status) {
//      if (!product.isFavorite) {
//        print('Add');
//        product.isFavorite = true;
//        favoriteProducts.add(product);
//      } else {
//        print('Removed');
//        favoriteProducts.removeWhere((element) => element.id == product.id);
//      }
//    }
//    return status;
//  }
//
//  bool isFavorite(int productId) {
//    int index = favoriteProducts.indexWhere((element) => element.id == productId);
//    return index != -1;
//  }
//}
//







import 'package:elancer_second_proj/api/controllers/csp_api_controller.dart';
import 'package:elancer_second_proj/get/home_getx_controller.dart';
import 'package:elancer_second_proj/models/product.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class FavoriteGetxController extends GetxController{

  List<Product>? product;
  bool loading =false;
  final CspApiController _apiController=CspApiController();
  static FavoriteGetxController get to => Get.find();

 //List<Product> latestProduct= HomeGetxController().getLatest();
 // List<Product> famousProduct= HomeGetxController().homeResponse!.famousProducts;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getFavorite();
  }

  Future<void> getFavorite()async{
    loading=true;
    product=await _apiController.getFavorites();
    loading=false;
    update();
  }




  Future<bool> changeFavorite(BuildContext context,{required int id, required Product prduct}) async {
    print('in get');
    bool deleted = await _apiController.changeFavorite(context, id: id);
    if(deleted) {
      int index = product!.indexWhere((element) => element.id == id);
      //int index2=latestProduct!.indexWhere((element) => element.id == id);
      if(index ==-1){
        product!.add(prduct);
        prduct.isFavorite=true;
      // if(index2 != -1){
      //   latestProduct[index2].isFavorite=true;
      // }

      }
      if(index != -1) {
        product!.removeAt(index);
        prduct.isFavorite=false;
       // if(index2!=-1){
       //   latestProduct[index2].isFavorite=false;
//
       // }
      }
    }
    print(deleted);
    update();
    return deleted;
  }



  Color changeFavoriteColor({required bool isFavorite})  {
    Color color = isFavorite? Colors.lightBlueAccent:Colors.blue.shade50;
    return color;
  }
}