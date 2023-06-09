import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resettami_app/Library/SecureStorage.dart';
import 'package:resettami_app/Models/User.dart';
import 'package:resettami_app/utils/Constants.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key, required this.title});
  final String title;

  @override
  State<MyDrawer> createState() => _MyDrawerState();

}

class _MyDrawerState extends State<MyDrawer> {
  late String nameUser = "";
  late String emailUser = "";

  @override
  initState() {
    super.initState();
    _readFromStorage();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.5,
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: Color(0xff00A19B)),
            accountName: Text(
              nameUser,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            accountEmail: Text(
              emailUser,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            currentAccountPicture: const Image(
              image: AssetImage('assets/images/doctor.png'),
              fit: BoxFit.fitHeight,
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.home,
            ),
            title: const Text('Home'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/home');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.train,
            ),
            title: const Text('Ricerca Assistiti'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/ricAss');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.login,
            ),
            title: const Text('Login'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/logout');
            },
          ),
        ],
      ),
    );
  }

  Future<void> _readFromStorage() async {
    late SecureStorage sessionStorage = SecureStorage();
    var user = User.deserialize(
        await sessionStorage.readData(eLogin.KEY_USER.toString()) as String);
    nameUser = (user.operatore)!;
    emailUser = (user.email)!;
    setState(() {});
  }


}
