import 'package:elancer_second_proj/models/api_base_response.dart';
import 'package:elancer_second_proj/models/category.dart';
import 'package:elancer_second_proj/models/product.dart';
import 'package:elancer_second_proj/models/slider.dart';

class HomeResponse extends ApiBaseResponse {
 late List<SliderImage> slider;
 late List<Category> categories;
 late List<Product> latestProducts;
 late List<Product> famousProducts;


 HomeResponse.fromJson(Map<String, dynamic> json): super.fromJson(json) {
    if (json['data']['slider'] != null) {
     slider =  <SliderImage>[];
      json['data']['slider'].forEach((v) {
        slider.add( SliderImage.fromJson(v));
      });
    }
    if (json['data']['categories'] != null) {
     categories =  <Category>[];
      json['data']['categories'].forEach((v) {
        categories.add( Category.fromJson(v));
      });
    }

    if (json['data']['latest_products'] != null) {
      latestProducts =  <Product>[];
      json['data']['latest_products'].forEach((v) {
        latestProducts.add( Product.fromJson(v));
      });
    }
   if (json['data']['famous_products'] != null) {
     famousProducts =  <Product>[];
     json['data']['famous_products'].forEach((v) {
       famousProducts.add( Product.fromJson(v));
     });
   }
  }


}