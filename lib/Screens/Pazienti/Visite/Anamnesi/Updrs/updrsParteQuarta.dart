import 'package:flutter/material.dart';
import 'package:resettami_app/Component/myDrawer.dart';
import 'package:resettami_app/Models/Updrs.dart';
import 'package:resettami_app/Screens/Pazienti/Visite/Anamnesi/Updrs/Common.dart';
import 'package:resettami_app/Screens/Pazienti/Visite/Anamnesi/Updrs/Partials/sezione1.dart';
import 'package:resettami_app/Screens/Pazienti/Visite/Anamnesi/Updrs/Partials/sezione2.dart';

class updrsParteQuartaScreen extends StatefulWidget {
  const updrsParteQuartaScreen({super.key, required this.updrs});
  final Updrs updrs;

  @override
  _updrsParteQuartaState createState() => _updrsParteQuartaState();
}

class _updrsParteQuartaState extends State<updrsParteQuartaScreen> {

  late Common com = const Common();

  late Map valori = {
    'c401': 'Tempo trascorso con discinesie',
    'np4wdysknum': 'Numeratore (Numero ore discinesia)',
    'np4offden': 'Denominatore (Numero ore sveglio)',
    'np4wdyskpct': '% Punteggio',
    'c402': 'Impatto funzionale delle discinesie',
    'c403': 'Tempo trascorso in fase OFF',
    'c404': 'Impatto funzionale delle fluttuazioni motorie',
    'c405': 'Complessità delle fluttuazioni motorie',
    'c406': 'Distonia dolorosa in fase OFF',
    'np4wdyskden': 'Denominatore (Numero ore sveglio)',
    'np4offnum': 'Numeratore (numero ore in stato OFF)',
    'np4offpct': 'Camminare ed equilibrio',
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
        body: Column(
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
                    sezione1(updrs: widget.updrs, valori: valori),
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
                    sezione2(updrs: widget.updrs, valori: valori),
                  ],
                ))
          ],
        ));
  }


}
