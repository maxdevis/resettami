import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:resettami_app/Component/myDrawer.dart';
import 'package:resettami_app/Models/Updrs.dart';

class updrsPartePrimaScreen extends StatefulWidget {
  const updrsPartePrimaScreen({super.key, required this.updrs});

  final Updrs updrs;

  @override
  _updrsPartePrimaState createState() => _updrsPartePrimaState();
}

class _updrsPartePrimaState extends State<updrsPartePrimaScreen> {
  Map valori = {
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
                color: Colors.white,
                height: 100,
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
                    height: 50,
                    width: double.infinity,
                    child: Row(
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
    if (widget.updrs.modelParte1!.isNotEmpty) {
      DateTime dt = DateTime.parse(widget.updrs.modelParte1![0].dataComp ?? "");
      ret = 'Data: ${DateFormat('dd-MM-yyyy').format(dt)}';
      ret += ' - Tot.: ${widget.updrs.modelParte1?[0].totale1}';

      return ret;
    }
    return "";
  }

  String getDescription(int index) {
    final keyVal = valori.keys.elementAt(index);
    final desc = valori.values.elementAt(index);
    final json = widget.updrs.modelParte1!.map((v) => v.toJson()).toList();
    final ret = json[0].containsKey(keyVal);

    if (ret) {
      return desc;
    }
    return "";
  }

  Color getColor(int index) {
    final keyVal = valori.keys.elementAt(index);
    final json = widget.updrs.modelParte1!.map((v) => v.toJson()).toList();
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
    final json = widget.updrs.modelParte1!.map((v) => v.toJson()).toList();
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
    final json = widget.updrs.modelParte1!.map((v) => v.toJson()).toList();
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
