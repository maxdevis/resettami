import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';

class testScreen2 extends StatefulWidget {
  @override
  testStateScreen2 createState() => testStateScreen2();
}

class testStateScreen2 extends State<testScreen2> {
  late MyItem _selectedItem;
  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  bool _speechAvailable = false;
  String _currentWords = '';
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

  bool _isListening = false;

  @override
  void initState() {
    super.initState();
    _selectedItem = _dropdownItems[0];
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
            const Text(
              'Seleziona un elemento:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            DropdownButton<MyItem?>(
              value: _selectedItem,
              onChanged: (MyItem? newValue) async {
                setState(() {
                  _selectedItem = newValue!;
                  _currentWords = "";
                });
                if (newValue != null) {
                  await _stopAndStart();
                }
              },
              items: _dropdownItems.map((MyItem item) {
                return DropdownMenuItem<MyItem?>(
                  value: item,
                  child: Text(item.text),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  bool containsAnyWord(String input, List<String> words) {
    for (String word in words) {
      if (input.toLowerCase().contains(word.toLowerCase())) {
        return true;
      }
    }
    return false;
  }

  Future _selectItemWithVoice(String voiceInput) async {
    for (MyItem item in _dropdownItems) {
      if (item.text.toLowerCase().contains(voiceInput.toLowerCase())) {
        setState(() {
          _currentWords = item.text;
          _selectedItem = item;
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
        _currentWords = "";
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

  Future _startListening() async {
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

  Future _stopListening() async {
    if (_isListening) {
      setState(() {
        _speechEnabled = false;
        _isListening = false;
      });
      await _speechToText.stop();
    }
  }

  Future _onSpeechResult(SpeechRecognitionResult result) async {
    final recognizedWords = result.recognizedWords;
    if (_currentWords.toLowerCase() != recognizedWords.toLowerCase() &&
        containsAnyWord(recognizedWords.toLowerCase(), _vocabolario)) {
      _selectItemWithVoice(recognizedWords);
      await _stopAndStart();
    }
  }

  Future _stopAndStart() async {
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
