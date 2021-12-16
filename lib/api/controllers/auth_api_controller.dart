import 'dart:convert';
import 'dart:io';


import 'package:elancer_second_proj/api/api_helpers.dart';
import 'package:elancer_second_proj/api/api_settings.dart';
import 'package:elancer_second_proj/helpers/helpers.dart';
import 'package:elancer_second_proj/models/api_base_response.dart';
import 'package:elancer_second_proj/models/base_api_object_response.dart';
import 'package:elancer_second_proj/models/city.dart';
import 'package:elancer_second_proj/models/user.dart';
import 'package:elancer_second_proj/prefs/shared_pref_controller.dart';
import'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthApiController with ApiHelpers{

  Future <bool> register (BuildContext context,{required User user }) async{
    print('register');
    var url = Uri.parse(ApiSettings.register);
    var response= await http.post(url,body:{
      'name':user.name,
      'mobile':user.mobile,
      'password':user.password,
      'gender':user.gender,
      'STORE_API_KEY':'1a244809-fc80-4b5b-922a-5340393fa768',
      'city_id':user.cityId.toString()

    });
    if(response.statusCode==201){
      print('200');
      showSnackBar(context: context,
          message: jsonDecode(response.body)['message']);
      return true;
    }
    else if(response.statusCode==400){
      print('400');
      showSnackBar(context: context,
          message: jsonDecode(response.body)['message'],
          error: true);
    }
    print('500');
    return false;}





  Future <bool> login (BuildContext context,{required String mobile,required String password}) async {
    var url = Uri.parse(ApiSettings.login);
    var response = await http.post(url, body: {
      'mobile': mobile,
      'password': password,
    },
    headers: headers
    );

    print(response.statusCode);
    if (response.statusCode == 200)  {
      var baseApiResponse= BaseApiObjectResponse<User>.fromJson(jsonDecode(response.body)) ;
      showSnackBar(context: context, message: baseApiResponse.message);
       await SharedPrefController().save(user: baseApiResponse.data);

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



  Future <bool> activate (BuildContext context,{required String mobile,required String code}) async {
    var url = Uri.parse(ApiSettings.activate);
    var response = await http.post(url, body: {
      'mobile': mobile,
      'code': code,
    });
    if (response.statusCode == 200) {
      showSnackBar(context: context,
          message: jsonDecode(response.body)['message']);
      return true;

    }
    else if(response.statusCode==400){
      showSnackBar(context: context,
          message: jsonDecode(response.body)['message'],
          error: true);

    }
    return false;
  }






  Future<bool> forgetPassword(BuildContext context,{required String mobile }) async{
    var url=Uri.parse(ApiSettings.forgetPassword);
    var response= await http.post(url,body:{
      'mobile':mobile,
    });
    if(response.statusCode==200){
      print(jsonDecode(response.body)['message']);
      return true;
    }
    else if(response.statusCode==400){
      showSnackBar(context: context,
          message: (jsonDecode(response.body)['message']),
          error: true);
    }
    else{
      showSnackBar(context: context,
          message: (jsonDecode(response.body)['message']),
          error: true);
    }
    return false;
  }

  Future<bool> resetPassword(BuildContext context,{
    required String mobile, required String password,required String code})async{
    var url= Uri.parse(ApiSettings.resetPassword);
    var response=await http.post(url,headers: {
      HttpHeaders.acceptHeader:'application/json',
    },
        body:{
          'mobile': mobile,
          'code':code,
          'password':password,
          'password_confirmation':password});

    if(response.statusCode==200){
      showSnackBar(context: context,
          message: jsonDecode(response.body)['message']);
      return true;
    }
    else if (response.statusCode==400){
      print(400);
      showSnackBar(context: context,
          message: jsonDecode(response.body)['message'],
          error:true);
      return false;
    }
    else if (response.statusCode==500){
      showSnackBar(context: context,
          message: 'Something went wrong',
          error:true);
    }
    return false;
  }



  Future <bool> logout() async {
    var url = Uri.parse(ApiSettings.logout);
    var response = await http.get(url,headers: headers);
    if (response.statusCode == 200 || response.statusCode == 401) {
      SharedPrefController().clear();
      return true;
    }
    return false;

  }

  Future<List<City>> getCities() async {
    var url = Uri.parse(ApiSettings.cities);
    var response = await http.get(url,headers: headers);
    print('in show cities');
    print(response.statusCode);
    print(url);

    print(jsonDecode(response.body));
    if (response.statusCode == 200) {
      print('true');
      var citiessJsonArray = jsonDecode(response.body)['list'] as List;
      print('jh');
      print(citiessJsonArray);
      return citiessJsonArray
          .map((jsonObject) => City.fromJson(jsonObject))
          .toList();
    }
    return [];
  }

  Future <bool> updateprofile (BuildContext context,{required User user }) async{
    print('update');

    var url = Uri.parse(ApiSettings.updateProfile);
    var response= await http.post(url,body:{
      'name':user.name,
      'gender':user.gender,
      'city_id':user.cityId.toString()

    },headers: headers);
    print(response.statusCode);
    print(headers);
    print(jsonDecode(response.body));
    if(response.statusCode==200){
      print('200');
      showSnackBar(context: context,
          message: jsonDecode(response.body)['message']);
      return true;
    }
    else if(response.statusCode==400){
      print('400');
      showSnackBar(context: context,
          message: jsonDecode(response.body)['message'],
          error: true);
    }
    return false;}



  Future<bool> changePassword(BuildContext context,{
    required String oldPass,required String newPass }) async{
    print('in');

    var url=Uri.parse(ApiSettings.changePassword);
    print(url);
    var response= await http.post(url,body:{
      'current_password':oldPass,
      'new_password':newPass,
      'new_password_confirmation':newPass
    },
    headers: headers);
    print(jsonDecode(response.body));
    if(response.statusCode==200){
      print(jsonDecode(response.body)['message']);
      return true;
    }
    else if(response.statusCode==400){
      showSnackBar(context: context,
          message: (jsonDecode(response.body)['message']),
          error: true);
    }
    else{
      showSnackBar(context: context,
          message: (jsonDecode(response.body)['message']),
          error: true);
    }
    return false;
  }



}