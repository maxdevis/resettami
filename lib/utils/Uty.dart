import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:intl/intl.dart';
import 'package:localization/localization.dart';
import 'Constants.dart';

Future<void> showMyDialog(String message, {String title = 'Attenzione'}) async {
  return showDialog<void>(
    context: navigatorKey.currentContext!,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              //Text('This is a demo alert dialog.'),
              Text(message),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

void waitDialog([String text = ""]){
   text = text == "" ? 'wait'.i18n() : text;
  SmartDialog.showLoading(msg: text, maskColor: const Color(0xFF13B5A2));
}


String getFormatData(String? data, [String format = 'dd-MM-yyyy']) {
  try {
    if (data != null) {
      DateTime dt = DateTime.parse(data);
      return DateFormat(format).format(dt);
    }
    return "";
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
    return "";
  }
}
