import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:resettami_app/Component/myDrawer.dart';
import 'package:resettami_app/Models/Updrs.dart';

class updrsParteQuartaScreen extends StatefulWidget {
  const updrsParteQuartaScreen({super.key, required this.updrs});

  final Updrs updrs;

  @override
  _updrsParteQuartaState createState() => _updrsParteQuartaState();
}

class _updrsParteQuartaState extends State<updrsParteQuartaScreen> {
  Map valori = {
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
        drawer: const MyDrawer(title: ""),
        body: Column(
          children: <Widget>[
            Card(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: const Color(0xff00A19B),
                    border: Border.all(color: Colors.white)),
                child: Center(
                  child: Text(getTitle(),
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
                    Card(
                      child: Container(
                          height: 40,
                          decoration: const BoxDecoration(
                            color: Color(0xff00A19B),
                            //border: Border.all(color: const Color(0xff00A19B)),
                            //borderRadius: const BorderRadius.all(Radius.circular(10))
                          ),
                          child: const Center(
                            child: Text("Sezione 1",
                                style: TextStyle(color: Colors.white)),
                          )),
                    ),
                    for (int i = 0; i < 3; i++) ...[
                      SizedBox(
                          height: 70,
                          width: double.infinity,
                          child: Center(
                            child: Card(
                              color:  i == 0 ? getColor(i, widget.updrs) : Colors.white,
                              shadowColor: Colors.blueGrey,
                              elevation: 10,
                              child: ListTile(
                                title: Text('${getValue(i, widget.updrs)} - ${getDescription(i, widget.updrs)}'),
                              ),
                            ),
                          ))
                    ]
                  ],
                ))
          ],
        ));
  }

  String getTitle() {
    String ret = "";
    if (widget.updrs.modelParte4!.isNotEmpty) {
      DateTime dt = DateTime.parse(widget.updrs.modelParte4![0].dataComp ?? "");
      ret = 'Data Comp.: ${DateFormat('dd-MM-yyyy').format(dt)}';
      ret += ' - Tot.: ${widget.updrs.modelParte4?[0].totale4}';

      return ret;
    }
    return "";
  }

  String getDescription(int index, Updrs updrs) {
    final keyVal = valori.keys.elementAt(index);
    final desc = valori.values.elementAt(index);
    final json = updrs.modelParte4!.map((v) => v.toJson()).toList();
    final ret = json[0].containsKey(keyVal);

    if (ret) {
      return desc;
    }
    return "";
  }

  Color getColor(int index, Updrs updrs) {
    final keyVal = valori.keys.elementAt(index);
    final json = updrs.modelParte4!.map((v) => v.toJson()).toList();
    final ret = json[0].containsKey(keyVal);

    if (ret) {
      var t = json[0][keyVal];
      switch (t) {
        case '0':
          return Colors.white;
        case '1':
          return Colors.green;
        case '2':
          return Colors.amber;
        case '3':
          return Colors.orange;
        case '4':
          return Colors.red;
        default:
          return Colors.white;
      }
    }
    return Colors.white;
  }

  Color getColorIcon(int index, Updrs updrs) {
    final keyVal = valori.keys.elementAt(index);
    final json = updrs.modelParte4!.map((v) => v.toJson()).toList();
    final ret = json[0].containsKey(keyVal);

    if (ret) {
      var t = json[0][keyVal];
      switch (t) {
        case '0':
          return Colors.black;
        default:
          return Colors.white;
      }
    }
    return Colors.black;
  }

  IconData getIcon(int index, Updrs updrs) {
    final keyVal = valori.keys.elementAt(index);
    final json = updrs.modelParte4!.map((v) => v.toJson()).toList();
    final ret = json[0].containsKey(keyVal);

    if (ret) {
      var t = json[0][keyVal];
      switch (t) {
        case '0':
          return Icons.looks;
        case '1':
          return Icons.looks_one_rounded;
        case '2':
          return Icons.looks_two_rounded;
        case '3':
          return Icons.looks_3_rounded;
        case '4':
          return Icons.looks_4_rounded;
        default:
          return Icons.looks_5_rounded;
      }
    }

    return Icons.exposure_zero;
  }

  String getValue(int index, Updrs updrs) {
    final keyVal = valori.keys.elementAt(index);
    final json = updrs.modelParte4!.map((v) => v.toJson()).toList();
    final ret = json[0].containsKey(keyVal);

    if (ret) {
      return json[0][keyVal];
    }
    return "";
  }


}

class sezione1 extends StatelessWidget {
  const sezione1({super.key, required this.updrs});

  final Updrs updrs;

  @override
  Widget build(BuildContext context) {
    var t = _updrsParteQuartaState();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          color: t.getColor(0, updrs),
          shadowColor: Colors.blueGrey,
          elevation: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                "Sezione 4.1",
              ),
              for (int i = 0; i < 3; i++)
                Expanded(
                  child: Wrap(
                      direction: Axis.vertical,
                      runSpacing: 50,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      spacing: 20,
                      children: <Widget>[
                        ListTile(
                          title: Text(t.getDescription(i, updrs)),
                          leading: Icon(
                            t.getIcon(i, updrs),
                            color: t.getColorIcon(i, updrs),
                          ),
                        ),
                      ]),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class sezione2 extends StatelessWidget {
  const sezione2({super.key, required this.updrs});

  final Updrs updrs;

  @override
  Widget build(BuildContext context) {
    var t = _updrsParteQuartaState();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            color: t.getColor(0, updrs),
            shadowColor: Colors.blueGrey,
            elevation: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  "Sezione 4.2",
                ),
                Expanded(
                  child: Wrap(
                      direction: Axis.vertical,
                      runSpacing: 50,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      spacing: 20,
                      children: <Widget>[
                        ListTile(
                          title: Text(t.getDescription(4, updrs)),
                          leading: Icon(
                            t.getIcon(4, updrs),
                            color: t.getColorIcon(4, updrs),
                          ),
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
