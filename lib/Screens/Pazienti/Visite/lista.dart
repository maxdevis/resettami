import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:resettami_app/Component/myAppBar.dart';
import 'package:resettami_app/Component/myDrawer.dart';
import 'package:resettami_app/Models/Visite.dart';
import 'package:resettami_app/Screens/Pazienti/Visite/Anamnesi/Updrs/Common.dart';
import 'package:resettami_app/Screens/Pazienti/Visite/Anamnesi/Updrs/updrsMain.dart';
import 'package:resettami_app/Services/Updrs.dart';
import 'package:resettami_app/utils/Uty.dart';

class listaVisiteScreen extends StatelessWidget {
  const listaVisiteScreen({super.key, required this.visite});
  final Common com = const Common();
  final Visite visite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      drawer: const MyDrawer(title: 'Resettami Parkylon'),
      appBar: const MyAppBar(
        title: 'Resettami Parkylon', route: '*',
      ),
      body: ListView.builder(
        itemCount: visite.model?.length,
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
                              'ID Visita: ${visite.model?[index].id}',
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
                              padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                              child: Text(
                                'Data Visita: ${visite.model?[index].dataApertura}',
                                textAlign: TextAlign.start,
                                maxLines: 1,
                                overflow: TextOverflow.clip,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 8, 8, 8),
                      child: IconButton(
                        color: Colors.white,
                        icon: const Icon(Icons.medical_information),
                        onPressed: () async {
                          waitDialog();
                          var api = UpdrsService();
                          var ret = await api.getDatabyServizioId(visite.model![index].id);
                          SmartDialog.dismiss();
                          if (ret != null && context.mounted) {
                            SmartDialog.dismiss();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => updrsMainScreen(updrs: ret),
                                ));
                          }else{
                            showMyDialog('Errore caricamento dati');
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


}
