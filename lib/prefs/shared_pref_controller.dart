

import 'package:elancer_second_proj/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum prefKeys{
  loggedIn,
  id,
  name,
  cityEn,
  cityAr,
  gender,
  mobile,
  lang,
  token
}
class SharedPrefController {
  SharedPrefController._();

  static final SharedPrefController _instance = SharedPrefController._();


  late SharedPreferences _sharedPreferences;

  factory SharedPrefController() {
    return _instance;
  }

  Future<void> initPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }
  Future<void> save({ required User user}) async{

    await _sharedPreferences.setString(prefKeys.name.toString(), user.name);
    await _sharedPreferences.setInt(prefKeys.id.toString(), user.id);
    await _sharedPreferences.setString(prefKeys.gender.toString(), user.gender);
    await _sharedPreferences.setString(prefKeys.mobile.toString(), user.mobile);
    await _sharedPreferences.setString(prefKeys.cityAr.toString(), user.city.nameAr);
    await _sharedPreferences.setString(prefKeys.cityEn.toString(), user.city.nameEn);
    await _sharedPreferences.setString(prefKeys.token.toString(), 'Bearer '+user.token);
    await _sharedPreferences.setBool(prefKeys.loggedIn.toString(), true);

  }

  bool get loggedIn {
    return _sharedPreferences.getBool(prefKeys.loggedIn.toString()) ?? false;
  }

  String get token{
    return _sharedPreferences.getString(prefKeys.token.toString())?? '';
  }

  String get language{
    return _sharedPreferences.getString(prefKeys.lang.toString())??'';
  }


  Future<bool> logout() async{
    return await _sharedPreferences.setBool(prefKeys.loggedIn.toString(), false);
}



  Future<bool> clear()async{
    return await _sharedPreferences.clear();
  }

  Future<bool> setLang({required String lang}) async{
    return await _sharedPreferences.setString(prefKeys.lang.toString(), lang);
  }
}