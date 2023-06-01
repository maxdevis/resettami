import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:localization/localization.dart';
import 'package:resettami_app/Component/myAppBar.dart';
import 'package:resettami_app/Component/myDrawer.dart';
import 'package:resettami_app/Models/Paziente.dart';
import 'package:resettami_app/Models/Visite.dart';
import 'package:resettami_app/Screens/Pazienti/SchedaPaziente.dart';
import 'package:resettami_app/Screens/Pazienti/Visite/InfoGenerali/anamnesi.dart';
import 'package:resettami_app/Screens/Pazienti/Visite/lista.dart';
import 'package:resettami_app/Services/Visite.dart';
import 'package:resettami_app/utils/Uty.dart';

class searchListScreen extends StatelessWidget {
  const searchListScreen({super.key, required this.paziente});

  final Paziente paziente;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      drawer: const MyDrawer(title: 'Resettami Parkylon'),
      appBar: const MyAppBar(
        title: 'Ricerca Paziente',
        route: '/searchAss',
      ),
      body: ListView.builder(
        itemCount: paziente.model?.length,
        itemBuilder: (context, index) {
          return SizedBox(
              height: 80,
              width: double.infinity,
              child: Card(
                margin: const EdgeInsets.all(5),
                color: const Color(0xff00A19B),
                shadowColor: Colors.white,
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Codice: ${paziente.model?[index].id}',
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              overflow: TextOverflow.clip,
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                fontSize: 16,
                                color: Color(0xffffffff),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 10, 0, 0),
                              child: Text(
                                '${paziente.model?[index].cognome} ${paziente.model?[index].nome}',
                                textAlign: TextAlign.start,
                                maxLines: 1,
                                overflow: TextOverflow.clip,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12,
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
                      child: IconButton(
                        color: Colors.white,
                        icon: const Icon(Icons.supervised_user_circle),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SchedaPaziente(name: '${paziente.model?[index].cognome} ${paziente.model?[index].nome}',
                                  codiceFiscale: '${paziente.model?[index].codiceFiscale}'),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
                      child: IconButton(
                        color: Colors.white,
                        icon: const Icon(Icons.table_view),
                        onPressed: () async {
                          List<Visite>? ret = await _getVisite(paziente.model![index].id);
                          if(ret != null && context.mounted){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => listaVisiteScreen(visite: ret,),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ));
        },
      ),
    );
  }

  Future<List<Visite>?> _getVisite(String id) async {
    EasyLoading.show(status: 'wait'.i18n());
    VisiteService api = VisiteService();
    var res = await api.getVisite(id);
    EasyLoading.dismiss();
    if(res == null){
      showMyDialog('Errore caricamento dati');
    }

    return res;
  }

}
