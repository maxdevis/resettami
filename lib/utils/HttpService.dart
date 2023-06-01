import 'dart:convert' as convert;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:resettami_app/Library/SecureStorage.dart';
import 'package:resettami_app/utils/Constants.dart';

class HttpService {
  final SecureStorage _sessionStorage = SecureStorage();
  static const urlApi = 'http://resettami_tcpi.local/api';
  static const xdebug = '?XDEBUG_SESSION_START=PHPSTORM';

  Future<Map<String, String>> getOptions() async {
    String token =
        await _sessionStorage.readData(eLogin.KEY_TOKEN.toString()) ?? "";
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    return headers;
  }

  Future<Map<String, dynamic>?> getData(String url, data) async {
    try {
      var options = await getOptions();
      String params = Uri(queryParameters: data).query;
      String uri = '$urlApi$url?$params&XDEBUG_SESSION_START=PHPSTORM';

      final response = await http.get(Uri.parse(uri), headers: options);

      if (response.statusCode == 200) {
        var data = convert.jsonDecode(response.body) as Map<String, dynamic>;
        return data;
      }
      return null;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

  Future<Map<String, dynamic>?> postData(String url,  Map<String, dynamic> data) async {
    try {
      var options = await getOptions();

      String uri = '$urlApi$url?XDEBUG_SESSION_START=PHPSTORM';

      final response = await http.post(Uri.parse(uri),
        headers: options,
        body: jsonEncode(data)
      );

      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
        return jsonResponse;
      }
      return null;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

  String getQueryString(Map params, {String prefix = '&', bool inRecursion = false}) {

    String query = '';

    params.forEach((key, value) {

      if (inRecursion) {
        key = '[$key]';
      }

      if (value is String || value is int || value is double || value is bool) {
        query += '$prefix$key=$value';
      } else if (value is List || value is Map) {
        if (value is List) value = value.asMap();
        value.forEach((k, v) {
          query += getQueryString({k: v}, prefix: '$prefix$key', inRecursion: true);
        });
      }
    });

    return query;
  }

/*<Response?> registerUser() async {
    //IMPLEMENT USER REGISTRATION
    return null;
  }*/

/*Future<dynamic> searchAss(String cognome, String nome) async {
    try {
      Response response = await _dio.get(
          'http://humusbe.local/api/persona/assistito/search',
          data: {
            'cognome': cognome,
            'nome': nome,
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
  }*/

/*Future<Response?> getUserProfileData() async {
  return null;
}

Future<Response?> logout() async {
  return null;
}*/
}
