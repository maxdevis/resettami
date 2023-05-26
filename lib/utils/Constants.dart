import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/Home.dart';
import 'package:flutter_app/Pages/Login.dart';
import 'package:flutter_app/Pages/Second.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

enum eLogin {
  KEY_REMEMBER,
  KEY_USERNAME,
  KEY_PASSWORD,
  KEY_TOKEN,
  KEY_TYPE_AUTH
}

final routes = {
'/home': (context) => const HomePage(),
'/second': (context) => const SecondPage(title: 'SecondPage'),
'/login': (context) => const LoginPage(title: 'LoginPage'),
};
