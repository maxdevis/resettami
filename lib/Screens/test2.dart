import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';

class TestScreen2 extends StatefulWidget {
  @override
  _TestStateScreen2 createState() => _TestStateScreen2();
}

class _TestStateScreen2 extends State<TestScreen2> {
  late MyItem _selectedItemCompCogn;
  late MyItem _selectedItemAllPsicosi;
  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  bool _speechAvailable = false;
  bool _placeHolderComp = false;
  bool _placeHolderPsicosi = false;
  final String _textCompCogn = "Compromissione cognitiva";
  final String _textAllPsico = "Allucinazioni e psicosi";
  Color _dropdownBackgroundColor = Colors.white;
  Color _dropdownTextColor = Colors.black;

  final String _selectedLocaleId = 'it_IT';
  final List<MyItem> _dropdownItems = [
    MyItem(value: '0', text: 'Normale'),
    MyItem(value: '1', text: 'Minimo'),
    MyItem(value: '2', text: 'Lieve'),
    MyItem(value: '3', text: 'Moderato'),
    MyItem(value: '4', text: 'Grave'),
  ];

  final List<String> _vocabolario = [
    'Normale',
    'Minimo',
    'Lieve',
    'Moderato',
    'Grave',
    'norm',
    'min',
    'lie',
    'mod'
  ];

  final List<String> _vcPhCompCogn = [
    'Compromissione cognitiva',
    'Compromissione',
    'cognitiva',
    'comporo', 'cogni'
  ];

  final List<String> _vcPhAllPsicosi = [
    'Allucinazioni e psicosi',
    'allucinazioni',
    'psicosi',
    'alluc'
  ];

  bool _isListening = false;

  @override
  void initState() {
    super.initState();
    _selectedItemCompCogn = _dropdownItems[0];
    _selectedItemAllPsicosi = _dropdownItems[0];
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
      appBar: AppBar(
        title: const Text('Pagina con Dropdown'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20),
            Text(_textCompCogn, style: TextStyle(fontSize: 20, fontWeight: _placeHolderComp ? FontWeight.bold : FontWeight.normal),),
            DropdownButton<MyItem?>(
              hint: Text(_textCompCogn),
              value: _selectedItemCompCogn,
              onChanged: (MyItem? newValue) async {
                setState(() {
                  _selectedItemCompCogn = newValue!;
                  _dropdownBackgroundColor = getDropdownBackgroundColor(_selectedItemCompCogn);
                  _dropdownTextColor = getDropdownTextColor(_selectedItemCompCogn);
                });
                if (newValue != null) {
                  await _stopAndStart();
                }
              },
              dropdownColor: _dropdownBackgroundColor,
              items: _dropdownItems.map((MyItem item) {
                return DropdownMenuItem<MyItem?>(
                  value: item,
                  child: Text(
                    item.text,
                    style: TextStyle(
                      color: item == _selectedItemCompCogn ? _dropdownTextColor : Colors.black,
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            Text(_textAllPsico, style: TextStyle(fontSize: 20, fontWeight: _placeHolderPsicosi ? FontWeight.bold : FontWeight.normal),),
            DropdownButton<MyItem?>(
              hint: Text(_textAllPsico),
              value: _selectedItemAllPsicosi,
              onChanged: (MyItem? newValue) async {
                setState(() {
                  _selectedItemAllPsicosi = newValue!;
                  _dropdownBackgroundColor = getDropdownBackgroundColor(_selectedItemAllPsicosi);
                  _dropdownTextColor = getDropdownTextColor(_selectedItemAllPsicosi);
                });
                if (newValue != null) {
                  await _stopAndStart();
                }
              },
              dropdownColor: _dropdownBackgroundColor,
              items: _dropdownItems.map((MyItem item) {
                return DropdownMenuItem<MyItem?>(
                  value: item,
                  child: Text(
                    item.text,
                    style: TextStyle(
                      color: item == _selectedItemAllPsicosi ? _dropdownTextColor : Colors.black,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Color getDropdownBackgroundColor(MyItem item){
    switch(item.value){
      case '1':
        return Colors.green;
      case '2':
        return Colors.yellow;
      case '3':
        return Colors.orange;
      case '4':
        return Colors.red;
      default:
        return Colors.white;
    }
  }

  Color getDropdownTextColor(MyItem item){
    switch(item.value){
      case '1':
      case '2':
      case '3':
        return Colors.black;
      case '4':
        return Colors.white;
      default:
        return Colors.black;
    }
  }

  bool containsAnyWord(String input, List<String> words) {
    for (String word in words) {
      if (input.toLowerCase().contains(word.toLowerCase())) {
        return true;
      }
    }
    return false;
  }

  Future<void> _selectItemWithVoice(String voiceInput) async {
    for (MyItem item in _dropdownItems) {
      if (item.text.toLowerCase().contains(voiceInput.toLowerCase())) {
        setState(() {
          if (_placeHolderComp) {
            _selectedItemCompCogn = item;
          }
          if (_placeHolderPsicosi) {
            _selectedItemAllPsicosi = item;
          }
        });
        break;
      }
    }
  }

  void errorListener(SpeechRecognitionError error) {
    debugPrint(error.errorMsg.toString());
    _stopAndStart();
  }

  void statusListener(String status) async {
    debugPrint("status $status");
    if (status == "done" && _speechEnabled) {
      setState(() {
        _speechEnabled = false;
      });
      await _startListening();
    }
  }

  void _initSpeech() async {
    _speechAvailable = await _speechToText.initialize(
      onError: errorListener,
      onStatus: statusListener,
    );

    if (_speechAvailable) {
      await _startListening();
    }

    setState(() {});
  }

  Future<void> _startListening() async {
    debugPrint("=================================================");
    if (!_isListening) {
      try {
        await _speechToText.listen(
          onResult: _onSpeechResult,
          localeId: _selectedLocaleId,
          cancelOnError: false,
          partialResults: true,
          listenMode: ListenMode.dictation,
        );
        setState(() {
          _speechEnabled = true;
          _isListening = true;
        });
      } catch (e) {
        debugPrint(e.toString());
        await _stopAndStart();
      }
    }
  }

  Future<void> _stopListening() async {
    if (_isListening) {
      setState(() {
        _speechEnabled = false;
        _isListening = false;
      });
      await _speechToText.stop();
    }
  }

  Future _onSpeechResult(SpeechRecognitionResult result) async {
    try {
      final recognizedWords = result.recognizedWords;

      if (!_placeHolderComp) {
        if (containsAnyWord(recognizedWords.toLowerCase(), _vcPhCompCogn)) {
          setState(() {
            _placeHolderPsicosi = false;
            _placeHolderComp = true;
          });
          return;
        }
      }

      if (!_placeHolderPsicosi) {
        if (containsAnyWord(recognizedWords.toLowerCase(), _vcPhAllPsicosi)) {
          _selectItemWithVoice(recognizedWords);
          setState(() {
            _placeHolderPsicosi = true;
            _placeHolderComp = false;
          });
          return;
        }
      }

      if(_placeHolderComp || _placeHolderPsicosi){
        _selectItemWithVoice(recognizedWords);
      }

    } catch (e) {
      debugPrint(e.toString());
    } finally {
      await _stopAndStart();
    }
  }

  Future<void> _stopAndStart() async {
    await _stopListening();
    await Future.delayed(const Duration(milliseconds: 200));
    await _startListening();
  }
}

class MyItem {
  final String value;
  final String text;

  MyItem({required this.value, required this.text});
}
