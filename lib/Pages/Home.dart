import 'package:flutter/material.dart';
import '../Component/myDrawer.dart';
import '../Component/myAppBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(
        title: 'MyAppBar',
      ),
      //set app bar from appbar.dart
      // use like this where ever you want
      drawer: MyDrawer(title: 'MyDrawer'),
      //set drawer from app_drawer.dart
      //set like this where ever you want
      body: Center(
          child: Text(
        "Reusable Drawer and Appbar",
        style: TextStyle(fontSize: 20),
      )),
    );
  }
}
