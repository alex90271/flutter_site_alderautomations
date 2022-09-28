import 'dart:convert';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'api.dart';

String api_var = '';

api(text, voiceName, languageCode) {
  TextToSpeechService service = TextToSpeechService(api_var);
  AudioPlayer _audioPlayer = AudioPlayer();

  Future mp3 = Future(() => service.textToSpeech(
      text: text,
      voiceName: voiceName,
      audioEncoding: 'MP3',
      languageCode: languageCode));

  mp3.then((file) {
    return file;
  });
}

class TextToSpeech extends StatelessWidget {
  const TextToSpeech({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MaterialButton(
          color: Colors.black87,
          onPressed: () => api(
              'Hello World', //text
              'en-US-Wavenet-D', //voice
              'en-US' //language
              ),
          child: const Text(
            'Download',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
