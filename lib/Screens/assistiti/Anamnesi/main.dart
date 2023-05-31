import 'package:flutter/material.dart';
import 'package:resettami_app/Component/myAppBar.dart';
import 'package:resettami_app/Component/myDrawer.dart';
import 'package:resettami_app/Screens/assistiti/Anamnesi/HealtCheck.dart';
import 'package:resettami_app/utils/Constants.dart';

class anamnesiScreen extends StatefulWidget {
  const anamnesiScreen({super.key});

  @override
  State<anamnesiScreen> createState() => _anamensiState();
}

class _anamensiState extends State<anamnesiScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    HealtCheckScreen()
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
        drawer: MyDrawer(title: 'Resettami Parkylon'),
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
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.timer),
                label: 'Business',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.monitor),
                label: 'School',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.check),
                label: 'Healthcheck',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ));
  }
}
