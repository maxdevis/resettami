import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key, required this.title});
  final String title;

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
            //action for user icon button
          },
        )
      ],
    );
  }

}