import 'dart:convert';
import 'dart:developer';

//import 'package:dio/dio.dart';
import 'package:http/http.dart';

class ApiClient {
  //final Dio _dio = Dio();
  static const urlApi = 'http://humusbe.local/api/';

  /*<Response?> registerUser() async {
    //IMPLEMENT USER REGISTRATION
    return null;
  }*/

  /*Future<Response> login(String email, String password) async {
    try {
      Response response = await _dio.post(
        '${ApiClient.urlApi}/login',
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

  Future<dynamic> test() async {
    try {
      Response response = await post(
          Uri.parse('http://humusbe.local/api/loginExt'),
          body: {
            'username': 'DVTMSM70B12D883I',
            'password': 'Max12021970!'
          }
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        return data;
        log(data['token']);
        log('Login successfully');
      } else {
        log('failed');
        return null;
      }
    } catch (e) {
      log('error');
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