import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechToTextService {
  static final SpeechToTextService _singleton = SpeechToTextService._internal();

  late stt.SpeechToText _speech;
  bool _isListening = false;

  factory SpeechToTextService() {
    return _singleton;
  }

  SpeechToTextService._internal() {
    _speech = stt.SpeechToText();
  }

  bool get isListening => _isListening;

  void startListening(void Function(String) onResult) {
    _speech.listen(
      onResult: (result) {
        onResult(result.recognizedWords);
      },
    );
    _isListening = true;
  }

  void stopListening() {
    _speech.stop();
    _isListening = false;
  }
}

