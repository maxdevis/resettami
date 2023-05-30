import 'package:dio/dio.dart';

class HttpService {
  Dio dio = Dio();
  static const urlApi = 'http://humusbe.local/api/';

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