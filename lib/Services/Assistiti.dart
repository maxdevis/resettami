import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:resettami_app/Models/Assistito.dart';
import 'package:resettami_app/utils/HttpService.dart';

class AssistitiService extends HttpService {

  Future<dynamic> searchAss(String? codiceFiscale, String? cognome, String? nome) async {
    try {

      const url = '/persona/assistito/searchBase';

      Map<String, dynamic> data = {
        'tipo_ricerca_id': "1",
        'codice_fiscale': codiceFiscale,
        'cognome': cognome,
        'nome': nome,
      };

      var response = await getData(url, data);

      if(response != null) {
        Assistito data = Assistito.fromJson(response);
        return data;
      }

      return Assistito(op: false);

    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return Assistito(op: false);
    }
  }

}