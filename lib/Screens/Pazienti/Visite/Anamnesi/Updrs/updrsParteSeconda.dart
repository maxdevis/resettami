import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:resettami_app/Component/myDrawer.dart';
import 'package:resettami_app/Models/Updrs.dart';
import 'package:resettami_app/Screens/Pazienti/Visite/Anamnesi/Updrs/Common.dart';

class updrsParteSecondaScreen extends StatefulWidget {
  const updrsParteSecondaScreen({super.key, required this.updrs});

  final Updrs updrs;

  @override
  _updrsParteSecondaState createState() => _updrsParteSecondaState();
}

class _updrsParteSecondaState extends State<updrsParteSecondaScreen> {
  late Common com = const Common();
  late final Updrs _updrs = widget.updrs;

  late Map valori = {
    'c201': 'Eloquio',
    'c202': 'Salivazione e perdita di saliva',
    'c203': 'Masticazione e deglutizione',
    'c204': 'Attività correlate al mangiare',
    'c205': 'Vestirsi',
    'c206': 'Igiene personale',
    'c207': 'Scrittura',
    'c208': 'Passatempi e altre attività',
    'c209': 'Girarsi nel letto',
    'c210': 'Tremore',
    'c211': 'Uscire dal letto, dall\'auto, da una poltrona',
    'c212': 'Camminare ed equilibrio',
    'c213': 'Blocco motorio (Freezing)',
  };

  @override
  void initState() {
    super.initState();
  }

  @override
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
                    com.getTitle(widget.updrs, 2),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: valori.length,
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder:
                      (BuildContext context, int index) {
                    var data = valori;
                    return Card(
                        margin: const EdgeInsets.all(5),
                        color: com.getColor(index, _updrs, data),
                        shadowColor: Colors.grey,
                        elevation: 5,
                        child: Column(
                          mainAxisAlignment:
                          MainAxisAlignment.start,
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(com.getDescription(
                                  index, _updrs, data),
                                  style: TextStyle(
                                      fontSize: 13.0,
                                      color: com.getTextColor(
                                          index,
                                          _updrs,
                                          data)
                                  )
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                com.getValue(index, _updrs,
                                    data),
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: com.getTextColor(
                                      index,
                                      _updrs,
                                      data),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ));
                  }),
            ),
          ],
        ));
  }

}
