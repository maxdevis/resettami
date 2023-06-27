import 'package:flutter/foundation.dart';
import 'package:resettami_app/Models/Paziente.dart';
import 'package:resettami_app/Services/HttpService.dart';

class PazientiService extends HttpService {


  Future<dynamic> search(String? codice, String? codiceFiscale, String? cognome, String? nome) async {
    try {

      const url = '/app/searchPazienti';

      Map<String, dynamic> data = {
        'id': codice,
        /*'codice_fiscale': codiceFiscale,
        'cognome': cognome,
        'nome': nome,*/
      };

      var response = await getData(url, data);

      if(response != null) {
        Paziente data = Paziente.fromJson(response);
        if(data.op){
          return data;
        }
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