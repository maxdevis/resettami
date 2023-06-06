import 'package:flutter/material.dart';
import 'package:resettami_app/Component/myDrawer.dart';
import 'package:resettami_app/Models/Updrs.dart';
import 'package:resettami_app/Screens/Pazienti/Visite/Anamnesi/Updrs/Common.dart';
import 'package:resettami_app/Screens/Pazienti/Visite/Anamnesi/Updrs/Partials/sezioniParteQuarta.dart';

class updrsParteQuartaScreen extends StatefulWidget {
  const updrsParteQuartaScreen({super.key, required this.updrs});
  final Updrs updrs;

  @override
  _updrsParteQuartaState createState() => _updrsParteQuartaState();
}

class _updrsParteQuartaState extends State<updrsParteQuartaScreen> {

  late Common com = const Common();

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
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Wrap(
            children: <Widget>[
              Card(
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: const Color(0xff00A19B),
                      border: Border.all(color: Colors.white)),
                  child: Center(
                    child: Text(com.getTitle(widget.updrs),
                        style: const TextStyle(color: Colors.white)),
                  ),
                ),
              ),
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
                      sezioniParteQuarta(updrs: widget.updrs, valori: sez1, title: 'Sezione 4.1'),
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
                      sezioniParteQuarta(updrs: widget.updrs, valori: sez2, title: 'Sezione 4.2'),
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
                      sezioniParteQuarta(updrs: widget.updrs, valori: sez3, title: 'Sezione 4.3'),
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
                      sezioniParteQuarta(updrs: widget.updrs, valori: sez4, title: 'Sezione 4.4'),
                    ],
                  ))
            ],
          )
        )
    );
  }


}
