import 'package:flutter/material.dart';
import 'package:resettami_app/Component/myAppBar.dart';
import 'package:resettami_app/Component/myDrawer.dart';
import 'package:resettami_app/Models/Updrs.dart';
import 'package:resettami_app/Screens/Pazienti/Visite/Anamnesi/Updrs/updrsPartePrima.dart';

class updrsMainScreen extends StatefulWidget {
  const updrsMainScreen({super.key, required this.updrs});

  final Updrs updrs;

  @override
  State<updrsMainScreen> createState() => _updrsMainState();
}

class _updrsMainState extends State<updrsMainScreen> {
  int _selectedIndex = 0;
  late final Updrs _updrs;

  /*static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);*/
  static final List<Widget> _widgetOptions = <Widget>[
    updrsPartePrimaScreen(updrs: _updrs),
    const Text(
      'Parte II',
      //style: optionStyle,
    ),
    const Text(
      'Parte III',
      //style: optionStyle,
    ),
    const Text(
      'Parte IV',
      //style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const MyAppBar(
          title: 'Resettami Parkylon',
        ),
        drawer: const MyDrawer(title: 'Resettami Parkylon'),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            // sets the background color of the `BottomNavigationBar`
            canvasColor: const Color(0xFF00A19B),
            // sets the active color of the `BottomNavigationBar` if `Brightness` is light
            primaryColor: Colors.white,
          ),
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.looks_one),
                label: 'Parte I',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.looks_two),
                label: 'Parte II',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.looks_3),
                label: 'Parte III',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.looks_4_sharp),
                label: 'Parte IV',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ));
  }
}
