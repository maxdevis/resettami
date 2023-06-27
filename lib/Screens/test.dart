import 'package:flutter/material.dart';
import 'package:resettami_app/Component/myAppBar.dart';
import 'package:resettami_app/Component/myDrawer.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';


class testScreen extends StatefulWidget {
  const testScreen({super.key});

  @override
  State<testScreen> createState() => _testMainState();
}

class _testMainState extends State<testScreen> {
  final SpeechToText _speechToText = SpeechToText();
  int _selectedIndex = 0;
  bool _speechEnabled = false;
  bool _speechAvailable = false;
  String _currentWords = '';
  final String _selectedLocaleId = 'it_IT';
  final List<String> _sez1 = [
    'parte 1',
    'parte uno',
    'parte prima',
    'prima',
    'uno',
  ];
  final List<String> _sez2 = [
    'parte 2',
    'parte due',
    'parte seconda',
    'seconda',
    'due',
  ];
  final List<String> _sez3 = [
    'parte 3',
    'parte tre',
    'parte terza',
    'terza',
    'tre',
    'ttre',
    'ttrre',
    'trre',
  ];
  final List<String> _sez4 = [
    'parte 4',
    'parte quattro',
    'parte quarta',
    'quarta',
    'quattro',
  ];

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Parte I',
      style: optionStyle,
    ),
    Text(
      'Index 1:  Parte II',
      style: optionStyle,
    ),
    Text(
      'Index 2:  Parte III',
      style: optionStyle,
    ),
    Text(
      'Index 3:  Parte IV',
      style: optionStyle,
    ),
  ];


  @override
  void initState() {
    super.initState();
    _initSpeech();

  }

  @override
  void dispose() {
    _stopListening();
    super.dispose();
  }

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

  Future _onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index;
    });

    await _stopListening();
    await Future.delayed(const Duration(milliseconds: 200));
    await _startListening();
  }

  void _activateSection(){
    if (_selectedIndex != 0 && containsAnyWord(_currentWords.toLowerCase(), _sez1)){
      _onItemTapped(0);
    }
    if (_selectedIndex != 1 && containsAnyWord(_currentWords.toLowerCase(), _sez2)){
      _onItemTapped(1);
    }
    if (_selectedIndex != 2 && containsAnyWord(_currentWords.toLowerCase(), _sez3)){
      _onItemTapped(2);
    }
    if (_selectedIndex != 3 && containsAnyWord(_currentWords.toLowerCase(), _sez4)){
      _onItemTapped(3);
    }
  }

  bool containsAnyWord(String input, List<String> words) {
    for (String word in words) {
      if (input.contains(word)) {
        return true;
      }
    }
    return false;
  }

  ///sezione SpeechToText

  void errorListener(SpeechRecognitionError error) {
    debugPrint(error.errorMsg.toString());
  }

  void statusListener(String status) async {
    debugPrint("status $status");
    if (status == "done" && _speechEnabled) {
      setState(() {
        _currentWords = "";
        _speechEnabled = false;
      });
      await _startListening();
    }
  }

  /// This has to happen only once per app
  void _initSpeech() async {
    _speechAvailable = await _speechToText.initialize(
        onError: errorListener,
        onStatus: statusListener
    );

    if(_speechAvailable) {
      await _startListening();
    }

    setState(() {});
  }

  /// Each time to start a speech recognition session
  Future _startListening() async {
    debugPrint("=================================================");
    try {
      await _stopListening();
      await Future.delayed(const Duration(milliseconds: 200));
      await _speechToText.listen(
          onResult: _onSpeechResult,
          localeId: _selectedLocaleId,
          cancelOnError: false,
          partialResults: true,
          listenMode: ListenMode.dictation
      );
      setState(() {
        _speechEnabled = true;
      });
    } catch (e) {
      debugPrint(e.toString());
      await _stopListening();
      await Future.delayed(const Duration(milliseconds: 200));
      await _startListening();
    }
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  Future _stopListening() async {
    setState(() {
      _speechEnabled = false;
    });
    await _speechToText.stop();
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _currentWords = result.recognizedWords;
    });
    _activateSection();
  }
 

}
