import 'package:flutter/material.dart';
import '../Component/myAppBar.dart';
import '../Component/myDrawer.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[100],
        appBar: const MyAppBar( title: 'MyAppBar',),
        //set app bar from appbar.dart
        // use like this where ever you want
        drawer: const MyDrawer(title: 'MyDrawer'),
        //set drawer from app_drawer.dart
        //set like this where ever you want
        body: const Center(
            child: Text("SecondPage",
              style: TextStyle(fontSize: 20),
            )
        )
    );
  }
}