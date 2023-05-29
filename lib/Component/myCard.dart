import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class myCard extends StatelessWidget {
  const myCard({super.key, required this.title, required this.bkColor, required this.iconCard});
  final String title;
  final Color bkColor;
  final IconData iconCard;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: bkColor,
        margin: const EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        child: Column(
            children: [
              ListTile(
                leading: FaIcon(iconCard, size: 50.0, color: Colors.white,),
                title: const Text(''),
                subtitle: const Text(
                  '',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                //mainAxisAlignment: MainAxisAlignment.end,
                padding: const EdgeInsets.only(left: 0, top: 16.0, bottom: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              )
            ]
        )
      )
    );
  }
}