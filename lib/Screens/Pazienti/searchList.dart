import 'package:flutter/material.dart';
import 'package:resettami_app/Component/myAppBar.dart';
import 'package:resettami_app/Component/myDrawer.dart';
import 'package:resettami_app/Models/Paziente.dart';
import 'package:resettami_app/Screens/Pazienti/SchedaPaziente.dart';
import 'package:resettami_app/Screens/Pazienti/Visite/InfoGenerali/anamnesi.dart';

class searchListScreen extends StatelessWidget {
  const searchListScreen({super.key, required this.assistito});

  final Paziente assistito;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      drawer: const MyDrawer(title: 'Resettami Parkylon'),
      appBar: const MyAppBar(
        title: 'Resettami Parkylon',
        route: '/searchAss',
      ),
      body: ListView.builder(
        itemCount: assistito.model?.length,
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
                              '${assistito.model?[index].cognome} ${assistito.model?[index].nome}',
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              overflow: TextOverflow.clip,
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                fontSize: 16,
                                color: Color(0xff000000),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 4, 0, 0),
                              child: Text(
                                '${assistito.model?[index].codiceFiscale}',
                                textAlign: TextAlign.start,
                                maxLines: 1,
                                overflow: TextOverflow.clip,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12,
                                  color: Color(0xff7a7a7a),
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
                        icon: const Icon(Icons.supervised_user_circle),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SchedaPaziente(name: '${assistito.model?[index].cognome} ${assistito.model?[index].nome}',
                                  codiceFiscale: '${assistito.model?[index].codiceFiscale}'),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 8, 8, 8),
                      child: IconButton(
                        color: Colors.white,
                        icon: const Icon(Icons.table_view),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const anamnesiScreen(),
                            ),
                          );
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
