import 'package:flutter/material.dart';
import 'package:resettami_app/Models/Updrs.dart';
import 'package:resettami_app/Screens/Pazienti/Visite/Anamnesi/Updrs/Common.dart';

class sezioniParteQuarta extends StatelessWidget {
  sezioniParteQuarta({super.key, required this.updrs, required this.valori, required this.title});

  final Updrs updrs;
  final Map valori;
  final String title;
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
              child: Center(
                child: Text(title,
                    style: const TextStyle(color: Colors.white)),
              )),
        ),
        for (int i = 0; i < valori.length; i++) ...[
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