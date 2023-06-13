import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:resettami_app/Component/myAppBar.dart';
import 'package:resettami_app/Component/myDrawer.dart';
import 'package:resettami_app/Models/Paziente.dart';
import 'package:resettami_app/Screens/Pazienti/searchList.dart';
import 'package:resettami_app/Services/Pazienti.dart';
import 'package:resettami_app/utils/Uty.dart';

class SearchAssScreen extends StatefulWidget {
  const SearchAssScreen({super.key});

  @override
  State<SearchAssScreen> createState() => _SearchScreen();
}

class _SearchScreen extends State<SearchAssScreen> {
  static const Color primaryColor = Color(0xFF13B5A2);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _codfController = TextEditingController(text: "");
  final TextEditingController _nomeController = TextEditingController(text: "");
  final TextEditingController _cognomeController =
      TextEditingController(text: "");
  final TextEditingController _codiceController =
      TextEditingController(text: "");

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _codfController.dispose();
    _cognomeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const MyAppBar(
        title: 'Resettami Parkylon',
        route: '/home',
      ),
      drawer: const MyDrawer(title: 'Resettami Parkylon'),
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          padding:
              const EdgeInsets.only(top: 0, left: 20, bottom: 5, right: 20),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * .03,
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Codice Paziente",
                        labelStyle: const TextStyle(color: primaryColor),
                        focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(0),
                          borderSide:
                              const BorderSide(color: primaryColor, width: 2),
                        ),
                      ),
                      controller: _codiceController,
                      onChanged: (value) {
                        _codiceController.value = TextEditingValue(
                            text: value,
                            selection: _codiceController.selection);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Required field';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ], // Only numbers can be entered
                    ),
                    /*SizedBox(
                      height: size.height * .03,
                    ),*/
                    Visibility(
                      visible: false,
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Codice Fiscale",
                          labelStyle: const TextStyle(color: primaryColor),
                          focusedBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                            borderSide:
                                const BorderSide(color: primaryColor, width: 2),
                          ),
                        ),
                        controller: _codfController,
                        onChanged: (value) {
                          _codfController.value = TextEditingValue(
                              text: value.toUpperCase(),
                              selection: _codfController.selection);
                        },
                        /*validator: (value) {
                          if (value!.isEmpty) {
                            return 'Required field';
                          }
                          return null;
                        },*/
                        textInputAction: TextInputAction.next,
                        textCapitalization: TextCapitalization.sentences,
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    /*SizedBox(
                      height: size.height * .03,
                    ),*/
                    Visibility(
                      visible: false,
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Nome",
                          labelStyle: const TextStyle(color: primaryColor),
                          focusedBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                            borderSide:
                                const BorderSide(color: primaryColor, width: 2),
                          ),
                        ),
                        controller: _nomeController,
                        onChanged: (value) {
                          _nomeController.value = TextEditingValue(
                              text: value.toUpperCase(),
                              selection: _nomeController.selection);
                        },
                        /*validator: (value) {
                        if (value!.isEmpty) {
                          return 'Required field';
                        }
                        return null;
                      },*/
                        textInputAction: TextInputAction.next,
                        textCapitalization: TextCapitalization.none,
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    /*SizedBox(
                      height: size.height * .03,
                    ),*/
                    Visibility(
                      visible: false,
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Cognome",
                          labelStyle: const TextStyle(color: primaryColor),
                          focusedBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                            borderSide:
                                const BorderSide(color: primaryColor, width: 2),
                          ),
                        ),
                        controller: _cognomeController,
                        onChanged: (value) {
                          _cognomeController.value = TextEditingValue(
                              text: value.toUpperCase(),
                              selection: _cognomeController.selection);
                        },
                        /*validator: (value) {
                        if (value!.isEmpty) {
                          return 'Required field';
                        }
                        return null;
                      },*/
                        textInputAction: TextInputAction.next,
                        textCapitalization: TextCapitalization.none,
                        keyboardType: TextInputType.text,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * .045,
              ),
              SizedBox(
                width: size.width,
                height: size.height * .065,
                child: ElevatedButton(
                  onPressed: () async {
                    Paziente? res = await _search(context);
                    if (res != null) {
                      if (context.mounted) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                searchListScreen(paziente: res),
                          ),
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      textStyle: const TextStyle(fontSize: 18)),
                  child: const Text("Ricerca"),
                ),
              ),
              SizedBox(
                height: size.height * .015,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _search(BuildContext context) async {
    if (_formKey.currentState?.validate() ?? false) {
      waitDialog();
      PazientiService api = PazientiService();
      var res = await api.search(_codiceController.text,
          _codfController.text, _cognomeController.text, _nomeController.text);
      SmartDialog.dismiss();
      if(res == null){
        showMyDialog('Errore caricamento dati');
      }

      return res;
    }
    return null;
  }
}
