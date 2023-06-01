import 'package:flutter/material.dart';
import 'package:resettami_app/Component/myDrawer.dart';
import 'package:resettami_app/Models/Updrs.dart';

class updrsPartePrimaScreen extends StatefulWidget {
  const updrsPartePrimaScreen({super.key, required this.updrs});

  final Updrs updrs;

  @override
  _updrsPartePrimaState createState() => _updrsPartePrimaState();
}

class _updrsPartePrimaState extends State<updrsPartePrimaScreen> {

  List<String> valori = [
    'c11', 'c12'
  ];

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      drawer: MyDrawer(title: 'Resettami Parkylon'),
      //set drawer from app_drawer.dart
      //set like this where ever you want
      body: SingleChildScrollView(
          child: Column(

          )
      ),

    );
  }
}
