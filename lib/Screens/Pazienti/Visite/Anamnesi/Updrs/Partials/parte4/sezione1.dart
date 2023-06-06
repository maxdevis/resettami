import 'package:flutter/material.dart';
import 'package:resettami_app/Models/Updrs.dart';
import 'package:resettami_app/Screens/Pazienti/Visite/Anamnesi/Updrs/Common.dart';

class sezione1 extends StatelessWidget {
  sezione1({super.key, required this.updrs, required this.valori});

  final Updrs updrs;
  final Map valori;
  late Common com = const Common();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Card(
          child: Container(
              height: 40,
              decoration: const BoxDecoration(
                color: Color(0xff00A19B),
                //border: Border.all(color: const Color(0xff00A19B)),
                //borderRadius: const BorderRadius.all(Radius.circular(10))
              ),
              child: const Center(
                child: Text("Sezione 4.1",
                    style: TextStyle(color: Colors.white)),
              )),
        ),
        for (int i = 0; i < 3; i++) ...[
          SizedBox(
              height: 70,
              width: double.infinity,
              child: Center(
                child: Card(
                  color:  i == 0 ? com.getColor(i, updrs, valori) : Colors.white,
                  shadowColor: Colors.blueGrey,
                  elevation: 10,
                  child: ListTile(
                    title: Text('[${com.getValue(i, updrs, valori)}] - ${com.getDescription(i, updrs, valori)}'),
                  ),
                ),
              ))
        ]
      ],
    );
  }
}