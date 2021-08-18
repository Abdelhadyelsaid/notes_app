import 'package:speech_to_text/speech_to_text.dart';

class SpeechApi {
  static final _speech = SpeechToText();

  static toggleMicrophone({
    required onResult,
  }) async {
    bool available = await _speech.initialize();

    if (available) {
      _speech.listen(onResult: onResult);
    }
  }
}
