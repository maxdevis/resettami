import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:resettami_app/Models/User.dart';
import 'package:resettami_app/utils/HttpService.dart';

class AuthService extends HttpService {
  Future<dynamic> login(String username, String password) async {
    try {

      Map<String, String> data = {'username': username, 'password': password};

      var response = await postData('/loginExt', data);

      if (response != null) {
        UserModel data = UserModel.fromJson(response);
        return data;
      } else {
        log('failed');
        return UserModel(op: false);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return UserModel(op: false);
    }
  }

}
