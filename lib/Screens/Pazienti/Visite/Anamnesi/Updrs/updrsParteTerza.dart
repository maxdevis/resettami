import 'package:flutter/material.dart';
import 'package:resettami_app/Models/Updrs.dart';
import 'package:resettami_app/Screens/Pazienti/Visite/Anamnesi/Updrs/Common.dart';
import 'package:resettami_app/Screens/Pazienti/Visite/Anamnesi/Updrs/sezioni/sezioneParteTerza.dart';

class updrsParteTerzaScreen extends StatefulWidget {
  const updrsParteTerzaScreen({super.key, required this.updrs});

  final Updrs updrs;

  @override
  _updrsParteTerzaState createState() => _updrsParteTerzaState();
}

class _updrsParteTerzaState extends State<updrsParteTerzaScreen> {
  late Common com = const Common();
  late sezioneParteTerza sezione = sezioneParteTerza();
  late final Updrs _updrs = widget.updrs;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: sezione.sezioni.length,
                itemBuilder: (BuildContext context, int iParent) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Card(
                        semanticContainer: true,
                        margin: const EdgeInsets.all(10),
                        color: Colors.white,
                        shadowColor: const Color(0xff00A19B),
                        elevation: 10,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                height: 40,
                                width: double.infinity,
                                color: const Color(0xff00A19B),
                                child: Center(
                                  child: Text(
                                      sezione.sezioni.values
                                          .elementAt(iParent),
                                      style: const TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      )),
                                )),
                            ListView.builder(
                                itemCount: sezione.getData(iParent).length,
                                physics: const ClampingScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder:
                                    (BuildContext context, int iChild) {
                                  final data = sezione.getData(iParent);
                                  return Card(
                                      margin: const EdgeInsets.all(5),
                                      color: com.getColor(iChild, _updrs, data),
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
                                                iChild, _updrs, data),
                                              style: TextStyle(
                                                  fontSize: 13.0,
                                                  color: com.getTextColor(
                                                      iChild,
                                                      _updrs,
                                                      data,
                                                      sezione.exSezMain)
                                              )
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Text(
                                              com.getValue(iChild, _updrs,
                                                  data, sezione.exSezMain),
                                              style: TextStyle(
                                                fontSize: 14.0,
                                                color: com.getTextColor(
                                                    iChild,
                                                    _updrs,
                                                    data,
                                                    sezione.exSezMain),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          )
                                        ],
                                      ));
                                }),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }

/*Future<dynamic> _getData(bool value) async {
    dynamic ret;
     String c213b = value ? 'On' : 'Off';
     ret = await com.getDataUpdrs(_updrs.model![0].pazienteId, _updrs.model![0].dataComp, c213b);
     if(ret != null){
      _updrs = ret;
      setState(() {});
    }
    else{
      showMyDialog('Errore caricamento dati');
    }
  }*/
}
