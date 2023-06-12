import 'package:flutter/material.dart';
import 'package:resettami_app/Screens/Pazienti/Visite/Anamnesi/Updrs/Common.dart';

class test extends StatelessWidget {
  test({super.key});

  final String title = "Test";
  final Map valori = {
    'c403': 'Tempo trascorso in fase OFF',
    'np4offnum': 'Numeratore (numero ore in stato OFF)',
    'np4offden': 'Denominatore (Numero ore sveglio)',
    'np4offpct': 'Camminare ed equilibrio',
  };

  final Common com = const Common();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: valori.length,
        itemBuilder: (context, index) {
          return SizedBox(
              height: 70,
              width: double.infinity,
              child: Card(
                margin: const EdgeInsets.all(5),
                color: Colors.white,
                shadowColor: const Color(0xff00A19B),
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 7, left: 7, right: 7, bottom: 0),
                      child: Text(
                        "Moderato",
                        style: TextStyle(
                            fontSize: 12.0,
                            color: Color(0xFF000000),
                            fontWeight: FontWeight.w200,
                            fontFamily: "Roboto"),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 2, left: 7, right: 7, bottom: 7),
                        child: Flexible(
                            child: Text(
                          "cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc",
                          style: TextStyle(
                              fontSize: 12.0,
                              color: Color(0xFF000000),
                              fontWeight: FontWeight.w200,
                              fontFamily: "Roboto"),
                        ))),
                  ],
                ),
              ));
        },
      ),
    );
  }
}
