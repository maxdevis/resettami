import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';

class SpeechRecognitionUtil {
  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _currentWords = '';
  final String _selectedLocaleId = 'it_IT';

  bool get isSpeechEnabled => _speechEnabled;
  String get currentWords => _currentWords;

  Future<void> init() async {
    await _speechToText.initialize(
      onError: _errorListener,
      onStatus: _statusListener,
    );
  }

  Future<void> startListening() async {
    await stopListening();
    await Future.delayed(const Duration(milliseconds: 200));
    await _speechToText.listen(
      onResult: _onSpeechResult,
      localeId: _selectedLocaleId,
      cancelOnError: false,
      partialResults: true,
      listenMode: ListenMode.dictation,
    );
    _speechEnabled = true;
  }

  Future<void> stopListening() async {
    _speechEnabled = false;
    await _speechToText.stop();
  }

  void _errorListener(SpeechRecognitionError error) {
    debugPrint(error.errorMsg.toString());
  }

  void _statusListener(String status) async {
    debugPrint("status $status");
    if (status == "done" && _speechEnabled) {
      _currentWords += " $_currentWords";
      _currentWords = "";
      await startListening();
    }
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    _currentWords = result.recognizedWords;
  }
}
