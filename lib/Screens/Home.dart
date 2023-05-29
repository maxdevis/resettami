import 'package:flutter/material.dart';
import 'package:resettami_app/Component/myCard.dart';
import 'package:resettami_app/Component/myDrawer.dart';
import 'package:resettami_app/Component/myAppBar.dart';
import 'package:resettami_app/utils/Constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const MyAppBar(
          title: 'MyAppBar',
        ),
        //set app bar from appbar.dart
        // use like this where ever you want
        drawer: const MyDrawer(title: 'MyDrawer'),
        //set drawer from app_drawer.dart
        //set like this where ever you want
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: listCards
        ),
    );
  }
}
