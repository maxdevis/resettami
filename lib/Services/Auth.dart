import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:resettami_app/Models/User.dart';
import 'package:resettami_app/utils/HttpService.dart';

class AuthService extends HttpService {
  Future<dynamic> login(String username, String password) async {
    try {

      Map<String, String> data = {'name': username, 'password': password};

      var response = await postData('/loginExt', data);

      if (response != null) {
        UserModel data = UserModel.fromJson(response);
        if(data.op){
          return data;
        }
      }

      return null;

    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

}
