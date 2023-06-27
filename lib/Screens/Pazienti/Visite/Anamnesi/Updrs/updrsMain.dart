import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:resettami_app/Component/myAppBar.dart';
import 'package:resettami_app/Component/myDrawer.dart';
import 'package:resettami_app/Models/Updrs.dart';
import 'package:resettami_app/Screens/Pazienti/Visite/Anamnesi/Updrs/updrsPartePrima.dart';
import 'package:resettami_app/Screens/Pazienti/Visite/Anamnesi/Updrs/updrsParteQuarta.dart';
import 'package:resettami_app/Screens/Pazienti/Visite/Anamnesi/Updrs/updrsParteSeconda.dart';
import 'package:resettami_app/Screens/Pazienti/Visite/Anamnesi/Updrs/updrsParteTerza.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class updrsMainScreen extends StatefulWidget {
  const updrsMainScreen({super.key, required this.updrs});

  final Updrs updrs;

  @override
  State<updrsMainScreen> createState() => _updrsMainState();
}

class _updrsMainState extends State<updrsMainScreen> {
  late final Updrs _updrs;
  final SpeechToText _speech = SpeechToText();
  int _selectedIndex = 0;
  bool _speechEnabled = false;
  String _lastWords = '';
  
  @override
  void initState() {
    super.initState();
    _updrs = widget.updrs;
    _initSpeech();
  }

  @override
  void dispose() {
    _stopListening();
    super.dispose();
  }

  /*static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);*/
  late final List<Widget> _widgetOptions = <Widget>[
    //updrsPartePrimaScreen(updrs: _updrs),
    //updrsParteSecondaScreen(updrs: _updrs),
    //updrsParteTerzaScreen(updrs: _updrs),
    //updrsParteQuartaScreen(updrs: _updrs),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const MyAppBar(
          title: 'Resettami Parkylon',
          route: '*',
        ),
        drawer: const MyDrawer(title: 'Resettami Parkylon'),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            // sets the background color of the `BottomNavigationBar`
            canvasColor: const Color(0xFF00A19B),
            // sets the active color of the `BottomNavigationBar` if `Brightness` is light
            primaryColor: Colors.white,
          ),
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.looks_one),
                label: 'Parte I',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.looks_two),
                label: 'Parte II',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.looks_3),
                label: 'Parte III',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.looks_4_sharp),
                label: 'Parte IV',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ));
  }


  Future<void> _onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index;
    });

  }

  void _activateSection(){
    if (_selectedIndex != 0 &&
        (_lastWords.contains("parte 1") ||
            _lastWords.contains("parte uno")
            || _lastWords.contains("parte prima"))) {
      _onItemTapped(0);
    }
    if (_selectedIndex != 1 &&
        (_lastWords.contains("parte 2") ||
            _lastWords.contains("parte due")
            || _lastWords.contains("parte seconda"))) {
      _onItemTapped(1);
    }
    if (_selectedIndex != 2 &&
        (_lastWords.contains("parte 3") ||
            _lastWords.contains("parte tre")
            || _lastWords.contains("parte terza"))) {
      _onItemTapped(2);
    }
    if (_selectedIndex != 3 &&
        (_lastWords.contains("parte 4") ||
            _lastWords.contains("parte quattro")
            || _lastWords.contains("parte quarta"))) {
      _onItemTapped(3);
    }
  }


  //sezione speech
  void _initSpeech() async {
    _speechEnabled = await _speech.initialize();
    if (_speechEnabled) {
      _startListening();
    }
    setState(() {});
  }

  /// Each time to start a speech recognition session
  void _startListening() async {
    await _speech.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  void _stopListening() async {
    await _speech.stop();
    setState(() {});
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
    });
    _activateSection();
    _startListening();
  }

}
