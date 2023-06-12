import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:resettami_app/Component/myDrawer.dart';
import 'package:resettami_app/Models/Updrs.dart';
import 'package:resettami_app/Screens/Pazienti/Visite/Anamnesi/Updrs/Common.dart';

class updrsPartePrimaScreen extends StatefulWidget {
  const updrsPartePrimaScreen({super.key, required this.updrs});

  final Updrs updrs;

  @override
  _updrsPartePrimaState createState() => _updrsPartePrimaState();
}

class _updrsPartePrimaState extends State<updrsPartePrimaScreen> {
  late Common com = const Common();

  late Map valori = {
    'c101': 'Compromissione cognitiva',
    'c102': 'Allucinazioni e psicosi',
    'c103': 'Umore depresso',
    'c104': 'Umore ansioso',
    'c105': 'Apatia',
    'c106': 'Caratteristiche della sindrome DDS',
    'c107': 'Disturbi del sonno',
    'c108': 'Sonnolenza diurna',
    'c109': 'Dolore e altre sensazioni',
    'c110': 'Problemi urinari',
    'c111': 'Problemi di costipazione',
    'c112': 'Sensazione di mancamento nell\'assumere la posizione eretta',
    'c113': 'Affaticabilità',
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
        //set drawer from app_drawer.dart
        //set like this where ever you want
        body: Column(
          children: <Widget>[
            Card(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: const Color(0xff00A19B),
                    border: Border.all(color: Colors.white),
                    borderRadius: const BorderRadius.all(Radius.circular(5))),
                child: Center(
                  child: Text(
                    com.getTitle(widget.updrs, 1),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: valori.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: Card(
                        margin: const EdgeInsets.all(5),
                        color: com.getColor(index, widget.updrs, valori),
                        shadowColor: const Color(0xff00A19B),
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: com.getColor(index, widget.updrs, valori),
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8, 8, 8, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      com.getDescription(
                                          index, widget.updrs, valori),
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          color: com.getTextColor(
                                              index, widget.updrs, valori),
                                          fontWeight: FontWeight.w200,
                                          fontFamily: "Roboto"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8, 8, 8, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                      child: Flexible(
                                          child: Text(
                                    com.getValue(
                                        index, widget.updrs, valori),
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color: com.getTextColor(
                                            index, widget.updrs, valori),
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Roboto"),
                                  ))),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ));
                },
              ),
            ),
          ],
        ));
  }
}
