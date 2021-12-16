import 'package:elancer_second_proj/prefs/shared_pref_controller.dart';
import 'package:flutter/material.dart';

mixin ApiHelpers{

  void showSnackBar({
    required BuildContext context,
    required String message,
    bool error = false,
  }){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(message),
          backgroundColor: error? Colors.red:Colors.green,
          duration: const Duration(seconds: 1),
          dismissDirection: DismissDirection.horizontal,)
    );
  }

  Map<String,String> get headers{
    var headers={
      'Accept':'application/json',
      'lang':SharedPrefController().language
    };
     print(SharedPrefController().token);
    if (SharedPrefController().loggedIn)
      headers['Authorization']=SharedPrefController().token;
    return headers;
  }
}