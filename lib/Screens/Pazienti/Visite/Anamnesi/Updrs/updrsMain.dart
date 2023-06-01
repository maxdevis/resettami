import 'package:flutter/material.dart';
import 'package:resettami_app/Component/myAppBar.dart';
import 'package:resettami_app/Component/myDrawer.dart';

class updrsMainScreen extends StatefulWidget {
  const updrsMainScreen({super.key});

  @override
  State<updrsMainScreen> createState() => _updrsMainState();
}

class _updrsMainState extends State<updrsMainScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Parte I',
      style: optionStyle,
    ),
    Text(
      'Parte II',
      style: optionStyle,
    ),
    Text(
      'Parte III',
      style: optionStyle,
    ),
    Text(
      'Parte IV',
      style: optionStyle,
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
