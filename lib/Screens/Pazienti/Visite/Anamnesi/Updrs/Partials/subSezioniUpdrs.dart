import 'package:flutter/material.dart';
import 'package:resettami_app/Models/Updrs.dart';
import 'package:resettami_app/Screens/Pazienti/Visite/Anamnesi/Updrs/Common.dart';
import 'package:resettami_app/utils/Uty.dart';

class subSezioniUpdrs extends StatelessWidget {
  subSezioniUpdrs(
      {super.key,
      required this.updrs,
      required this.valori,
      required this.title,
      this.exlude});

  final Updrs updrs;
  final Map valori;
  final String title;
  final List<String>? exlude;
  late Common com = const Common();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Card(
          child: Container(
              height: 40,
              decoration: const BoxDecoration(
                color: Color(0xff00A19B),
                //border: Border.all(color: const Color(0xff00A19B)),
                //borderRadius: const BorderRadius.all(Radius.circular(10))
              ),
              child: Center(
                child: Text(title, style: const TextStyle(color: Colors.white)),
              )),
        ),
        for (int i = 0; i < valori.length; i++) ...[
          SizedBox(
              height: 70,
              width: double.infinity,
              child: Card(
                margin: const EdgeInsets.all(5),
                color: com.getColor(i, updrs, valori, exlude),
                shadowColor: const Color(0xff00A19B),
                elevation: 10,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: com.getColor(i, updrs, valori, exlude),
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              com.getDescription(i, updrs, valori),
                              style: TextStyle(
                                  fontSize: 12.0,
                                  color: com.getTextColor(i, updrs, valori, exlude),
                                  fontWeight: FontWeight.w200,
                                  fontFamily: "Roboto"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                              child: Flexible(
                                  child: Text(
                            com.getGradiMalattia(i, updrs, valori, exlude),
                            style: TextStyle(
                                fontSize: 12.0,
                                color: com.getTextColor(i, updrs, valori, exlude),
                                fontWeight: FontWeight.bold,
                                fontFamily: "Roboto"),
                          ))),
                        ],
                      ),
                    ),
                  ],
                ),
              ))
        ]
      ],
    );
  }

  String getValCustom(int i, [List<String>? listExlude]) {
    final keyVal = valori.keys.elementAt(i);
    final val = com.getValue(i, updrs, valori);
    final desc = com.getDescription(i, updrs, valori);
    bool exlude = false;

    if (listExlude != null) {
      exlude = listExlude.contains(keyVal);
    }

    if (keyVal == 'pdmeddt' && val != "") {
      return '${getFormatData(val)} - $desc';
    }

    if (exlude && val != "") {
      return "$val - $desc";
    }

    return desc;
  }

  bool showText1(int i, [List<String>? listExlude]) {
    final val = com.getValue(i, updrs, valori);
    final keyVal = valori.keys.elementAt(i);
    bool exlude = false;

    if (listExlude != null) {
      exlude = listExlude.contains(keyVal);
    }

    return (!exlude && val != "");
  }
}
