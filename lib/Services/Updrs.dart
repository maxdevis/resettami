import 'package:flutter/foundation.dart';
import 'package:resettami_app/Models/Updrs.dart';
import 'package:resettami_app/utils/HttpService.dart';

class UpdrsService extends HttpService {

  Future<dynamic> getDatabyServizioId(int servizio_id) async {
    try {

      const url = '/app/getDataUpdrs';

      Map<String, dynamic> data = {
        'servizio_id': servizio_id.toString(),
      };

      var response = await getData(url, data);

      if(response != null) {
        Updrs data = Updrs.fromJson(response);
        if(data.op && data.model!.isNotEmpty) {
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


  Future<dynamic> getDataUpdrs(int paziente_id, DateTime dataComp, String c213b) async {
    try {

      const url = '/app/getDataUpdrs';

      Map<String, dynamic> data = {
        'paziente_id': paziente_id.toString(),
        'data_comp': dataComp.toString(),
        'c213b': c213b
      };

      var response = await getData(url, data);

      if(response != null) {
        Updrs data = Updrs.fromJson(response);
        if(data.op && data.model!.isNotEmpty) {
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