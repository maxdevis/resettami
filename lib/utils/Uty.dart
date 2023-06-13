import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:intl/intl.dart';
import 'package:localization/localization.dart';
import 'Constants.dart';

Future<void> showMyDialog(String message, {String title = 'Attenzione'}) async {
  SmartDialog.show(builder: (context) {
    return Container(
      height: 80,
      width: 180,
      decoration: BoxDecoration(
        color: const Color(0xFF13B5A2),
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child:
      Text(message, style: const TextStyle(color: Colors.white)),
    );
  });
}

void waitDialog([String msg = ""]){
  msg = msg == "" ? 'wait'.i18n() : msg;
  SmartDialog.showLoading(builder: (context) {
    return Container(
      height: 100,
      width: 180,
      decoration: BoxDecoration(
        color: const Color(0xFF13B5A2),
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: Column(
        children: [
          const SizedBox(height: 5),
          Image.asset(
            'assets/images/loader.gif',
            height: 50.0,
            width: 50.0,
          ),
          const SizedBox(height: 10),
          Text(msg, style: const TextStyle(color: Colors.white)),
        ],
      )
    );
  });
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
