import 'package:decorated_dropdownbutton/decorated_dropdownbutton.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';


class TestScreen2 extends StatefulWidget {
  @override
  _TestStateScreen2 createState() => _TestStateScreen2();
}

class _TestStateScreen2 extends State<TestScreen2> {
  late String _selectedItemCompCogn;
  late String _selectedItemAllPsicosi;
  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  bool _speechAvailable = false;
  bool _placeHolderComp = false;
  bool _placeHolderPsicosi = false;
  final String _textCompCogn = "Compromissione cognitiva";
  final String _textAllPsico = "Allucinazioni e psicosi";
  Color _dbgComp = Colors.white;
  Color _txtComp = Colors.black;
  Color _dbgAll = Colors.white;
  Color _txtAll = Colors.white;

  final String _selectedLocaleId = 'it_IT';

  final List<DropdownMenuItem<String>> _dropdownItems = [
    const DropdownMenuItem(value: '0', child: Text('Normale')),
    const DropdownMenuItem(value: '1', child: Text('Minimo')),
    const DropdownMenuItem(value: '2', child: Text('Lieve')),
    const DropdownMenuItem(value: '3', child: Text('Moderato')),
    const DropdownMenuItem(value: '4', child: Text('Grave')),
  ];

  /*final List<String> _dropdownItems = [
    'Normale',
    'Minimo',
    'Lieve',
    'Moderato',
    'Grave',
  ];*/

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
    'comporo',
    'cogni'
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
    _selectedItemCompCogn = "0";
    _selectedItemAllPsicosi = "0";
    _dbgComp = getDropdownBackgroundColor(_selectedItemCompCogn);
    _txtComp = getDropdownTextColor(_selectedItemCompCogn);
    _dbgAll = getDropdownBackgroundColor(_selectedItemAllPsicosi);
    _txtAll = getDropdownTextColor(_selectedItemAllPsicosi);
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
      body: Container(
        padding: const EdgeInsets.all(5.0),
        child:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 20),
              Text(
                _textCompCogn,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight:
                    _placeHolderComp ? FontWeight.bold : FontWeight.normal),
              ),
              DecoratedDropdownButton(
                value: _selectedItemCompCogn,
                items: _dropdownItems,
                onChanged: (value) async {
                  setState(() {
                    _selectedItemCompCogn = value.toString();
                    _dbgComp =
                        getDropdownBackgroundColor(value.toString());
                    _txtComp =
                        getDropdownTextColor(value.toString());
                  });
                  if (value != null) {
                    await _onDropdownChanged(value.toString(), "ddbAll");
                  }
                },
                color: _dbgComp,
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(5),
                style: TextStyle(
                  color: _txtComp,
                  fontSize: 20,
                ),
                icon: const Icon(Icons.arrow_drop_down),
                iconEnableColor: Colors.black,
                dropdownColor: _dbgComp,
              ),
              const SizedBox(height: 20),
              Text(
                _textAllPsico,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight:
                    _placeHolderPsicosi ? FontWeight.bold : FontWeight.normal),
              ),
              DecoratedDropdownButton(
                value: _selectedItemAllPsicosi,
                items: _dropdownItems,
                onChanged: (value) async {
                  setState(() {
                    _selectedItemAllPsicosi =  value.toString();
                    _dbgAll =
                        getDropdownBackgroundColor(value.toString());
                    _txtAll =
                        getDropdownTextColor(value.toString());
                  });
                  if (value != null) {
                    await _onDropdownChanged(value.toString(), "ddbAll");
                  }
                },
                color: _dbgAll,
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(5),
                style: TextStyle(
                  color: _txtAll,
                  fontSize: 20,
                ),
                icon: const Icon(Icons.arrow_drop_down),
                iconEnableColor: Colors.black,
                dropdownColor: _dbgAll,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:
        // If not yet listening for speech start, otherwise stop
        _speechToText.isNotListening ? _startListening : _stopListening,
        tooltip: 'Listen',
        child: Icon(_speechToText.isNotListening ? Icons.mic_off : Icons.mic),
      ),
    );
  }

  Color getDropdownBackgroundColor(String value) {
    debugPrint("getDropdownBackgroundColor: $value");
    switch (value) {
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

  Color getDropdownTextColor(String value) {
    debugPrint("getDropdownTextColor: $value");
    switch (value) {
      case '2':
      case '3':
        return Colors.black;
      case '1':
      case '4':
        return Colors.white;
      default:
        return Colors.black;
    }
  }

  Future _onDropdownChanged(String value, String dropName) async {
    switch(dropName){
      case "ddbComp":
        setState(() {
          _selectedItemCompCogn =  value.toString();
          _dbgComp = getDropdownBackgroundColor(value);
          _txtComp = getDropdownTextColor(value);
        });
        break;
      case "ddbAll":
        setState(() {
          _selectedItemAllPsicosi =  value.toString();
          _dbgAll = getDropdownBackgroundColor(value);
          _txtAll = getDropdownTextColor(value);
        });
        break;
    }

    await _stopAndStart();
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
    for (DropdownMenuItem<String> item in _dropdownItems) {
      final String itemText = (item.child as Text).data ?? '';
      if (itemText.toLowerCase().contains(voiceInput.toLowerCase())) {
        if (_placeHolderComp && _selectedItemCompCogn != item.value.toString()) {
          //_selectedItemCompCogn = item.value.toString();
          setState(() {
            _selectedItemCompCogn = item.value.toString();
          });
          _onDropdownChanged(item.value.toString(), "ddbComp");
        }
        if (_placeHolderPsicosi && _selectedItemAllPsicosi != item.value.toString()) {
          //_selectedItemAllPsicosi = item.value.toString();
          setState(() {
            _selectedItemAllPsicosi = item.value.toString();
          });
          _onDropdownChanged(item.value.toString(), "ddbAll");
        }

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
    //debugPrint("=================================================");
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

      if (_placeHolderComp || _placeHolderPsicosi) {
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
    await Future.delayed(const Duration(milliseconds: 500));
    await _startListening();
  }
}

class MyItem {
  final String value;
  final String text;

  MyItem({required this.value, required this.text});
}
