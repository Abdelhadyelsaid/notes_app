import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:keep_google/constants/colors.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechRecognizer extends StatefulWidget {
  const SpeechRecognizer({Key? key}) : super(key: key);

  @override
  _SpeechRecognizerState createState() => _SpeechRecognizerState();
}

class _SpeechRecognizerState extends State<SpeechRecognizer> {
  String _text = 'press and start speech to record';
  bool _isListening = false;
  late stt.SpeechToText _speech;
  double _confidence = 1;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          reverse: true,
          child: Container(
            child: Text(_text, style: TextStyle(fontSize: 30)),
            padding: EdgeInsets.all(20),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: _isListening,
        glowColor: primaryColor,
        endRadius: 75,
        duration: Duration(milliseconds: 2000),
        repeat: true,
        repeatPauseDuration: Duration(milliseconds: 100),
        child: FloatingActionButton(
          child: Icon(Icons.mic),
          onPressed: _listen,
        ),
      ),
    );
  }

  void _listen() async {
    if (!_isListening) {
      print("listening $_isListening");
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus :: $val'),
        onError: (val) => print('onError :: $val'),
        debugLogging: true,
      );
      print('available :: $available');
      if (available) {
        setState(() {
          _isListening = true;
        });
        var locales = await _speech.locales();
        print("locales :: ${locales[4].name}");
        _speech
            .listen(
              onResult: (val) {
                setState(() {
                  print(_text);
                  _text = val.recognizedWords;
                  if (val.hasConfidenceRating && val.confidence > 0)
                    _confidence = val.confidence;
                });
                print(val.confidence);
              },
              localeId: locales[4].localeId,
            )
            .then((val) {
              _isListening = false;
            });
      }
    } else {
      print('speech stopped');
      setState(() {
        _isListening = false;
      });
      _speech.stop();
    }
  }
}
