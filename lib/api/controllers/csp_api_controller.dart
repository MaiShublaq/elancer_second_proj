import 'dart:convert';
import 'package:elancer_second_proj/api/api_helpers.dart';
import 'package:elancer_second_proj/api/api_settings.dart';
import 'package:elancer_second_proj/models/Faqs.dart';
import 'package:elancer_second_proj/models/api_base_response.dart';
import 'package:elancer_second_proj/models/category.dart';
import 'package:elancer_second_proj/models/product.dart';
import 'package:elancer_second_proj/models/sub_categories.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class CspApiController with ApiHelpers{

  Future<List<Category>> getCategories() async {
    var url = Uri.parse(ApiSettings.categories);
    print(headers);

    var response = await http.get(url,headers: headers);
    print('inshowCategory');
    print(response.statusCode);
    if (response.statusCode == 200) {
           var categoriesJsonArray = jsonDecode(response.body)['list'] as List;
           return categoriesJsonArray
               .map((jsonObject) => Category.fromJson(jsonObject))
               .toList();
         }
         return [];
       }

  Future<List<SubCategories>> getSubCategories({required int id}) async {
    var url = Uri.parse(ApiSettings.subCategories.replaceFirst('{id}', id.toString()));
    var response = await http.get(url,headers: headers);
    print('inshowSubCategory');
    print(response.statusCode);
    print (jsonDecode(response.body)['list']);

    if (response.statusCode == 200) {
      var subCategoriesJsonArray = jsonDecode(response.body)['list'] as List;
      return subCategoriesJsonArray
          .map((jsonObject) => SubCategories.fromJson(jsonObject))
          .toList();
    }
    return [];
  }
  Future<List<Product>> getProducts({required int id}) async {
    var url = Uri.parse(ApiSettings.product.replaceFirst('{id}', id.toString()));
    print(url);
    var response = await http.get(url,headers: headers);
    print('inshowProducts');
    print(response.statusCode);
    print (jsonDecode(response.body)['list']);

    if (response.statusCode == 200) {
      var productJsonArray = jsonDecode(response.body)['list'] as List;
      return productJsonArray
          .map((jsonObject) => Product.fromJson(jsonObject))
          .toList();
    }
    return [];
  }




  Future<List<Product>> getFavorites() async {
    var url = Uri.parse(ApiSettings.favorites);
    var response = await http.get(url,headers: headers);
    print('in show favorite');
    print(response.statusCode);
    print(url);

    print(jsonDecode(response.body));
    if (response.statusCode == 200) {
      print('true');
      var favoritesJsonArray = jsonDecode(response.body)['list'] as List;
      print('jh');
      print(favoritesJsonArray);
      return favoritesJsonArray
          .map((jsonObject) => Product.fromJson(jsonObject))
          .toList();
    }
    return [];
  }




  Future<bool> changeFavorite(BuildContext context,{required int id }) async {
    var url = Uri.parse(ApiSettings.favorites);
    print(url);
    var response = await http.post(url,headers: headers,
        body:{
          'product_id': id.toString()
        }
    );
    print(response.statusCode);
    print(jsonDecode(response.body));
    if(response.statusCode==200){
      print('200');
      showSnackBar(context: context,
          message: jsonDecode(response.body)['message']);
      return true;
    }
    else if(response.statusCode==400){
      showSnackBar(context: context,
          message: jsonDecode(response.body)['message'],
          error: true);

    }
    else{
      showSnackBar(context: context,
          message: 'Something went wrong ,please try again',
          error: true);
    }
    return false;
  }


  Future <Product?> getproductDetails({required int id}) async {
    var url = Uri.parse(ApiSettings.productDetails.replaceFirst('{id}', id.toString()));
    var response = await http.get(url,headers: headers);
    print('in show details');
    print(response.statusCode);
    print(url);

    print(jsonDecode(response.body));
    if (response.statusCode == 200){
      return Product.fromJson(jsonDecode(response.body)['object']);

    print('true');
      var favoritesJsonArray = jsonDecode(response.body)['object'] ;
      print('jh');
      print(favoritesJsonArray);

    }
    return null;
  }



  Future<bool> contactUs(BuildContext context,{required String  subject , required String message}) async {
    var url = Uri.parse(ApiSettings.contactRequest);
    print(url);
    var response = await http.post(url,headers: headers,
        body:{
          'subject': subject,
          'message':message,
        }
    );
    print(response.statusCode);
    print(jsonDecode(response.body));
    if(response.statusCode==201){
      print('201');
      showSnackBar(context: context,
          message: jsonDecode(response.body)['message']);
      return true;
    }
    else if(response.statusCode==400){
      showSnackBar(context: context,
          message: jsonDecode(response.body)['message'],
          error: true);

    }
    else{
      showSnackBar(context: context,
          message: 'Something went wrong ,please try again',
          error: true);
    }
    return false;
  }





  Future <List<Faqs>> getFaqs() async {
    var url = Uri.parse(ApiSettings.faqs);
    var response = await http.get(url,headers: headers);
    print('in show details');
    print(response.statusCode);
    print(url);

    print(jsonDecode(response.body));
    if (response.statusCode == 200) {
      print('true');
      var favoritesJsonArray = jsonDecode(response.body)['list'] as List;
      print('jh');
      print(favoritesJsonArray);
      return favoritesJsonArray
          .map((jsonObject) => Faqs.fromJson(jsonObject))
          .toList();
    }
    return [];
  }

}