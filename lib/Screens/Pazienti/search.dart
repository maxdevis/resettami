import 'package:flutter/material.dart';
import 'package:resettami_app/Component/myAppBar.dart';
import 'package:resettami_app/Component/myDrawer.dart';
import 'package:resettami_app/Models/Assistito.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:localization/localization.dart';
import 'package:resettami_app/Screens/assistiti/searchList.dart';
import 'package:resettami_app/Services/Assistiti.dart';
import 'package:resettami_app/Library/SecureStorage.dart';

class SearchAssScreen extends StatefulWidget {
  const SearchAssScreen({super.key});

  @override
  State<SearchAssScreen> createState() => _SearchScreen();
}

class _SearchScreen extends State<SearchAssScreen> {
  static const Color primaryColor = Color(0xFF13B5A2);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final SecureStorage _sessionStorage = SecureStorage();
  final TextEditingController _codfController = TextEditingController(text: "");
  final TextEditingController _nomeController = TextEditingController(text: "");
  final TextEditingController _cognomeController = TextEditingController(text: "");
  String _dropdownValue = "";

  _onForgotPassword() {}

  _onSignUp() {}

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
      drawer: MyDrawer(title: 'Resettami Parkylon'),
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
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: "Tipo Ricerca",
                        labelStyle: const TextStyle(color: primaryColor),
                        focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(0),
                          borderSide:
                              const BorderSide(color: primaryColor, width: 2),
                        ),
                      ),
                      items: <String>['Codice Fiscale', 'Cognome/Nome']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(fontSize: 15),
                          ),
                        );
                      }).toList(),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Required field';
                        }
                        return null;
                      },
                      onChanged: (String? newValue) {
                        setState(() {
                          _dropdownValue = newValue!;
                        });
                      },
                    ),
                    SizedBox(
                      height: size.height * .03,
                    ),
                    TextFormField(
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Required field';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.sentences,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: size.height * .03,
                    ),
                    TextFormField(
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
                    SizedBox(
                      height: size.height * .03,
                    ),
                    TextFormField(
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
                    Assistito? res = await _search(context);
                    if (res != null) {
                      if (context.mounted) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => searchListScreen(assistito: res),
                          ),
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      textStyle: const TextStyle(fontSize: 18)
                  ),
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

  Future<Assistito?> _search(BuildContext context) async {
    if (_formKey.currentState?.validate() ?? false) {
      EasyLoading.show(status: 'wait'.i18n());
      AssistitiService api = AssistitiService();
      Assistito res = await api.searchAss(_codfController.text, _cognomeController.text, _nomeController.text);
      EasyLoading.dismiss();

      return res;
    }
    return null;
  }
}