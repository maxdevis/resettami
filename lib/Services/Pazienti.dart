import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:resettami_app/Models/Paziente.dart';
import 'package:resettami_app/utils/HttpService.dart';

class PazientiService extends HttpService {

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
        Paziente data = Paziente.fromJson(response);
        return data;
      }

      return Paziente(op: false);

    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return Paziente(op: false);
    }
  }

  Future<dynamic> search(String? codiceFiscale, String? cognome, String? nome) async {
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
        Paziente data = Paziente.fromJson(response);
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

}