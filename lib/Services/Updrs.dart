import 'package:flutter/foundation.dart';
import 'package:resettami_app/Models/Updrs.dart';
import 'package:resettami_app/utils/HttpService.dart';

class UpdrsService extends HttpService {


  Future<dynamic> getUpdrs(String id) async {
    try {

      const url = '/app/getDataUpdrs';

      Map<String, dynamic> data = {
        'id': id,
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