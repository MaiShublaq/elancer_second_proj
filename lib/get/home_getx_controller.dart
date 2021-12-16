import 'package:elancer_second_proj/api/controllers/home_api_controller.dart';
import 'package:elancer_second_proj/models/home_api_response.dart';
import 'package:elancer_second_proj/models/product.dart';
import 'package:get/get.dart';

class HomeGetxController extends GetxController{

  HomeResponse? homeResponse;
  bool loading =false;
  final HomeApiController _apiController=HomeApiController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getHome();
  }

  Future<void> getHome()async{
    loading=true;
  homeResponse=await _apiController.showHome();
  loading=false;
  update();
  }


 // List<Product> getLatest(){
 //   if(homeResponse!=null){
 //      List<Product> latestProduct= homeResponse!.latestProducts;
 //      return latestProduct;
 //   }
//
 //   return [];
 // }
}