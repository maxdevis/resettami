import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:resettami_app/Models/Assistito.dart';
import 'package:resettami_app/utils/HttpService.dart';

class AssistitiService extends HttpService {

  Future<dynamic> searchAss(String? codiceFiscale, String? cognome, String? nome) async {
    try {

      Response response = await dio.get(
          '${HttpService.urlApi}/persona/assistito/search',
          data: {
            'codice_fiscale': codiceFiscale,
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
  }

}