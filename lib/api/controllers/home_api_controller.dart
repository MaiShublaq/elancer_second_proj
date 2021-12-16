
import 'dart:convert';
import 'package:elancer_second_proj/api/api_helpers.dart';
import 'package:elancer_second_proj/api/api_settings.dart';
import 'package:elancer_second_proj/helpers/helpers.dart';
import 'package:elancer_second_proj/models/category.dart';
import 'package:elancer_second_proj/models/home_api_response.dart';
import 'package:elancer_second_proj/models/product.dart';
import 'package:elancer_second_proj/models/slider.dart';
import 'package:http/http.dart' as http;

class HomeApiController with ApiHelpers {

  Future<HomeResponse?> showHome() async {
    var url = Uri.parse(ApiSettings.home);
    var response = await http.get(url,headers: headers);
    print('inshowHome');
    if(jsonDecode(response.body)['data']['categories']!=null)
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(jsonDecode(response.body)['data']['categories']);
    return HomeResponse.fromJson(jsonDecode(response.body));
    }
    return null;
  }


//
 // Future<List<LatestProducts>> getLatestProducts() async {
 //   var url = Uri.parse(ApiSettings.home);
 //   var response = await http.get(url);
 //   if (response.statusCode == 200) {
 //     var latestProductsJsonArray = jsonDecode(response.body)['data']['latest_products'] as List;
 //     return latestProductsJsonArray
 //         .map((jsonObject) => LatestProducts.fromJson(jsonObject))
 //         .toList();
 //   }
 //   return [];
 // }

}