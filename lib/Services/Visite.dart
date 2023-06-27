import 'package:flutter/foundation.dart';
import 'package:resettami_app/Models/Visite.dart';
import 'package:resettami_app/Services/HttpService.dart';

class VisiteService extends HttpService {


  Future<dynamic> getVisite(String pazienteId) async {
    try {

      const url = '/app/getVisite';

      Map<String, dynamic> data = {
        'paziente_id': pazienteId,
      };

      var response = await getData(url, data);

      if(response != null) {
        Visite data = Visite.fromJson(response);
        if(data.op) {
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