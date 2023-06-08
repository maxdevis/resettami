import 'package:flutter/material.dart';
import 'package:resettami_app/Component/myDrawer.dart';
import 'package:resettami_app/Models/Updrs.dart';
import 'package:resettami_app/Screens/Pazienti/Visite/Anamnesi/Updrs/Common.dart';
import 'package:resettami_app/Screens/Pazienti/Visite/Anamnesi/Updrs/Partials/subSezioniUpdrs.dart';

class updrsParteTerzaScreen extends StatefulWidget {
  const updrsParteTerzaScreen({super.key, required this.updrs});

  final Updrs updrs;

  @override
  _updrsParteTerzaState createState() => _updrsParteTerzaState();
}

class _updrsParteTerzaState extends State<updrsParteTerzaScreen> {
  late Common com = const Common();
  late List<String> exSezMain = [
    'c1a',
    'scala_hoen_yahr_id',
    'c213a',
    'c213b',
    'c213c',
    'c213c1',
    'c318a',
    'c318b',
    'pdmeddt',
    'dbs_status',
    'dbsontm',
    'dbsofftm',
    'hrdbson',
    'hrdbsoff'
  ];
  late Map sezMain = {
    'c1a': 'Fonte primaria d\'informazione',
    'scala_hoen_yahr_id': 'Stadio Hoehn & Yahr',
    'c213a': '3A Il paziente è in terapia?',
    'c213b': '3B Stato clinico del paziente',
    'c213c': '3C Il paziente è in Levodopa',
    'c213c1':
        '3D Se è così, indicare i minuti trascorsi dall\'ultima somministrazione',
    'c318a': '3E La discinesia è presente',
    'c318b': '3F I movimenti hanno interferito con la valutazione?',
    'pdmeddt': 'Data ultima somm.zione farmaco PD',
    'dbs_status': 'Stato DBS',
    'dbsontm': 'Ora di accensione DBS prima dell\'esame',
    'dbsofftm': 'Ora di spegnimento DBS prima dell\'esame',
    'hrdbson': 'Tempo tra accensione DBS ed esame',
    'hrdbsoff': 'Tempo tra spegnimento DBS ed esame',
  };

  late Map sezEloquio = {
    'c301': '3.1 Eloquio',
    'c302': '3.2 Mimica facciale',
  };

  late Map sezRegidita = {
    'c303a': '3.3A Rigidità del collo',
    'c303b': '3.3B Rigidità del braccio destro',
    'c303c': '3.3C Rigidità del braccio sinistro',
    'c303d': '3.3D Rigidità della gamba destra',
    'c303e': '3.3E Rigidità della gamba sinistra',
  };

  late Map sezMovRipMano = {
    'c304a': '3.4A Movimenti ripetuti dita mano destra',
    'c304b': '3.4B Movimenti ripetuti dita mano sinistra',
  };

  late Map sezMovMano = {
    'c305a': '3.5A Movimenti della mano destra',
    'c305b': '3.5B Movimenti della mano sinistra',
  };

  late Map sezPronoSup = {
    'c306a': '3.6A Movimenti prono-supinazione mano destra',
    'c306b': '3.6B Movimenti prono-supinazione mano sinistra',
  };

  late Map sezMovRipPiede = {
    'c307a': '3.7A Movimenti ripetuti dita piede destro',
    'c307b': '3.7B Movimenti ripetuti dita piede sinistro',
  };

  late Map sezAgGamba = {
    'c308a': '3.8A Agilità gamba destra',
    'c308b': '3.8B Agilità gamba sinistra',
  };

  late Map sezAltro = {
    'c309': '3.9 Alzarsi dalla sedia',
    'c310': '3.10 Marcia',
    'c311': '3.11 Blocco della marcia',
    'c312': '3.12 Stabilità posturale',
    'c313': '3.13 Postura',
    'c314': '3.14 Spontaneità dei movimenti ( bradicinesia )',
  };

  late Map sezTremPostMani = {
    'c315a': '3.15A Tremore posturale - mano destra',
    'c315b': '3.15B Tremore posturale - mano sinistra',
  };

  late Map sezTremCineticoMani = {
    'c316a': '3.16A Tremore cinetico - mano destra',
    'c316b': '3.16B Tremore cinetico - mano sinistra',
  };

  late Map sezAmpTremRip = {
    'c317a': '3.17A Ampiezza del tremore a riposo - braccio destro',
    'c317b': '3.17B Ampiezza del tremore a riposo - braccio sinistro',
    'c317c': '3.17C Ampiezza del tremore a riposo - gamba destra',
    'c317d': '3.17D Ampiezza del tremore a riposo - gamba sinistra',
    'c317e': '3.17E Ampiezza del tremore a riposo - labbra/mandibola',
  };

  late Map sezContTremRip = {
    'c318': '3.18 Continuità del tremore a riposo',
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
                top: 55,
                //display after the height of top widtet
                bottom: 0,
                //display untill the height of bottom widget
                left: 0,
                right: 0,
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
                                    valori: sezMain,
                                    title: 'Info Principali',
                                    exlude: exSezMain),
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
                                    valori: sezEloquio,
                                    title: 'Eloquio/Mimica facciale'),
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
                                    valori: sezRegidita,
                                    title: 'Rigidità'),
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
                                    valori: sezMovRipMano,
                                    title: '3.4 Movimenti ripetuti dita mano'),
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
                                    valori: sezMovMano,
                                    title: '3.5 Movimenti della mano'),
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
                                    valori: sezPronoSup,
                                    title: '3.6 Movimenti prono-supinazione'),
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
                                    valori: sezMovRipPiede,
                                    title: '3.7 Movimenti ripetuti dita piede'),
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
                                    valori: sezAgGamba,
                                    title: '3.8 Agilità gamba'),
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
                                    valori: sezAltro,
                                    title: 'Altro'),
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
                                    valori: sezTremPostMani,
                                    title: '3.15 Tremore posturale delle mani'),
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
                                    valori: sezTremCineticoMani,
                                    title: '3.16 Tremore cinetico delle mani'),
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
                                    valori: sezAmpTremRip,
                                    title: '3.17 Ampiezza del tremore a riposo'),
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
                                    valori: sezContTremRip,
                                    title: '3.18 Continuità del tremore a riposo'),
                              ],
                            ))
                      ],
                    ))),
            Positioned(
              //position at top
              top: 0,
              left: 0, right: 0, //set left right to 0 for 100% width
              child: Card(
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: const Color(0xff00A19B),
                      border: Border.all(color: Colors.white),
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                  child: Center(
                    child: Text(com.getTitle(widget.updrs),
                        style: const TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
