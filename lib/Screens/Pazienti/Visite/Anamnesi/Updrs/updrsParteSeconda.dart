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
                    com.getTitle(widget.updrs),
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                  height: 30,
                                  width: 30,
                                  margin:
                                  const EdgeInsets.only(top: 10, left: 5),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        width: 2,
                                        color: Colors.black,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5))),
                                  child: Center(
                                      heightFactor: 3.5,
                                      child: Text(
                                          com.getValue(
                                              index, widget.updrs, valori),
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold)))),
                            ),
                            Expanded(
                              flex: 9,
                              child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: com.getColor(
                                          index, widget.updrs, valori),
                                      border: Border.all(
                                        width: 2,
                                        color: com.getColor(
                                            index, widget.updrs, valori),
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5))),
                                  child: Center(
                                      child: Text(com.getDescription(
                                          index, widget.updrs, valori)))),
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
