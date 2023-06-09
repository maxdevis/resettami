import 'package:flutter/material.dart';
import 'package:resettami_app/Models/Updrs.dart';
import 'package:resettami_app/Screens/Pazienti/Visite/Anamnesi/Updrs/Common.dart';
import 'package:resettami_app/utils/Uty.dart';

class subSezioniUpdrs extends StatelessWidget {
  subSezioniUpdrs(
      {super.key,
      required this.updrs,
      required this.valori,
      required this.title, this.exlude});

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
              height: 60,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Visibility(
                        visible: (showText1(i)),
                        child:  Container(
                            height: 30,
                            width: 30,
                            margin:
                            const EdgeInsets.only(top: 5, left: 5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  width: 2,
                                  color: Colors.black,
                                ),
                                borderRadius:
                                const BorderRadius.all(Radius.circular(5))),
                            child: Center(
                                heightFactor: 3.5,
                                child: Text(com.getValue(i, updrs, valori),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontWeight: FontWeight.bold))))
                      ),
                    ),
                    Expanded(
                      flex: 9,
                      child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: com.getColor(i, updrs, valori, exlude),
                              border: Border.all(
                                width: 2,
                                color: com.getColor(i, updrs, valori, exlude),
                              ),
                              borderRadius:
                              const BorderRadius.all(Radius.circular(5))),
                          child: Center(
                              child: Text(getValPdmEddt(i)))),
                    ),
                  ],
                ),
              ))
        ]
      ],
    );
  }

  String getValPdmEddt(int i){
    final val = com.getValue(i, updrs, valori);
    final desc = com.getDescription(i, updrs, valori);

    if(valori.containsKey('pdmeddt') && val != ""){
      return '${getFormatData(val)} - $desc';
    }
    return desc;
  }

  bool showText1(int i){
    final val = com.getValue(i, updrs, valori);
    return (val != "" && !valori.containsKey('pdmeddt'));
  }


}
