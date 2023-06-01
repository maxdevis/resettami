import 'package:flutter/foundation.dart';
import 'package:resettami_app/Models/Paziente/Ricerca.dart';
import 'package:resettami_app/utils/HttpService.dart';

class PazientiService extends HttpService {


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
        RicercaPaziente data = RicercaPaziente.fromJson(response);
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