import 'package:flutter/foundation.dart';
import 'package:resettami_app/Models/Updrs.dart';
import 'package:resettami_app/utils/HttpService.dart';

class UpdrsService extends HttpService {


  Future<dynamic> getUpdrsOff(int servizio_id) async {
    try {

      const url = '/app/getDataUpdrsOff';

      Map<String, dynamic> data = {
        'servizio_id': servizio_id.toString(),
      };

      var response = await getData(url, data);

      if(response != null) {
        Updrs data = Updrs.fromJson(response);
        if(data.op) {
          if(data.model!.isNotEmpty){
            return data;
          }
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

  Future<dynamic> getUpdrsOn(int paziente_id, DateTime dataComp) async {
    try {

      const url = '/app/getDataUpdrsOn';

      Map<String, dynamic> data = {
        'paziente_id': paziente_id.toString(),
        'data_comp': dataComp.toString(),
      };

      var response = await getData(url, data);

      if(response != null) {
        Updrs data = Updrs.fromJson(response);
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