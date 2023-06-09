import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resettami_app/Screens/Login.dart';
import 'package:resettami_app/utils/Constants.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key, required this.title, this.route = ''});
  final String title;
  final String route;

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xff00A19B),
      //background color of Appbar to green
      title: Text(title),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: (){
            //action for search icon button
          },
        ),
        IconButton(
          icon: const Icon(Icons.person),
          onPressed: (){
            popupMenuPerson(context);
          },
        ),
        Visibility(
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          visible: (route != '' || route == '*'),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: (){
              //Navigator.pop(navigatorKey.currentContext!);
              if(route != '' && route != '*'){
                Navigator.pushReplacementNamed(context, route);
              }
              else{
                Navigator.of(context).pop();
              }
            },
          ),
        ),
      ],
    );
  }

  popupMenuPerson(context){
    showMenu<String>(
      context: context,
      position: const RelativeRect.fromLTRB(25.0, 25.0, 0.0, 0.0),  //position where you want to show the menu on screen
      items: [
        const PopupMenuItem<String>(
            value: '1',
            child: Text('Logout')),
      ],
      elevation: 8.0,
    ).then<void>((String itemSelected) {
      switch(itemSelected){
        case "1":
          if (context.mounted) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => const LoginPage()));
          }
          break;
      }

    } as FutureOr<void> Function(String? value));
  }

}