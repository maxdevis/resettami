import 'package:flutter/material.dart';

const darkColor = Color(0xFF49535C);

class SchedaPaziente extends StatelessWidget {
  const SchedaPaziente({super.key, required this.name, required this.codiceFiscale});

  final String name;
  final String codiceFiscale;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow,
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/doctor.png'),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                codiceFiscale,
                style: const TextStyle(fontSize: 15),
              ),
              const SizedBox(
                height: 10,
                width: 150,
                child: Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
              ),
              const Card(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                color: Colors.grey,
                child: ListTile(
                  leading: Icon(Icons.phone),
                  title: Text('+44 4745121545451'),
                ),
              ),
              const Card(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                color: Colors.grey,
                child: ListTile(
                  leading: Icon(Icons.mail),
                  title: Text('abc@gmail.com'),
                ),
              )
            ],
          ),
        ));
  }
}
