import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:resettami_app/Models/Assistito.dart';

import '../Models/User.dart';
//import 'package:http/http.dart';

class HttpService {
  final Dio _dio = Dio();
  static const urlApi = 'http://humusbe.local/api/';

  /*<Response?> registerUser() async {
    //IMPLEMENT USER REGISTRATION
    return null;
  }*/

  /*Future<Response> login(String email, String password) async {
    try {
      Response response = await _dio.post(
        '${HttpService.urlApi}/login',
        data: {
          'username': email,
          'password': password
        },
        //queryParameters: {'apikey': 'YOUR_API_KEY'},
      );
      //returns the successful user data json object
      log('data: $response');
      return response.data;
    } on DioError catch (e) {
      //returns the error object if any
      return e.response!.data;
    }
  }*/

  Future<dynamic> login(String username, String password) async {
    try {
      Response response = await _dio.post(
          'http://humusbe.local/api/loginExt',
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

  Future<dynamic> searchAss(String codice_fiscale) async {
    try {
      Response response = await _dio.get(
          'http://humusbe.local/api/persona/assistito/search',
          data: {
            'codice_fiscale': codice_fiscale,
          }
      );

      if (response.statusCode == 200) {
        Assistito data = Assistito.fromJson(response.data);
        return data;
      } else {
        log('failed');
        return null;
      }
    } on DioError catch (e) {
      //returns the error object if any
      return null;
    }
  }


/*Future<Response?> getUserProfileData() async {
  return null;
}

Future<Response?> logout() async {
  return null;
}*/

}