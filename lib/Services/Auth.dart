import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:resettami_app/Models/User.dart';
import 'package:resettami_app/utils/HttpService.dart';

class AuthService extends HttpService {

  Future<dynamic> login(String username, String password) async {
    try {
      Response response = await dio.post(
          '${HttpService.urlApi}/loginExt',
          data: {
            'username': username,
            'password': password
          }
      );

      if (response.statusCode == 200) {
        UserModel data = UserModel.fromJson(response.data);
        return data;
      } else {
        log('failed');
        return UserModel(op: false);
      }
    } on DioError catch (e) {
      //returns the error object if any
      return UserModel(op: false);
    }
  }

}