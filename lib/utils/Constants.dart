import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resettami_app/Component/myCard.dart';
import 'package:resettami_app/Component/myCharts.dart';
import 'package:resettami_app/Screens/Home.dart';
import 'package:resettami_app/Screens/Login.dart';
import 'package:resettami_app/Screens/Pazienti/search.dart';


final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

enum eLogin {
  KEY_USER,
  KEY_USERNAME,
  KEY_PASSWORD,
  KEY_EMAIL,
  KEY_TOKEN,
  KEY_TYPE_AUTH
}

/*enum eRoutes {
  HOME_SCREEN,
  RIC_ASS_SCREEN,
  LOGOUT_SCREEN,
}*/

final routes = {
  '/home': (context) => const HomePage(),
  '/ricAss': (context) => const SearchAssScreen(),
  '/logout': (context) => const LoginPage(),
  '/searchAss': (context) => const SearchAssScreen(),
};

List<Widget> listCards = [
  const myCard(title: 'Tot. strutture 20', bkColor: Color(0xFF2A9FD6), iconCard: FontAwesomeIcons.solidHospital),
  const myCard(title: 'Tot. Operatori 13', bkColor: Color(0xFF4CAF50), iconCard: FontAwesomeIcons.userNurse),
  const myCard(title: 'Tot. Utenti 3.459', bkColor: Color(0xFFFF9800), iconCard: FontAwesomeIcons.users),
  const myCard(title: 'Tot. Visite 1.346', bkColor: Color(0xFFE51C23), iconCard: FontAwesomeIcons.hospitalUser),
  const PieChartSample3()
];


class AppColors {
  static const Color primary = contentColorCyan;
  static const Color menuBackground = Color(0xFF090912);
  static const Color itemsBackground = Color(0xFF1B2339);
  static const Color pageBackground = Color(0xFF282E45);
  static const Color mainTextColor1 = Colors.white;
  static const Color mainTextColor2 = Colors.white70;
  static const Color mainTextColor3 = Colors.white38;
  static const Color mainGridLineColor = Colors.white10;
  static const Color borderColor = Colors.white54;
  static const Color gridLinesColor = Color(0x11FFFFFF);
  static const Color contentColorBlack = Colors.black;
  static const Color contentColorWhite = Colors.white;
  static const Color contentColorBlue = Color(0xFF2196F3);
  static const Color contentColorYellow = Color(0xFFFFC300);
  static const Color contentColorOrange = Color(0xFFFF683B);
  static const Color contentColorGreen = Color(0xFF3BFF49);
  static const Color contentColorPurple = Color(0xFF6E1BFF);
  static const Color contentColorPink = Color(0xFFFF3AF2);
  static const Color contentColorRed = Color(0xFFE80054);
  static const Color contentColorCyan = Color(0xFF50E4FF);
}
