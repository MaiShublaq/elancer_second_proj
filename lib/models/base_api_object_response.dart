
import 'package:elancer_second_proj/models/api_base_response.dart';
import 'package:elancer_second_proj/models/user.dart';
class BaseApiObjectResponse<T> extends ApiBaseResponse{
 // late T object;
 late T data;

  BaseApiObjectResponse.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
  if(json.containsKey('data')) {
  if(T == User) {
  data = User.fromJson(json['data']) as T;
  }
  }
  if(json.containsKey('object')) {

  }
  }
  }