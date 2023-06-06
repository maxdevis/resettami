import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:resettami_app/Component/myDrawer.dart';
import 'package:resettami_app/Models/Updrs.dart';

class updrsParteSecondaScreen extends StatefulWidget {
  const updrsParteSecondaScreen({super.key, required this.updrs});

  final Updrs updrs;

  @override
  _updrsParteSecondaState createState() => _updrsParteSecondaState();
}

class _updrsParteSecondaState extends State<updrsParteSecondaScreen> {
  Map valori = {
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
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        drawer: MyDrawer(title: getTitle()),
        //set drawer from app_drawer.dart
        //set like this where ever you want
        body: Column(
          children: <Widget>[
            Card(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: const Color(0xff00A19B),
                    border: Border.all(color: Colors.white)
                ),
                child: Center(
                  child: Text(getTitle()),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: valori.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 80,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Card(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            color: getColor(index),
                            shadowColor: Colors.blueGrey,
                            elevation: 10,
                            child: ListTile(
                              leading: Icon(
                                getIcon(index),
                                color: getColorIcon(index),
                              ),
                              title: Text(getDescription(index)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }

  String getTitle() {
    String ret = "";
    if (widget.updrs.modelParte2!.isNotEmpty) {
      DateTime dt = DateTime.parse(widget.updrs.modelParte2![0].dataComp ?? "");
      ret = 'Data Comp.: ${DateFormat('dd-MM-yyyy').format(dt)}';
      ret += ' - Tot.: ${widget.updrs.modelParte2?[0].totale2}';

      return ret;
    }
    return "";
  }

  String getDescription(int index) {
    final keyVal = valori.keys.elementAt(index);
    final desc = valori.values.elementAt(index);
    final json = widget.updrs.modelParte2!.map((v) => v.toJson()).toList();
    final ret = json[0].containsKey(keyVal);

    if (ret) {
      return desc;
    }
    return "";
  }

  Color getColor(int index) {
    final keyVal = valori.keys.elementAt(index);
    final json = widget.updrs.modelParte2!.map((v) => v.toJson()).toList();
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

  Color getColorIcon(int index) {
    final keyVal = valori.keys.elementAt(index);
    final json = widget.updrs.modelParte2!.map((v) => v.toJson()).toList();
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

  IconData getIcon(int index) {
    final keyVal = valori.keys.elementAt(index);
    final json = widget.updrs.modelParte2!.map((v) => v.toJson()).toList();
    final ret = json[0].containsKey(keyVal);

    if (ret) {
      var t = json[0][keyVal];
      switch (t) {
        case '0':
          return Icons.exposure_zero;
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
}
