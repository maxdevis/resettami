import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resettami_app/Component/myCard.dart';
import 'package:resettami_app/Screens/Home.dart';
import 'package:resettami_app/Screens/Login.dart';
import 'package:resettami_app/Screens/Second.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

enum eLogin {
  KEY_USERNAME,
  KEY_PASSWORD,
  KEY_TOKEN,
  KEY_TYPE_AUTH
}

final routes = {
  '/home': (context) => const HomePage(),
  '/second': (context) => const SecondPage(title: 'SecondPage'),
  '/login': (context) => const LoginPage(),
};

List<Widget> listCards = [
  const myCard(title: 'Tot. strutture 20', bkColor: Color(0xFF2A9FD6), iconCard: FontAwesomeIcons.solidHospital),
  const myCard(title: 'Tot. Operatori 13', bkColor: Color(0xFF4CAF50), iconCard: FontAwesomeIcons.userNurse),
  const myCard(title: 'Tot. Utenti 3.459', bkColor: Color(0xFFFF9800), iconCard: FontAwesomeIcons.users),
  const myCard(title: 'Tot. Visite 1.346', bkColor: Color(0xFFE51C23), iconCard: FontAwesomeIcons.hospitalUser),
];
