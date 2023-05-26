import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

enum eLogin {
  KEY_REMEMBER,
  KEY_USERNAME,
  KEY_PASSWORD,
  KEY_TOKEN,
  KEY_TYPE_AUTH
}
