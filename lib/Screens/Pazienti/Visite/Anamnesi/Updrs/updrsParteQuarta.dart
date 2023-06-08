import 'package:flutter/material.dart';
import 'package:resettami_app/Component/myDrawer.dart';
import 'package:resettami_app/Models/Updrs.dart';
import 'package:resettami_app/Screens/Pazienti/Visite/Anamnesi/Updrs/Common.dart';
import 'package:resettami_app/Screens/Pazienti/Visite/Anamnesi/Updrs/Partials/subSezioniUpdrs.dart';


class updrsParteQuartaScreen extends StatefulWidget {
  const updrsParteQuartaScreen({super.key, required this.updrs});

  final Updrs updrs;

  @override
  _updrsParteQuartaState createState() => _updrsParteQuartaState();
}

class _updrsParteQuartaState extends State<updrsParteQuartaScreen> {
  late Common com = const Common();
  late List<String> exSez1 = ['np4wdysknum', 'np4wdyskden', 'np4wdyskpct'];
  late List<String> exSez3 = ['np4offnum', 'np4offden', 'np4offpct'];
  late List<String> exSez6 = ['np4dystnnum', 'np4dystnden', 'np4dystnpct'];

  late Map sez1 = {
    'c401': 'Tempo trascorso con discinesie',
    'np4wdysknum': 'Numeratore (Numero ore discinesia)',
    'np4wdyskden': 'Denominatore (Numero ore sveglio)',
    'np4wdyskpct': '% Punteggio',
  };

  late Map sez2 = {
    'c402': 'Impatto funzionale delle discinesie',
  };

  late Map sez3 = {
    'c403': 'Tempo trascorso in fase OFF',
    'np4offnum': 'Numeratore (numero ore in stato OFF)',
    'np4offden': 'Denominatore (Numero ore sveglio)',
    'np4offpct': 'Camminare ed equilibrio',
  };

  late Map sez4 = {
    'c404': 'Impatto funzionale delle fluttuazioni motorie',
  };

  late Map sez5 = {
    'c405': 'Complessità delle fluttuazioni motorie',
  };

  late Map sez6 = {
    'c406': 'Distonia dolorosa in fase OFF',
    'np4dystnnum': 'Numeratore (numero ore in OFF)',
    'np4dystnden': 'Denominatore (Numero ore sveglio)',
    'np4dystnpct': '% Punteggio',
  };

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        drawer: const MyDrawer(title: 'Resettami Parkylon'),
        body: Stack(
          children: [
            Positioned(
                top: 55, //display after the height of top widtet
                bottom: 0, //display untill the height of bottom widget
                left:0, right:0,
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Wrap(
                      children: <Widget>[
                        Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: const BorderSide(
                                color: Color(0xff00A19B),
                              ),
                            ),
                            child: Column(
                              children: <Widget>[
                                subSezioniUpdrs(
                                    updrs: widget.updrs,
                                    valori: sez1,
                                    title: 'Sezione 4.1',
                                    exlude: exSez1),
                              ],
                            )),
                        Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: const BorderSide(
                                color: Color(0xff00A19B),
                              ),
                            ),
                            child: Column(
                              children: <Widget>[
                                subSezioniUpdrs(
                                    updrs: widget.updrs,
                                    valori: sez2,
                                    title: 'Sezione 4.2'),
                              ],
                            )),
                        Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: const BorderSide(
                                color: Color(0xff00A19B),
                              ),
                            ),
                            child: Column(
                              children: <Widget>[
                                subSezioniUpdrs(
                                    updrs: widget.updrs,
                                    valori: sez3,
                                    title: 'Sezione 4.3',
                                    exlude: exSez3),
                              ],
                            )),
                        Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: const BorderSide(
                                color: Color(0xff00A19B),
                              ),
                            ),
                            child: Column(
                              children: <Widget>[
                                subSezioniUpdrs(
                                    updrs: widget.updrs,
                                    valori: sez4,
                                    title: 'Sezione 4.4'),
                              ],
                            )),
                        Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: const BorderSide(
                                color: Color(0xff00A19B),
                              ),
                            ),
                            child: Column(
                              children: <Widget>[
                                subSezioniUpdrs(
                                    updrs: widget.updrs,
                                    valori: sez5,
                                    title: 'Sezione 4.5'),
                              ],
                            )),
                        Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: const BorderSide(
                                color: Color(0xff00A19B),
                              ),
                            ),
                            child: Column(
                              children: <Widget>[
                                subSezioniUpdrs(
                                    updrs: widget.updrs,
                                    valori: sez6,
                                    title: 'Sezione 4.6',
                                    exlude: exSez6),
                              ],
                            ))
                      ],
                    ))),
            Positioned( //position at top
                top: 0,
                left:0, right:0, //set left right to 0 for 100% width
                child:  Card(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: const Color(0xff00A19B),
                        border: Border.all(color: Colors.white),
                        borderRadius:
                        const BorderRadius.all(Radius.circular(5))),
                    child: Center(
                      child: Text(com.getTitle(widget.updrs, 4),
                          style: const TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
            ),
          ],
        ));
  }
}
