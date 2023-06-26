import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:intl/intl.dart';
import 'package:localization/localization.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'Constants.dart';

Future<void> showMyDialog(String message, { AlertType alertType = AlertType.error ,String title = 'Attenzione'}) async {
  Alert(
    context: navigatorKey.currentContext!,
    type: alertType,
    title: title,
    desc: message,
    buttons: [
      DialogButton(
        color: const Color(0xFF13B5A2),
        onPressed: () => Navigator.pop(navigatorKey.currentContext!),
        width: 120,
        child: const Text(
          "Ok",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      )
    ],
  ).show();
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

Future<bool> checkConn() async {
  try {
    final connectivityResult = await (Connectivity().checkConnectivity());
    bool ret = (connectivityResult == ConnectivityResult.wifi
        || connectivityResult == ConnectivityResult.mobile);

    return ret;
  } on SocketException catch (_) {
    return false;
  }
}
