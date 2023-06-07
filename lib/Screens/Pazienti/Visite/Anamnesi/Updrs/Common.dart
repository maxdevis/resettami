import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:resettami_app/Models/Updrs.dart';

class Common {
  const Common();



  Color getColor(int index, Updrs updrs, Map valori, [List<String>? listExlude]) {
    final keyVal = valori.keys.elementAt(index);
    final json = updrs.model!.map((v) => v.toJson()).toList();
    final ret = json[0].containsKey(keyVal);
    final exlude = listExlude?.contains(keyVal);

    if (ret && !exlude!) {
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

    if (ret) {
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

    if (ret) {
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

    if (ret) {
      return json[0][keyVal];
    }
    return "";
  }

  String getTitle(Updrs updrs) {
    String ret = "";
    if (updrs.model!.isNotEmpty) {
      DateTime dt = DateTime.parse(updrs.model![0].dataComp ?? "");
      ret = 'Data Comp.: ${DateFormat('dd-MM-yyyy').format(dt)}';
      ret += ' - Tot.: ${updrs.model?[0].totale4}';

      return ret;
    }
    return "";
  }

  String getDescription(int index, Updrs updrs, Map valori) {
    final desc = valori.values.elementAt(index);
    return desc;
  }

}