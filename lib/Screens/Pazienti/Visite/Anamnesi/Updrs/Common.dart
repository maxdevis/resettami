import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:localization/localization.dart';
import 'package:resettami_app/Models/Updrs.dart';
import 'package:resettami_app/Services/Updrs.dart';
import 'package:resettami_app/utils/Uty.dart';

class Common {
  const Common();



  Color getColor(int index, Updrs updrs, Map valori, [List<String>? listExlude]) {
    final keyVal = valori.keys.elementAt(index);
    final json = updrs.model!.map((v) => v.toJson()).toList();
    final ret = json[0].containsKey(keyVal);
    final exlude = listExlude?.contains(keyVal);

    if (ret && json[0][keyVal] != null && (exlude == null || !exlude)) {
      var t = json[0][keyVal];
      switch (t) {
        case '0':
          return Colors.white;
        case '1':
          return Colors.green;
        case '2':
          return Colors.amber;
        case '3':
          return Colors.orange;
        case '4':
          return Colors.red;
        default:
          return Colors.white;
      }
    }
    return Colors.white;
  }

  Color getColorIcon(int index, Updrs updrs, Map valori) {
    final keyVal = valori.keys.elementAt(index);
    final json = updrs.model!.map((v) => v.toJson()).toList();
    final ret = json[0].containsKey(keyVal);

    if (ret && json[0][keyVal] != null) {
      var t = json[0][keyVal];
      switch (t) {
        case '0':
          return Colors.black;
        default:
          return Colors.white;
      }
    }
    return Colors.black;
  }

  IconData getIcon(int index, Updrs updrs, Map valori) {
    final keyVal = valori.keys.elementAt(index);
    final json = updrs.model!.map((v) => v.toJson()).toList();
    final ret = json[0].containsKey(keyVal);

    if (ret && json[0][keyVal] != null) {
      var t = json[0][keyVal];
      switch (t) {
        case '0':
          return Icons.exposure_zero;
        case '1':
          return Icons.looks_one_rounded;
        case '2':
          return Icons.looks_two_rounded;
        case '3':
          return Icons.looks_3_rounded;
        case '4':
          return Icons.looks_4_rounded;
        case '5':
          return Icons.looks_5_rounded;
        default:
          return Icons.looks_5_rounded;
      }
    }

    return Icons.exposure_zero;
  }

  String getValue(int index, Updrs updrs, Map valori) {
    final keyVal = valori.keys.elementAt(index);
    final json = updrs.model!.map((v) => v.toJson()).toList();
    final ret = json[0].containsKey(keyVal);

    if (ret && json[0][keyVal] != null) {
      return json[0][keyVal];
    }
    return "";
  }

  String getTitle(Updrs updrs, int sezione) {
    String ret = "";
    if (updrs.model!.isNotEmpty) {
      DateTime dt = updrs.model![0].dataComp;
      ret = 'Data Comp.: ${DateFormat('dd-MM-yyyy').format(dt)}';
      switch(sezione){
        case 1:
          ret += ' - Tot.: ${updrs.model?[0].totale1}';
          break;
        case 2:
          ret += ' - Tot.: ${updrs.model?[0].totale2}';
          break;
        case 3:
          ret += ' - Tot.: ${updrs.model?[0].totale3}';
          break;
        case 4:
          ret += ' - Tot.: ${updrs.model?[0].totale4}';
          break;
      }

      return ret;
    }

    return "";
  }

  String getDescription(int index, Updrs updrs, Map valori) {
    final desc = valori.values.elementAt(index);
    if(desc != null){
      return desc;
    }
    return "";
  }

  Future<dynamic> getDataUpdrs(int pazienteId, DateTime dataComp, String c213b) async {
    EasyLoading.show(status: 'wait'.i18n());
    UpdrsService api = UpdrsService();
    var res = await api.getDataUpdrs(pazienteId, dataComp, c213b);
    EasyLoading.dismiss();
    if (res == null) {
      showMyDialog('Errore caricamento dati');
    }

    return res;
  }



}