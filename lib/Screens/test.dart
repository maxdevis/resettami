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
              height: 60,
              width: double.infinity,
              child: Card(
                margin: const EdgeInsets.all(5),
                color: Colors.white,
                shadowColor: const Color(0xff00A19B),
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                          height: 30,
                          width: 30,
                          margin: const EdgeInsets.only(top: 10, left: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                width: 2,
                                color: Colors.black,
                              ),
                              borderRadius: const BorderRadius.all(Radius.circular(5))
                          ),
                          child: const Center(
                            heightFactor: 3.5,
                            child: Text('17', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold))
                          )
                      ),
                    ),
                    Expanded(
                      flex: 9,
                      child: Container(
                          height: 50,
                          child: const Center(
                              child: Text('xxxxxxxxxxxxxxxxxxxxxxxxxxxxx')
                          )
                      ),
                    ),
                  ],
                ),
              ));
        },
      ),
    );
  }
}
