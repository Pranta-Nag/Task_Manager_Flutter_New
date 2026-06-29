import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskmanager/data/model/user_data.dart';

class AuthController {

  static String ? accessToken;
  static UserModel ? userData;

  static Future saveUserData(UserModel model, String token) async{

    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    sharedPreferences.setString('token', token);
    sharedPreferences.setString('user-data', jsonEncode(model.toJson()));

    accessToken = token;
    userData = model;

  }

}