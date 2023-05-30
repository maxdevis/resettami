import 'package:flutter/material.dart';
import 'package:resettami_app/Component/myDrawer.dart';
import 'package:resettami_app/Component/myAppBar.dart';

class HealtCheckScreen extends StatefulWidget {
  const HealtCheckScreen({super.key});

  @override
  HealtCheckScreenState createState() => HealtCheckScreenState();
}

class HealtCheckScreenState extends State<HealtCheckScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const MyAppBar(
        title: 'Healthcheck',
      ),
      drawer: MyDrawer(title: 'Resettami Parkylon'),
      //set drawer from app_drawer.dart
      //set like this where ever you want
      body: SingleChildScrollView(
         child: Column(
             children: [
               Row(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisAlignment: MainAxisAlignment.start,
                   mainAxisSize: MainAxisSize.min,
                   children: <Widget>[
                     Expanded(
                       child: Image.asset('assets/images/img1.png'),
                     ),
                     Expanded(
                       child: Image.asset('assets/images/img2.png'),
                     ),
                     Expanded(
                       child: Image.asset('assets/images/img3.png'),
                     ),
                     Expanded(
                       child: Image.asset('assets/images/img4.png'),
                     ),
                   ]
               ),
               Image.asset('assets/images/anatomy_man_transp.jpg')
             ]
         )
      ),

    );
  }
}
